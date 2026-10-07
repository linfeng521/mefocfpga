`timescale 1ns / 1ps

module open_loop_spin_top (
    input  wire clk_in,   // N18 引脚，PL 50MHz 晶振

    // --- 输出至 LMG2100R044 (Bank 34) ---
    output wire pwm_u_h, output wire pwm_u_l, // W18, W19
    output wire pwm_v_h, output wire pwm_v_l, // N17, P18
    output wire pwm_w_h, output wire pwm_w_l  // P15, P16
);

    // ==========================================
    // 1. 上电自动复位生成 (延时 255 个周期释放)
    // ==========================================
    reg [7:0] rst_cnt = 8'h00;
    wire rst_n = (rst_cnt == 8'hFF);
    always @(posedge clk_in) begin
        if (!rst_n) rst_cnt <= rst_cnt + 1'b1;
    end

    // ==========================================
    // 2. 例化原工程的 VIO_0 控制内核
    // ==========================================
    wire               vio_loop_ctrl;       // 用作电机使能 (Enable)
    wire signed [15:0] vio_set_id_ref;      // 开环设定 D 轴电压 (通常写 0)
    wire signed [15:0] vio_set_iq_ref;      // 开环设定 Q 轴电压 (你的强拖油门)
    wire [31:0]        auto_angle_increment;// 开环设定电角度步长 (你的强拖速度)

    vio_1 u_vio (
    .clk(clk_in),
    .probe_in0(16'd0),
    .probe_in1(16'd0),
    .probe_in2(16'd0),
    .probe_in3(1'b0),
    .probe_in4(1'b0),

    .probe_out1(vio_set_id_ref),
    .probe_out2(vio_set_iq_ref),
    .probe_out3(auto_angle_increment),
    .probe_out6(vio_loop_ctrl)
);

    // ==========================================
    // 3. 角度累加器与 10极对 映射
    // ==========================================
    reg [31:0] auto_angle_cnt = 32'd0;
    
    // 与 fpga_top 保持一致：每时钟累加，VIO控制步长
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            auto_angle_cnt <= 32'd0;
        end else if (vio_loop_ctrl) begin
            auto_angle_cnt <= auto_angle_cnt + auto_angle_increment;
        end
    end

    // 【极其关键】将 21 极对修正为 10 极对！
    // 机械角转换为电角度：Elec_Angle = Mech_Angle * PolePairs
    wire [15:0] active_angle = auto_angle_cnt[31:16] * 16'd10;

    // ==========================================
    // 4. 调用原工程的 CORDIC (生成正余弦)
    // ==========================================
    wire [31:0] cordic_out;
    wire cordic_done;
    cordic_0 u_cordic (
        .aclk(clk_in), 
        .s_axis_phase_tvalid(1'b1), 
        .s_axis_phase_tdata(active_angle), 
        .m_axis_dout_tvalid(cordic_done), 
        .m_axis_dout_tdata(cordic_out)
    );
    
    wire signed [15:0] sin_val = cordic_out[31:16];
    wire signed [15:0] cos_val = cordic_out[15:0];

    // ==========================================
    // 5. 调用原工程的反 Park 变换 (引入 VIO 的 Vd/Vq)
    // ==========================================
    wire signed [15:0] valpha_ref;
    wire signed [15:0] vbeta_ref;
    wire inv_park_done;
    
    inv_park_transform u_inv_park (
        .clk(clk_in), 
        .rst_n(rst_n), 
        .i_valid(cordic_done), 
        .i_vd(vio_set_id_ref), // 接 VIO 输入的 Vd
        .i_vq(vio_set_iq_ref), // 接 VIO 输入的 Vq (开环油门)
        .i_sin(sin_val), 
        .i_cos(cos_val), 
        .o_valpha(valpha_ref), 
        .o_vbeta(vbeta_ref), 
        .o_valid(inv_park_done)
    );

    // ==========================================
    // 6. 调用原工程的 SVPWM 发生器 (包含反 Clarke 变换)
    // ==========================================
    wire signed [15:0] svpwm_cmp_a, svpwm_cmp_b, svpwm_cmp_c;
    wire pwm_update_flag;

    svpwm_generator u_svpwm (
        .clk(clk_in), 
        .rst_n(rst_n), 
        .i_valid(inv_park_done), 
        .v_alpha(valpha_ref), 
        .v_beta(vbeta_ref), 
        .o_valid(pwm_update_flag), 
        .cmp_a(svpwm_cmp_a), 
        .cmp_b(svpwm_cmp_b), 
        .cmp_c(svpwm_cmp_c)
    );

    // ==========================================
    // 7. Q15 至 比较寄存器值的映射 (完全采用 fpga_top 逻辑)
    // ==========================================
    localparam [31:0] PWM_PRD = 32'd500; // 50MHz / (50kHz * 2)

    // 将 signed 符号翻转映射为 unsigned 16位 (0~65535)
    wire [15:0] u_cmp_a = {~svpwm_cmp_a[15], svpwm_cmp_a[14:0]};
    wire [15:0] u_cmp_b = {~svpwm_cmp_b[15], svpwm_cmp_b[14:0]};
    wire [15:0] u_cmp_c = {~svpwm_cmp_c[15], svpwm_cmp_c[14:0]};

    // 缩放计算，截取高 16 位
    wire [31:0] calc_a_raw = u_cmp_a * PWM_PRD;
    wire [31:0] calc_b_raw = u_cmp_b * PWM_PRD;
    wire [31:0] calc_c_raw = u_cmp_c * PWM_PRD;

    reg [15:0] duty_u, duty_v, duty_w;
    
    // 保护限制：占空比不允许超过周期值
    always @(posedge clk_in) begin
        if (pwm_update_flag) begin
            duty_u <= (calc_a_raw[31:16] > PWM_PRD) ? PWM_PRD[15:0] : calc_a_raw[31:16];
            duty_v <= (calc_b_raw[31:16] > PWM_PRD) ? PWM_PRD[15:0] : calc_b_raw[31:16];
            duty_w <= (calc_c_raw[31:16] > PWM_PRD) ? PWM_PRD[15:0] : calc_c_raw[31:16];
            
            // 安全机制：如果 VIO 关闭使能，强制三相占空比为 0
            if (!vio_loop_ctrl) begin
                duty_u <= 16'd0; duty_v <= 16'd0; duty_w <= 16'd0;
            end
        end
    end

    // ==========================================
    // 8. 底层死区发生与 PWM 驱动例化
    // ==========================================
    pwm_motor_driver #(
        .SYS_CLK_FREQ(50_000_000), 
        .PWM_FREQ(50_000),         
        .DEADTIME_NS(30)           
    ) u_pwm_driver (
        .clk(clk_in),
        .rst_n(rst_n),
        .cmp_u(duty_u),
        .cmp_v(duty_v),
        .cmp_w(duty_w),
        .pwm_update_tick(),
        .pwm_u_h(pwm_u_h), .pwm_u_l(pwm_u_l),
        .pwm_v_h(pwm_v_h), .pwm_v_l(pwm_v_l),
        .pwm_w_h(pwm_w_h), .pwm_w_l(pwm_w_l)
    );

endmodule
