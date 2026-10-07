`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: timer_top (通用定时器模块)
//////////////////////////////////////////////////////////////////////////////////

module timer_top #(
    parameter       DEFAULT_ARR     = 16'd1500  ,  
    parameter       DEFAULT_CCR     = 16'd750   ,  
    parameter       COUNT_MODE      = "UP"      ,  // UP  DOWN  CENTRE
    parameter       TRIG_ENALBE     = "ENABLE"  ,  
    parameter       PWM_OUT         = "NONE"    ,  
    parameter       PWM_OUT_MODE    = "MODE1"      
)(
    input           sys_clk_i           ,  
    input           sys_rst_n_i         ,

    input           timer_wr_type_i     ,
    input           timer_write_en_i    ,
    input[15:0]     timer_write_data_i  , 
    input           timer_read_en_i     ,
    output[15:0]    timer_read_data_o   ,

    output          timer_trig_o        , 
    output          adc_center_trig_o   , // 中心对齐模式下的 ADC 触发信号
    output          timer_pwm_o         ,
    
    output [15:0]   CCR_OUT,
    output [15:0]   ARR_OUT,
    output [15:0]   CCR_SHADOW_OUT
);

    reg[15:0]   CNT;
    reg[15:0]   ARR; 
    reg[15:0]   CCR; 
    reg[15:0]   CCR_SHADOW; 
    reg         center_direct;

    assign CCR_OUT        = CCR;
    assign ARR_OUT        = ARR;
    assign CCR_SHADOW_OUT = CCR_SHADOW;

    // 保留原有的比较匹配触发逻辑
    assign timer_trig_o = ( TRIG_ENALBE == "ENABLE" && CNT == CCR_SHADOW ) ? 1'b1 : 1'b0;

    // =========================================================
    // 【修改点】展宽 ADC 转换触发脉冲
    // =========================================================
    // 原逻辑仅在 CNT == 1 时拉高一个时钟周期（约 20 ns），可能不足以触发 AD7606。
    // 新逻辑在 CNT 为 1~3 期间保持高电平（约 60 ns），留出充足裕量。
    // 仅在中心对齐模式的向上计数阶段触发，避免一个 PWM 周期内重复触发。
    assign adc_center_trig_o = (COUNT_MODE == "CENTRE" && CNT >= 16'd1 && CNT <= 16'd3 && center_direct == 1'b0) ? 1'b1 : 1'b0;

    assign timer_pwm_o =  ( PWM_OUT_MODE == "MODE1" && CNT < CCR_SHADOW) ? 1'b1 :
                          ( PWM_OUT_MODE == "MODE1"                    ) ? 1'b0 :
                          ( PWM_OUT_MODE == "MODE2" && CNT < CCR_SHADOW) ? 1'b0 :
                          ( PWM_OUT_MODE == "MODE2"                    ) ? 1'b1 : 1'b0;

    // --- 寄存器写逻辑（保持不变）---
    always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
        if( sys_rst_n_i == 1'b0 ) ARR <= DEFAULT_ARR;
        else if( timer_wr_type_i == 1'b0 && timer_write_en_i == 1'b1 ) ARR <= timer_write_data_i;
    end

    always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
        if( sys_rst_n_i == 1'b0 ) CCR <= DEFAULT_CCR;
        else if( timer_wr_type_i == 1'b1 && timer_write_en_i == 1'b1 ) CCR <= timer_write_data_i;
    end

always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 ) begin
        CCR_SHADOW <= 16'd0; // 复位时强行清零
    end else begin
        if( COUNT_MODE == "UP" ) begin
             if( CNT == ARR - 1'b1) CCR_SHADOW <= CCR;
        end else if( COUNT_MODE == "DOWN" ) begin
             if( CNT == 16'd0) CCR_SHADOW <= CCR;
        end else if( COUNT_MODE == "CENTRE" ) begin
             if( CNT == 16'd1 && center_direct == 1'b1 ) CCR_SHADOW <= CCR;
        end
    end
end

    always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
        if( sys_rst_n_i == 1'b0 ) center_direct <= 1'b0;
        else if( COUNT_MODE == "CENTRE" ) begin
            if( CNT == ARR - 1'b1 && center_direct == 1'b0) center_direct <= 1'b1;
            else if( CNT == 1'b1 && center_direct == 1'b1) center_direct <= 1'b0;
        end
    end

    always @( posedge sys_clk_i or negedge sys_rst_n_i ) begin
        if( sys_rst_n_i == 1'b0 ) CNT <= 16'd0;
        else if( COUNT_MODE == "UP" ) begin
            if( CNT == ARR - 1'b1) CNT <= 16'd0; else CNT <= CNT + 1'b1;
        end else if( COUNT_MODE == "DOWN" ) begin
            if( CNT == 16'd0 ) CNT <= ARR -1'b1; else CNT <= CNT - 1'b1;
        end else if( COUNT_MODE == "CENTRE" ) begin
            if( center_direct == 1'b0 ) CNT <= CNT + 1'b1; else CNT <= CNT - 1'b1;
        end
    end

endmodule


// `timescale 1ns / 1ps

// module timer_top #(
//     parameter       DEFAULT_ARR     = 16'd1500  ,  
//     parameter       DEFAULT_CCR     = 16'd750   ,  
//     parameter       COUNT_MODE      = "UP"      ,  // UP  DOWN  CENTRE
//     parameter       TRIG_ENALBE     = "ENABLE"  ,  
//     parameter       PWM_OUT         = "NONE"    ,  
//     parameter       PWM_OUT_MODE    = "MODE1"      
// )(
//     input           sys_clk_i       ,  
//     input           sys_rst_n_i     ,

//     input           timer_wr_type_i ,
//     input           timer_write_en_i,
//     input[15:0]     timer_write_data_i, 
//     input           timer_read_en_i ,
//     output[15:0]    timer_read_data_o,

//     output          timer_trig_o        , 
//     output          adc_center_trig_o   , 
//     output          timer_pwm_o         ,
    
//     output [15:0]   CCR_OUT,
//     output [15:0]   ARR_OUT,
//     output [15:0]   CCR_SHADOW_OUT
// );

//     reg[15:0]   CNT;
//     reg[15:0]   ARR; 
//     reg[15:0]   CCR; 
//     reg[15:0]   CCR_SHADOW; 
//     reg         center_direct;

//     assign CCR_OUT        = CCR;
//     assign ARR_OUT        = ARR;
//     assign CCR_SHADOW_OUT = CCR_SHADOW;

//     // 瑙﹀彂閫昏緫
//     assign timer_trig_o = ( TRIG_ENALBE == "ENABLE" && CNT == CCR_SHADOW ) ? 1'b1 : 1'b0;

//     // ADC 瑙﹀彂
//     assign adc_center_trig_o = (COUNT_MODE == "CENTRE" && CNT >= 16'd1 && CNT <= 16'd3 && center_direct == 1'b0) ? 1'b1 : 1'b0;

//     // PWM 杈撳嚭
//     assign timer_pwm_o =  ( PWM_OUT_MODE == "MODE1" && CNT < CCR_SHADOW) ? 1'b1 :
//                           ( PWM_OUT_MODE == "MODE1"                    ) ? 1'b0 :
//                           ( PWM_OUT_MODE == "MODE2" && CNT < CCR_SHADOW) ? 1'b0 :
//                           ( PWM_OUT_MODE == "MODE2"                    ) ? 1'b1 : 1'b0;

//     // --- 瀵勫瓨鍣ㄥ啓閫昏緫 ---
    
//     // ARR 鍐欓?昏緫 (閫氬父涓嶉渶瑕侀檺骞咃紝闄ら潪浣犳湁鏈?灏忓懆鏈熼檺鍒?)
//     always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
//         if( sys_rst_n_i == 1'b0 ) ARR <= DEFAULT_ARR;
//         else if( timer_wr_type_i == 1'b0 && timer_write_en_i == 1'b1 ) ARR <= timer_write_data_i;
//     end

//     // [淇�鏀归噸鐐筣 CCR 鍐欓?昏緫锛氬�炲姞纭�浠堕檺骞?
//     always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
//         if( sys_rst_n_i == 1'b0 ) begin
//             CCR <= DEFAULT_CCR;
//         end
//         else if( timer_wr_type_i == 1'b1 && timer_write_en_i == 1'b1 ) begin
//             // 纭�浠堕檺骞呬繚鎶わ細濡傛灉鍐欏叆�?煎ぇ浜庡綋鍓嶅懆鏈? ARR锛屽垯寮哄埗绛変簬 ARR
//             // 杩欐牱鍗充娇 PID 绠楅�炰簡锛孭WM 鍗犵┖姣斾篃鏈?澶? 100%锛屼笉浼氬嚭鐜伴?昏緫娣蜂贡
//             if( timer_write_data_i > ARR ) 
//                 CCR <= ARR;
//             else
//                 CCR <= timer_write_data_i;
//         end
//     end

//     // --- 褰卞瓙瀵勫瓨鍣ㄦ洿鏂伴?昏緫 (淇濇寔涓嶅彉) ---
//     always@( posedge sys_clk_i ) begin
//         if( COUNT_MODE == "UP" ) begin
//              if( CNT == ARR - 1'b1) CCR_SHADOW <= CCR;
//         end else if( COUNT_MODE == "DOWN" ) begin
//              if( CNT == 16'd0) CCR_SHADOW <= CCR;
//         end else if(  COUNT_MODE == "CENTRE" ) begin
//              // 涓�蹇冨�归綈閫氬父鍦ㄤ笅婧�锛�0锛夋垨涓婃孩锛圓RR锛夋椂鏇存柊锛岃繖閲岄?夋嫨鍦? 1 涓旀柟鍚戝悜涓婃椂鏇存柊
//              if( CNT == 16'd1 && center_direct == 1'b1 ) CCR_SHADOW <= CCR;
//         end
//     end

//     // --- 鏂瑰悜鎺у埗閫昏緫 (淇濇寔涓嶅彉) ---
//     always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
//         if( sys_rst_n_i == 1'b0 ) center_direct <= 1'b0;
//         else if( COUNT_MODE == "CENTRE" ) begin
//             if( CNT == ARR - 1'b1 && center_direct == 1'b0) center_direct <= 1'b1;
//             else if( CNT == 1'b1 && center_direct == 1'b1) center_direct <= 1'b0;
//         end
//     end

//     // --- 璁℃暟鍣ㄩ?昏緫 (淇濇寔涓嶅彉) ---
//     always @( posedge sys_clk_i or negedge sys_rst_n_i ) begin
//         if( sys_rst_n_i == 1'b0 ) CNT <= 16'd0;
//         else if( COUNT_MODE == "UP" ) begin
//             if( CNT == ARR - 1'b1) CNT <= 16'd0; else CNT <= CNT + 1'b1;
//         end else if( COUNT_MODE == "DOWN" ) begin
//             if( CNT == 16'd0 ) CNT <= ARR -1'b1; else CNT <= CNT - 1'b1;
//         end else if( COUNT_MODE == "CENTRE" ) begin
//             if( center_direct == 1'b0 ) CNT <= CNT + 1'b1; else CNT <= CNT - 1'b1;
//         end
//     end

// endmodule