`timescale 1ns / 1ps
module clarke_transform(
    input  wire clk,
    input  wire rst_n,
    input  wire i_valid,          
    input  wire signed [15:0] i_a, 
    input  wire signed [15:0] i_b, 
    output reg  o_valid,          
    output reg  signed [15:0] i_alpha,
    output reg  signed [15:0] i_beta
);

    // 1/sqrt(3) in Q15 format: 0.57735 * 32768 = 18918
    localparam signed [15:0] INV_SQRT3 = 16'd18918;
    
    // 中间变量定义
    // sum_ab 需要 18 位以防止 (Ia + 2*Ib) 溢出
    // range: -32768*3 = -98304, need 18 bits (min -131072)
    reg signed [17:0] sum_ab; 
    
    // 乘法结果：18位 * 16位 = 34位，但在Q15范围内32位通常勉强够用
    // 为了绝对安全，建议使用更宽的变量，或者确信不会达到满量程。
    // 这里使用 32 位是因为 98301 * 18918 = 1,859,658,318 < 21.4亿 (int32 max)，
    // 所以 32 位在这个特定应用中是安全的。
    reg signed [31:0] mult_beta; 

    // 对齐 Alpha 的延时寄存器
    reg signed [15:0] alpha_d1;
    reg valid_d1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            o_valid   <= 0;
            i_alpha   <= 0;
            i_beta    <= 0;
            sum_ab    <= 0;
            mult_beta <= 0;
            valid_d1  <= 0;
            alpha_d1  <= 0;
        end else begin
            // =============================================
            // 第一级流水线：加法运算 (处理溢出是关键)
            // =============================================
            if (i_valid) begin
                // 1. Alpha 不需要计算，直接打拍暂存，等待 Beta 算完
                alpha_d1 <= i_a;
                
                // 2. Beta 中间项计算: sum = Ia + 2*Ib
                // 关键点：{{2{bit}}, val} 进行显式符号扩展，确保在 18 位下运算
                sum_ab <= {{2{i_a[15]}}, i_a} + ({{2{i_b[15]}}, i_b} <<< 1);
                
                valid_d1 <= 1'b1;
            end else begin
                valid_d1 <= 1'b0;
            end

            // =============================================
            // 第二级流水线：乘法与输出
            // =============================================
            if (valid_d1) begin
                // Alpha 直接输出
                i_alpha <= alpha_d1;

                // Beta 乘法: (Sum * 1/sqrt3)
                // sum_ab 是 18 位，INV_SQRT3 是 16 位，结果存入 32 位
                // 注意：这里利用 Verilog 自动位宽扩展，因为 mult_beta 是 32 位
                // 最好写成显式乘法
                mult_beta = sum_ab * INV_SQRT3; // 阻塞赋值给临时变量计算更清晰，或者直接算

                // 移位输出 (Q15格式)
                i_beta <= mult_beta >>> 15;
                
                o_valid <= 1'b1;
            end else begin
                o_valid <= 1'b0;
            end
        end
    end

endmodule