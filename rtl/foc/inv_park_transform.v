// 逆Park变换模块
module inv_park_transform(
    input  wire clk,
    input  wire rst_n,
    input  wire i_valid,
    input  wire signed [15:0] i_vd, i_vq,     // 旋转坐标系电压
    input  wire signed [15:0] i_sin, i_cos,   // 正余弦值
    output reg  signed [15:0] o_valpha, o_vbeta, // 静止坐标系电压
    output reg  o_valid
);

    // 中间寄存器 - 扩展位宽防止溢出
    reg signed [31:0] vd_cos, vq_sin;
    reg signed [31:0] vd_sin, vq_cos;
    reg signed [31:0] valpha_temp, vbeta_temp;
    reg valid_d1, valid_d2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // 复位所有信号
            vd_cos <= 0; vq_sin <= 0;
            vd_sin <= 0; vq_cos <= 0;
            valpha_temp <= 0; vbeta_temp <= 0;
            o_valpha <= 0; o_vbeta <= 0;
            o_valid <= 0;
            valid_d1 <= 0; valid_d2 <= 0;
        end else begin
            valid_d1 <= i_valid;
            valid_d2 <= valid_d1;
            o_valid <= valid_d2;
            
            if (i_valid) begin
                // 第一拍：乘法运算 (Q15 × Q15 = Q30)
                // Valpha = Vd*cosθ - Vq*sinθ
                vd_cos <= i_vd * i_cos;
                vq_sin <= i_vq * i_sin;
                
                // Vbeta = Vd*sinθ + Vq*cosθ  
                vd_sin <= i_vd * i_sin;
                vq_cos <= i_vq * i_cos;
            end
            
            if (valid_d1) begin
                // 第二拍：加减法运算 (Q30 ± Q30 = Q30)
                valpha_temp <= vd_cos - vq_sin;
                vbeta_temp <= vd_sin + vq_cos;
            end
            
            if (valid_d2) begin
                // 第三拍：缩放回Q15格式 (右移15位)并饱和处理
                o_valpha <= saturate_shift(valpha_temp, 15);
                o_vbeta <= saturate_shift(vbeta_temp, 15);
            end
        end
    end
    
    // 饱和处理函数：有符号数右移并防止溢出
    function signed [15:0] saturate_shift(input signed [31:0] value, input integer shift);
        reg signed [31:0] shifted;
        begin
            shifted = value >>> shift;  // 算术右移保持符号
            
            // Q15格式范围：-32768 到 32767
            if (shifted > 32'sd32767)
                saturate_shift = 16'sd32767;
            else if (shifted < -32'sd32768) 
                saturate_shift = -16'sd32768;
            else
                saturate_shift = shifted[15:0];
        end
    endfunction
endmodule