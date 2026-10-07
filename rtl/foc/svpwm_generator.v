`timescale 1ns / 1ps
module svpwm_generator(
    input  wire clk,
    input  wire rst_n,
    input  wire i_valid,
    input  wire signed [15:0] v_alpha,
    input  wire signed [15:0] v_beta,
    output reg  o_valid,
    output reg  signed [15:0] cmp_a, 
    output reg  signed [15:0] cmp_b,
    output reg  signed [15:0] cmp_c
);

    // 参数定义
    localparam signed [15:0] SQRT3_DIV2 = 16'd28377;    // sqrt(3)/2 * 32768 ≈ 0.8660 * 32768
    localparam signed [15:0] HALF        = 16'd16384;    // 0.5 * 32768
    localparam signed [15:0] MAX_MAGNITUDE = 16'd30000;  // 最大幅值限制
    
    // 内部信号 - 使用足够位宽防止溢出
    reg signed [31:0] va_32, vb_32, vc_32;
    reg signed [31:0] v_max, v_min, v_com;
    reg signed [31:0] beta_mult_res;
    reg signed [31:0] alpha_half;
    
    // 限幅函数
    function signed [15:0] clamp(input signed [31:0] value);
        begin
            if (value > MAX_MAGNITUDE)
                clamp = MAX_MAGNITUDE;
            else if (value < -MAX_MAGNITUDE)
                clamp = -MAX_MAGNITUDE;
            else
                clamp = value[15:0];
        end
    endfunction
    
    // Max/Min 查找函数
    function signed [31:0] max3(input signed [31:0] a, b, c);
        reg signed [31:0] ab_max;
        begin
            ab_max = (a > b) ? a : b;
            max3 = (ab_max > c) ? ab_max : c;
        end
    endfunction
    
    function signed [31:0] min3(input signed [31:0] a, b, c);
        reg signed [31:0] ab_min;
        begin
            ab_min = (a < b) ? a : b;
            min3 = (ab_min < c) ? ab_min : c;
        end
    endfunction

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            o_valid <= 0; 
            cmp_a <= 0; cmp_b <= 0; cmp_c <= 0;
            beta_mult_res <= 0;
            alpha_half <= 0;
        end else begin
            if (i_valid) begin
                // 【关键修改1】使用32位计算防止精度丢失
                // 计算 Beta * sqrt(3)/2，保留完整精度
                beta_mult_res = v_beta * SQRT3_DIV2;
                
                // 计算 Alpha/2，使用乘法而不是右移以保持精度
                alpha_half = v_alpha * HALF;
                
                // 第二步：Inverse Clarke变换（32位计算）
                // Va = Valpha
                va_32 = { {16{v_alpha[15]}}, v_alpha }; // 符号扩展至32位
                
                // Vb = -0.5*Valpha + (sqrt(3)/2)*Vbeta  
                vb_32 = -alpha_half + (beta_mult_res); // 注意这里不立即右移
                
                // Vc = -0.5*Valpha - (sqrt(3)/2)*Vbeta
                vc_32 = -alpha_half - (beta_mult_res);
                
                // 【关键修改2】统一缩放至16位
                // 将32位结果缩放回Q15格式（右移15位）
                va_32 = va_32; // Va保持不变
                vb_32 = vb_32 >>> 15; // 缩放至Q15
                vc_32 = vc_32 >>> 15; // 缩放至Q15
                
                // 第三步：SVPWM 马鞍波生成（零序分量注入）
                v_max = max3(va_32, vb_32, vc_32);
                v_min = min3(va_32, vb_32, vc_32);
                
                // 计算共模分量：v_com = -(v_max + v_min)/2
                // 【关键修改3】改进共模计算，防止过度衰减
                v_com = -(v_max + v_min);
                v_com = v_com >>> 1; // 除以2
                
                // 第四步：添加共模分量并限幅
                cmp_a <= clamp(va_32 + v_com);
                cmp_b <= clamp(vb_32 + v_com);
                cmp_c <= clamp(vc_32 + v_com);
                
                o_valid <= 1;
            end else begin
                o_valid <= 0;
            end
        end
    end
endmodule