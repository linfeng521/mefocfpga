`timescale 1ns / 1ps
module park_transform(
    input  wire sys_clk_i,        // 建议统一时钟命名
    input  wire sys_rst_n_i,
    input  wire i_valid,
    input  wire signed [15:0] i_alpha,
    input  wire signed [15:0] i_beta,
    input  wire signed [15:0] i_sin,
    input  wire signed [15:0] i_cos,
    output reg  o_valid,
    output reg  signed [15:0] o_id,
    output reg  signed [15:0] o_iq
);

    // ==========================================
    // 定义 32 位中间变量，防止乘法溢出截断
    // ==========================================
    reg signed [31:0] mul_alpha_cos;
    reg signed [31:0] mul_beta_sin;
    reg signed [31:0] mul_alpha_sin;
    reg signed [31:0] mul_beta_cos;
    
    // 用于打拍对齐的有效信号
    reg valid_d1;

    always @(posedge sys_clk_i or negedge sys_rst_n_i) begin
        if (!sys_rst_n_i) begin
            o_valid <= 0;
            o_id <= 0;
            o_iq <= 0;
            valid_d1 <= 0;
            mul_alpha_cos <= 0;
            mul_beta_sin <= 0;
            mul_alpha_sin <= 0;
            mul_beta_cos <= 0;
        end else begin
            // ------------------------------------
            // 第一级流水线：执行乘法 (扩展到 32 位)
            // ------------------------------------
            if (i_valid) begin
                // 显式计算 32 位乘法结果
                mul_alpha_cos <= i_alpha * i_cos;
                mul_beta_sin  <= i_beta * i_sin;
                mul_alpha_sin <= i_alpha * i_sin;
                mul_beta_cos  <= i_beta * i_cos;
                valid_d1      <= 1'b1;
            end else begin
                valid_d1      <= 1'b0;
            end

            // ------------------------------------
            // 第二级流水线：加减法 + 移位
            // ------------------------------------
            if (valid_d1) begin
                // Id = (Alpha*Cos + Beta*Sin)
                // 这里操作数是32位的，加法结果也是32位，然后再右移，保留有效位
                o_id <= (mul_alpha_cos + mul_beta_sin) >>> 15;
                
                // Iq = (-Alpha*Sin + Beta*Cos)
                o_iq <= (mul_beta_cos - mul_alpha_sin) >>> 15;
                
                o_valid <= 1'b1;
            end else begin
                o_valid <= 1'b0;
            end
        end
    end

endmodule