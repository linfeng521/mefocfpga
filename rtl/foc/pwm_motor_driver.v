`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/08/07 09:56:34
// Design Name: 
// Module Name: pwm_motor_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pwm_motor_driver #(
    parameter SYS_CLK_FREQ = 50_000_000, // 系统时钟 50MHz
    parameter PWM_FREQ     = 50_000,     // PWM 频率 50kHz (周期 20us)
    parameter DEADTIME_NS  = 30          // LMG2100 死区时间要求 (30ns)
)(
    input  wire        clk,
    input  wire        rst_n,

    // --- 比较值输入 (范围 0 ~ PWM_PRD) ---
    input  wire [15:0] cmp_u,
    input  wire [15:0] cmp_v,
    input  wire [15:0] cmp_w,

    // --- 周期更新标志脉冲 ---
    output reg         pwm_update_tick,

    // --- 三相带死区互补驱动输出 ---
    output wire        pwm_u_h, output wire pwm_u_l,
    output wire        pwm_v_h, output wire pwm_v_l,
    output wire        pwm_w_h, output wire pwm_w_l
);

    // ==========================================
    // 参数计算与死区安全控制
    // ==========================================
    // 中心对齐模式下，半周期计数值上限 (50MHz / 100kHz = 500)
    localparam PWM_PRD = SYS_CLK_FREQ / (PWM_FREQ * 2);
    
    // 时钟周期 = 20ns。30ns 死区需要 (30 + 19)/20 = 2 个时钟周期 (40ns，安全覆盖 30ns)
    localparam DT_CNT = (DEADTIME_NS * (SYS_CLK_FREQ / 1000) + 999_999) / 1_000_000;
    
    // 死区脉宽预补偿值 (补偿上管开启延迟)
    localparam DT_COMP_VAL = (DT_CNT + 1) / 2;

    // ==========================================
    // 中心对齐三角载波生成器 (Up-Down Counter)
    // ==========================================
    reg [15:0] cnt;
    reg        dir; // 0: Up, 1: Down

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt             <= 16'd0;
            dir             <= 1'b0;
            pwm_update_tick <= 1'b0;
        end else begin
            pwm_update_tick <= 1'b0; // 默认清零
            
            if (!dir) begin
                if (cnt >= PWM_PRD - 1) begin
                    dir             <= 1'b1;
                    pwm_update_tick <= 1'b1; // 顶峰位置发出周期同步脉冲
                end else begin
                    cnt <= cnt + 1'b1;
                end
            end else begin
                if (cnt <= 16'd1) begin
                    dir <= 1'b0;
                end else begin
                    cnt <= cnt - 1'b1;
                end
            end
        end
    end

    // ==========================================
    // 比较器与硬件死区预补偿
    // ==========================================
    wire [15:0] comp_u = (cmp_u == 0) ? 16'd0 : (cmp_u + DT_COMP_VAL);
    wire [15:0] comp_v = (cmp_v == 0) ? 16'd0 : (cmp_v + DT_COMP_VAL);
    wire [15:0] comp_w = (cmp_w == 0) ? 16'd0 : (cmp_w + DT_COMP_VAL);

    wire ideal_pwm_u = (cnt < comp_u);
    wire ideal_pwm_v = (cnt < comp_v);
    wire ideal_pwm_w = (cnt < comp_w);

    // ==========================================
    // 三相硬件死区发生器例化
    // ==========================================
    deadtime_gen #(.DT_CNT(DT_CNT)) dt_u (
        .clk(clk), .rst_n(rst_n), .pwm_in(ideal_pwm_u),
        .pwm_out_h(pwm_u_h), .pwm_out_l(pwm_u_l)
    );
    
    deadtime_gen #(.DT_CNT(DT_CNT)) dt_v (
        .clk(clk), .rst_n(rst_n), .pwm_in(ideal_pwm_v),
        .pwm_out_h(pwm_v_h), .pwm_out_l(pwm_v_l)
    );
    
    deadtime_gen #(.DT_CNT(DT_CNT)) dt_w (
        .clk(clk), .rst_n(rst_n), .pwm_in(ideal_pwm_w),
        .pwm_out_h(pwm_w_h), .pwm_out_l(pwm_w_l)
    );

endmodule


// ==========================================
// 死区发生器子模块
// (延迟上升沿，立即关断下降沿)
// ==========================================
module deadtime_gen #(
    parameter DT_CNT = 2
)(
    input  wire clk,
    input  wire rst_n,
    input  wire pwm_in,
    output reg  pwm_out_h,
    output reg  pwm_out_l
);
    reg [7:0] dt_counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pwm_out_h  <= 1'b0;
            pwm_out_l  <= 1'b0;
            dt_counter <= 8'd0;
        end else begin
            if (pwm_in) begin
                pwm_out_l <= 1'b0; // 下管立即关断
                if (dt_counter < DT_CNT) begin
                    dt_counter <= dt_counter + 1'b1;
                    pwm_out_h  <= 1'b0; // 等待死区时间
                end else begin
                    pwm_out_h  <= 1'b1; // 上管延时导通
                end
            end else begin
                pwm_out_h <= 1'b0; // 上管立即关断
                if (dt_counter > 0) begin
                    dt_counter <= dt_counter - 1'b1;
                    pwm_out_l  <= 1'b0; // 等待死区时间
                end else begin
                    pwm_out_l  <= 1'b1; // 下管延时导通
                end
            end
        end
    end
endmodule


