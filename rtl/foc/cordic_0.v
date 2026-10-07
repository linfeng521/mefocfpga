`timescale 1ns / 1ps

module cordic_0 (
    input  wire        aclk,
    input  wire        s_axis_phase_tvalid,
    input  wire [15:0] s_axis_phase_tdata,  // 输入角度 (Scaled Radians)
    output wire        m_axis_dout_tvalid,
    output wire [31:0] m_axis_dout_tdata    // 高16位SIN，低16位COS
);

    // =========================================================
    // 参数定义
    // =========================================================
    parameter PIPELINE_stages = 16;
    
    // CORDIC 增益 K ≈ 1.64676
    // 为了输出幅值约为 1 (即 32767)，初始 X 需设为 32767 * (1/K) ≈ 32767 * 0.60725
    // X_START = 19898
    localparam signed [15:0] X_START = 16'd19800;
    localparam signed [15:0] Y_START = 16'd0;

    // ATAN 查找表 (对应 16位 Scaled Radians, PI = 32768)
    // atan(2^-i)
    reg [15:0] atan_table [0:15];
    initial begin
        atan_table[0]  = 16'd8192; // 45.000 deg
        atan_table[1]  = 16'd4836; // 26.565 deg
        atan_table[2]  = 16'd2555; // 14.036 deg
        atan_table[3]  = 16'd1297; // 7.125 deg
        atan_table[4]  = 16'd651;  // 3.576 deg
        atan_table[5]  = 16'd325;  // 1.790 deg
        atan_table[6]  = 16'd163;  // 0.895 deg
        atan_table[7]  = 16'd81;   // 0.448 deg
        atan_table[8]  = 16'd40;   // 0.224 deg
        atan_table[9]  = 16'd20;   // 0.112 deg
        atan_table[10] = 16'd10;   // 0.056 deg
        atan_table[11] = 16'd5;
        atan_table[12] = 16'd3;
        atan_table[13] = 16'd1;
        atan_table[14] = 16'd1;
        atan_table[15] = 16'd0;
    end

    // =========================================================
    // 内部信号：流水线寄存器
    // =========================================================
    // x, y, z 数组用于存储每一级的中间结果
    // 索引 0 是输入预处理，1-16 是迭代级
    reg signed [15:0] x [0:16];
    reg signed [15:0] y [0:16];
    reg signed [15:0] z [0:16];
    reg               valid_pipe [0:16];

    integer i;

    // =========================================================
    // 主逻辑
    // =========================================================
    always @(posedge aclk) begin
        
        // --- Stage 0: 象限预处理 (Quadrant Correction) ---
        // CORDIC 标准算法只能处理 -90 到 +90 度。
        // 为了支持 0-360 度 (即全范围 -180 到 +180)，我们需要对输入做预处理。
        // 如果输入角度在第2、3象限 (即绝对值 > 90度)，我们需要翻转 X 和 Y 的符号。
        // 在二进制补码中，最高两位为 01 (正, >90) 或 10 (负, <-90) 时表示在范围外。
        
        valid_pipe[0] <= s_axis_phase_tvalid;
        
        // 检查输入角度的前两位
        if (s_axis_phase_tdata[15:14] == 2'b01 || s_axis_phase_tdata[15:14] == 2'b10) begin
            // 超过 +/- 90度范围：
            // 1. 初始 X 取负
            x[0] <= -X_START; 
            y[0] <= Y_START;
            // 2. 角度翻转 (减去或加上 180度，在二进制里就是翻转最高位 MSB)
            z[0] <= {~s_axis_phase_tdata[15], s_axis_phase_tdata[14:0]};
        end else begin
            // 在 +/- 90度范围内：
            x[0] <= X_START;
            y[0] <= Y_START;
            z[0] <= s_axis_phase_tdata;
        end


        // --- Stage 1 to 16: CORDIC 迭代 ---
        for (i = 0; i < 16; i = i + 1) begin
            valid_pipe[i+1] <= valid_pipe[i]; // 传递 Valid 信号
            
            // 核心算法：判断 Z 的符号
            // 如果 Z >= 0 (正角度)，顺时针旋转，减去角度
            // 如果 Z < 0  (负角度)，逆时针旋转，加上角度
            if (z[i][15] == 1'b0) begin 
                x[i+1] <= x[i] - (y[i] >>> i); // 算术右移
                y[i+1] <= y[i] + (x[i] >>> i);
                z[i+1] <= z[i] - atan_table[i];
            end else begin
                x[i+1] <= x[i] + (y[i] >>> i);
                y[i+1] <= y[i] - (x[i] >>> i);
                z[i+1] <= z[i] + atan_table[i];
            end
        end

    end

    // =========================================================
    // 输出赋值
    // =========================================================
    // x 最终收敛为 Cos * K，y 最终收敛为 Sin * K
    // 你的 TB 期望高 16 位是 Sin，低 16 位是 Cos
    assign m_axis_dout_tdata = {y[16], x[16]};
    assign m_axis_dout_tvalid = valid_pipe[16];

endmodule