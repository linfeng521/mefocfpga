`timescale 1ns / 1ps

module fpga_top(
        // =========================================
        // 1. 物理接口
        // =========================================
        //input  wire        sys_clk,       // 50MHz

        input  wire        sys_rst_n,

        // --- AD7606 ---
        input  wire [15:0] ad7606_data,
        input  wire        ad7606_busy,
        output wire        ad7606_cs_n,
        output wire        ad7606_rd_n,
        output wire        ad7606_reset,
        output wire        ad7606_convst_a,
        output wire        ad7606_convst_b,
        output wire [2:0]  ad7606_os,

        // --- MA702 ---
        output wire        ma702_cs_n,
        output wire        ma702_sclk,
        output wire        ma702_mosi,
        input  wire        ma702_miso,

        // --- PWM ---
        output wire        pwm_out_a,
        output wire        pwm_out_b,
        output wire        pwm_out_c,

        // --- Enable ---
        //    output wire        INAL,
        //    output wire        INBL,
        //    output wire        INCL,
        output wire        motor_enable,


        // --- Can ---
        input wire       Can_rx,
        output wire      Can_tx,

        // --- vitis lan9252 vitis ---
        output wire    spi_cs,
        output wire    spi_clk,
        output wire    spi_mosi,
        input wire    spi_miso,

        // --- Debug ---
        output wire        uart_txd,
        output wire        led_pll_locked
    );





    // =========================================
    // 2. 参数定义
    // =========================================
    localparam [15:0] TIMER_ARR_VAL = 16'd1250;

    localparam UART_BPS = 115200;
    localparam CLK_FRE  = 50_000_000;
    localparam UART_SEND_BYTES = 6;
    localparam UART_REFRESH_CNT = 32'd1_000_000;

    // 校准时的开环速度 (增量值)
    localparam CALIB_SPEED_VAL = 32'd21;

    localparam SLOW_FACTOR = 32'd1;

    // =========================================
    // 3. 内部信号定义
    // =========================================
    // --- 【新增】Calibration 专用信号 ---
    wire        calib_start_trig;   // 从 VIO 出来的校准启动信号
    wire        calib_apply_en;     // 从 VIO 出来的校准数据使能开关
    wire        calib_is_running;   // 校准模块运行状态
    wire        calib_done_flag;    // 校准完成标志
    wire        calib_rotate_req;   // 校准模块请求电机旋转
    wire [15:0] calib_elec_result;  // 校准后输出的电角度
    wire [15:0] calib_debug_err;     // 校准过程中的角度误差，用于调试
    wire [15:0] calib_zero_offset;   // 校准零点，连接到 ILA 观察
    wire [15:0] calib_ram_addr;      // 校准 RAM 地址，连接到 ILA 观察
    wire calib_force_zero;          // 预对齐阶段强制角度归零
    wire clk_core;                   // FOC 核心时钟
    design_1_wrapper u_ps7_sys (
                         .SPI0_SCLK_O_0(spi_clk),
                         .SPI0_MOSI_O_0(spi_mosi),
                         .SPI0_MISO_I_0(spi_miso),
                         .SPI0_SS_O_0(spi_cs),
                         .SPI0_SCLK_I_0(spi_clk), // SPI 时钟输入未使用
                         .SPI0_MOSI_I_0(1'b0), // 未使用的 SPI 输入固定为 0
                         .SPI0_SS_I_0(spi_cs),
                         .sys_clk_ps (clk_core),
                         .CAN0_PHY_RX_0(can_rx),
                         .CAN0_PHY_TX_0(can_tx)
                     );
    wire rst_sys;                    // 系统复位信号

    // 传感器采集结果：三相电流、母线电压、机械/电角度和转速
    wire signed [31:0] raw_ia_32, raw_ib_32, raw_ic_32;
    wire [15:0]        bus_voltage;
    wire [31:0]        mech_angle_32;
    wire [31:0]        elec_angle_32;
    wire signed [31:0] motor_speed_32;

    // 对速度反馈进行降采样，匹配速度环数值范围
    wire signed [31:0] motor_speed_scaled;
    assign motor_speed_scaled = motor_speed_32 >>> 6;

    wire               sensor_valid;       // 传感器采样有效脉冲
    wire               adc_calib_done;     // ADC 校准完成标志
    wire               adc_center_trig;    // PWM 中点触发 ADC 采样

    // FOC 变换链路信号：Clarke、Park 变换及 CORDIC 正余弦
    wire signed [15:0] foc_ia, foc_ib, foc_ic;
    wire signed [15:0] foc_mech_angle;
    wire signed [15:0] i_alpha, i_beta;
    wire clarke_done;
    wire signed [15:0] sin_val, cos_val;
    wire [31:0] cordic_dout;
    wire cordic_done;
    wire signed [15:0] id_meas, iq_meas;
    wire park_done;

    // PID 启动、应答和电流环完成信号
    wire        pid_start;
    wire        pid_id_ack, pid_iq_ack;
    wire        current_loop_done;

    // 电流环的测量值、给定值以及 d/q 轴电压输出
    wire signed [31:0] id_meas_32, iq_meas_32;
    wire signed [31:0] id_ref_32;
    wire signed [31:0] iq_ref_32;
    wire signed [31:0] vd_out_32, vq_out_32;
    wire signed [15:0] vd_loop, vq_loop;

    // PID 参数 (VIO)
    wire signed [31:0] pid_kp, pid_ki;

    // SVPWM 调制器输出及 PWM 比较寄存器
    wire inv_park_done;
    wire signed [15:0] valpha_ref;
    wire signed [15:0] vbeta_ref;
    wire signed [15:0] svpwm_cmp_a, svpwm_cmp_b, svpwm_cmp_c;
    wire               pwm_update_flag;
    reg [15:0] ccr_a, ccr_b, ccr_c;

    // VIO 基础控制信号
    wire               vio_mode_select;
    wire signed [15:0] vio_set_id_ref;
    wire signed [15:0] vio_set_iq_ref;
    wire signed [15:0] vio_force_vd;
    wire signed [15:0] vio_force_vq;
    wire               vio_loop_ctrl;
    wire [15:0]        vio_angle_offset;
    wire               vio_sensor_inv;
    wire [15:0]        vio_open_loop_angle;

    // 速度环给定、PID 参数和输出
    wire signed [31:0] vio_speed_ref;
    wire signed [31:0] vio_speed_kp;
    wire signed [31:0] vio_speed_ki;
    wire               vio_speed_mode;
    wire signed [31:0] speed_loop_out;

    // --- 【新增】 ---
    wire signed [31:0] vio_pos_ref;     // VIO 设定的目标位置 (0~65535 << 16)
    wire signed [31:0] vio_pos_kp;      // 位置环 P 参数
    wire signed [31:0] vio_pos_ki;      // 位置环 I 参数
    wire               vio_pos_mode;    // 1：开启位置闭环
    wire signed [31:0] pos_loop_out;    // 位置环输出，即速度环目标值

    // =========================================
    // VIO 控制量同步寄存器，避免异步切换造成控制突变（Bumpless Transfer）
    // 切换闭环时预装载当前状态，使输出平滑过渡
    // =========================================
    reg               safe_mode_select;
    reg               safe_loop_ctrl;
    reg signed [15:0] safe_iq_ref;
    reg [15:0]        safe_angle_offset;
    reg               safe_sensor_inv;
    reg [15:0]        safe_open_loop_angle;
    reg               safe_speed_mode;
    reg               safe_pos_mode;
    reg signed [31:0] safe_speed_ref;
    reg signed [31:0] safe_pos_ref;

    // 开环角度累加器和当前用于 CORDIC 的角度
    reg [31:0] auto_angle_cnt;
    reg [31:0] slow_cnt;
    wire [15:0] active_angle;
    wire [31:0] auto_angle_increment;

    // UART 周期发送状态
    reg [31:0] uart_timer_cnt;
    reg        uart_en_r;
    wire [UART_SEND_BYTES*8-1:0] uart_data_w;
    reg[31:0] mosi_value_reg;
    // =========================================
    // 4. 逻辑实现
    // =========================================
    // 三相 PWM 定时器的内部输出
    wire internal_pwm_a, internal_pwm_b, internal_pwm_c;


    // 复位或未使能时关闭三相 PWM 输出
    assign pwm_out_a = (motor_enable & sys_rst_n) ? internal_pwm_a : 1'b0;
    assign pwm_out_b = (motor_enable & sys_rst_n) ? internal_pwm_b : 1'b0;
    assign pwm_out_c = (motor_enable & sys_rst_n) ? internal_pwm_c : 1'b0;


    assign rst_sys = sys_rst_n;

    assign motor_enable = 1'b1;
    assign INAL = 1'b1;
    assign INBL = 1'b1;
    assign INCL = 1'b1;

    // =========================================
    // VIO 控制量同步逻辑
    // 在 PWM 更新边界锁存控制参数，避免运行过程中产生毛刺
    // (Bumpless Transfer)
    // =========================================
    always @(posedge clk_core or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            safe_mode_select     <= 1'b0;
            safe_loop_ctrl       <= 1'b0;
            safe_iq_ref          <= 16'd0;
            safe_angle_offset    <= 16'd0;
            safe_sensor_inv      <= 1'b0;
            safe_open_loop_angle <= 16'd0;
            safe_speed_mode      <= 1'b0;
            safe_pos_mode        <= 1'b0;
            safe_speed_ref       <= 32'd0;
            safe_pos_ref         <= 32'd0;
        end
        else if (pwm_update_flag) begin
            // 在 PWM 更新时锁存 SVPWM 比较值
            safe_mode_select     <= vio_mode_select;
            safe_loop_ctrl       <= vio_loop_ctrl;
            safe_iq_ref          <= vio_set_iq_ref;
            safe_angle_offset    <= vio_angle_offset;
            safe_sensor_inv      <= vio_sensor_inv;
            safe_open_loop_angle <= vio_open_loop_angle;
            safe_speed_mode      <= vio_speed_mode;
            safe_pos_mode        <= vio_pos_mode;
            safe_speed_ref       <= vio_speed_ref;
            safe_pos_ref         <= vio_pos_ref;
        end
    end

    // --- 传感器子系统：ADC、电角度和机械角度采集 ---
    sensor_subsystem u_sensors (
                         .sys_clk_i(clk_core), .sys_rst_n_i(sys_rst_n),
                         .adc_calib_en_i(1'b1), .adc_calib_done_o(adc_calib_done),
                         .Ia_o(raw_ia_32), .Ib_o(raw_ib_32), .Ic_o(raw_ic_32), .voltage_o(bus_voltage),
                         .motor_mech_angle_o(mech_angle_32),
                         .motor_elec_angle_o(elec_angle_32),
                         .motor_speed_o(motor_speed_32),
                         .ad7606_data_i(ad7606_data), .ad7606_busy_i(ad7606_busy),
                         .ad7606_cs_n_o(ad7606_cs_n), .ad7606_rd_n_o(ad7606_rd_n),
                         .ad7606_reset_o(ad7606_reset), .ad7606_convst_o(ad7606_convst_a), .ad7606_os_o(ad7606_os),
                         .ma702_cs_o(ma702_cs_n), .ma702_sclk_o(ma702_sclk), .ma702_mosi_o(ma702_mosi), .ma702_miso_i(ma702_miso),
                         .adc_valid(sensor_valid), .foc_loop_trig_i(adc_center_trig)
                     );


    // --- 自动电角度校准核心 ---
    auto_calibration_core u_calib_core (
                              .clk                (clk_core),
                              .rst_n              (sys_rst_n),

                              // 校准控制信号
                              .start_calib        (calib_start_trig), // VIO 按键触发校准
                              .is_calibrating     (calib_is_running),
                              .calib_done         (calib_done_flag),
                              .rotate_en          (calib_rotate_req), // 校准模块请求电机旋转

                              // 角度数据输入
                              .raw_mech_angle_in  (mech_angle_32),        // 传感器原始机械角度
                              .open_loop_angle_in (auto_angle_cnt[31:16]),// 当前开环拖动目标角度
                              .force_align_zero   (calib_force_zero), // 预对齐时强制角度归零
                              // 校准数据输出
                              .calib_mech_angle_out (), // 机械角度输出暂不使用
                              .calib_elec_angle_out (calib_elec_result), // 修正后的电角度
                              .debug_error_val      (calib_debug_err),
                              .zero_offset_o        (calib_zero_offset),  // 连接到 ILA
                              .ram_addr_o           (calib_ram_addr)      // 连接到 ILA
                          );
    assign ad7606_convst_b = ad7606_convst_a;

    // --- 三相电流数据适配 ---
    // 根据传感器方向选择是否交换 Ia、Ib
    // vio_sensor_inv=1 时交换两相电流，修正传感器方向
    // 根据配置后的传感器方向输出三相电流
    wire signed [15:0] foc_ia_raw = (safe_sensor_inv) ? raw_ib_32[15:0] : raw_ia_32[15:0];
    wire signed [15:0] foc_ib_raw = (safe_sensor_inv) ? raw_ia_32[15:0] : raw_ib_32[15:0];

    assign foc_ia = foc_ia_raw;
    assign foc_ib = foc_ib_raw;
    assign foc_ic = raw_ic_32[15:0];

    // --- 电角度选择 ---
    // calib_apply_en 有效时使用校准后的角度，否则使用原始电角度
    // 原始电角度取高 16 位
    assign foc_mech_angle = (calib_apply_en) ? calib_elec_result : elec_angle_32[31:16];

    // --- 校准期间接管开环控制 ---
    // 校准旋转或预对齐时强制开环，并将开环角度置零
    wire real_mode_select = (calib_rotate_req || calib_force_zero) ? 1'b0 : safe_mode_select;
    wire [15:0] real_open_ang = (calib_rotate_req || calib_force_zero) ? 16'd0 : safe_open_loop_angle;

    wire [31:0] active_increment = (calib_rotate_req) ? CALIB_SPEED_VAL : auto_angle_increment;

    // --- 开环角度累加逻辑 ---
    always @(posedge clk_core or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            auto_angle_cnt <= 0;
            slow_cnt <= 0;
        end
        else begin

            // 预对齐阶段清零角度计数器
            if (calib_force_zero) begin
                auto_angle_cnt <= 0;
                slow_cnt <= 0;
            end

            // 开环模式下按设定增量推进角度
            else if (real_mode_select == 1'b0) begin
                if (slow_cnt < SLOW_FACTOR - 1)
                    slow_cnt <= slow_cnt + 1;
                else begin
                    slow_cnt <= 0;
                    // 校准时使用校准增量，否则使用普通开环增量
                    auto_angle_cnt <= auto_angle_cnt + active_increment;
                end
            end
            else begin
                // 闭环模式下停止开环角度累加
                slow_cnt <= 0;
            end
        end
    end

    // 选择最终送入 CORDIC 的电角度
    // FIXED: when calib applied, calib_elec_result already includes zero_offset
    // correction, so safe_angle_offset must NOT be added (was double compensation)
    wire [15:0] angle_offset_final = (calib_apply_en) ? 16'd0 : safe_angle_offset;
    assign active_angle =
           (calib_force_zero) ? 16'd0 :
           (real_mode_select == 1'b0) ?
           // 开环模式优先使用外部角度，否则使用内部累加角度
           (((real_open_ang != 0) ? real_open_ang : auto_angle_cnt[31:16]) * 16'd21) :
           (foc_mech_angle + angle_offset_final);

    // angle_offset_final 已在 active_angle 之前声明
    // --- 坐标变换：CORDIC、Clarke 和 Park ---
    cordic_0 u_cordic (.aclk(clk_core), .s_axis_phase_tvalid(1'b1), .s_axis_phase_tdata(active_angle), .m_axis_dout_tvalid(cordic_done), .m_axis_dout_tdata(cordic_dout));
    assign sin_val = cordic_dout[31:16];
    assign cos_val = cordic_dout[15:0];
    //assign cos_val = cordic_dout[31:16];
    //   assign sin_val = cordic_dout[15:0];
    clarke_transform u_clarke (.clk(clk_core), .rst_n(sys_rst_n), .i_valid(sensor_valid), .i_a(foc_ia), .i_b(foc_ib), .o_valid(clarke_done), .i_alpha(i_alpha), .i_beta(i_beta));
    park_transform u_park (.sys_clk_i(clk_core), .sys_rst_n_i(sys_rst_n), .i_valid(clarke_done & cordic_done), .i_alpha(i_alpha), .i_beta(i_beta), .i_sin(sin_val), .i_cos(cos_val), .o_valid(park_done), .o_id(id_meas), .o_iq(iq_meas));

    // =========================================
    // 位置环 PID 控制
    // =========================================
    // 位置环仅在位置模式、闭环使能且 PID 时序有效时运行
    wire pos_loop_en = pid_start & safe_mode_select & safe_pos_mode & safe_loop_ctrl;

    // =========================================
    // 位置反馈环的环形误差计算
    // 将 16 位角度差转换为最短路径的有符号误差，避免 0/65535 跳变
    // 1. VIO 位置给定为 16 位，实际角度取 32 位数据的高 16 位
    // 2. 在 0~65535 环形空间内计算位置误差，再送入 PID
    // =========================================

    // 第一步：计算 16 位无符号环形误差
    // 例如目标 10、当前位置 65500 时，误差为 +46
    // 位置模式切入时预装载当前位置，使初始 PID 误差为 0
    // 随后再平滑过渡到 VIO 设定的目标位置
    // 相关状态 VIO
    reg [15:0] pos_ref_synced;
    reg        pos_just_entered;
    always @(posedge clk_core or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            pos_ref_synced  <= 16'd0;
            pos_just_entered <= 1'b0;
        end
        else begin
            if (!safe_pos_mode || !safe_loop_ctrl) begin
                // 未进入位置闭环时，参考值跟随实际位置
                pos_ref_synced  <= mech_angle_32[31:16];
                pos_just_entered <= 1'b1;
            end
            else if (pos_just_entered) begin
                // 位置模式刚进入时，将参考值预装载为当前位置
                pos_ref_synced  <= mech_angle_32[31:16];
                pos_just_entered <= 1'b0;
            end
            else begin
                // 预装载完成后切换到 VIO 目标位置
                pos_ref_synced  <= vio_pos_ref[15:0];
            end
        end
    end

    // 位置误差先在 16 位环形空间中计算
    // 例如目标 10、当前位置 65500，最短误差为 +46
    wire [15:0] shortest_pos_error_raw = pos_ref_synced - mech_angle_32[31:16];

    // 转换为 16 位有符号误差，范围 -32768~32767
    wire signed [15:0] shortest_pos_error_signed = shortest_pos_error_raw;

    // 符号扩展到 32 位，送入位置 PID
    wire signed [31:0] pos_error_32 = {{16{shortest_pos_error_signed[15]}}, shortest_pos_error_signed};

    position_pid #(
                     .INTEGRAL_VALUE_MAX (32'd2000000000),
                     .INTEGRAL_VALUE_MIN (-32'd2000000000),
                     .FEEDBACK_VALUE_MAX (32'd5000),
                     .FEEDBACK_VALUE_MIN (-32'd5000)
                 ) u_pid_pos (
                     .sys_clk_i          (clk_core),
                     .sys_rst_n_i        (pid_rst_n),
                     .position_pid_en_i  (pos_loop_en),
                     .position_pid_ack_o (),
                     .P_i                (vio_pos_kp),
                     .I_i                (vio_pos_ki),
                     .D_i                (32'd0),
                     // desired  PIDactual  0
                     // PIDPI
                     .desired_value_i    (pos_error_32),
                     .actual_value_i     (32'd0),
                     .feedback_value_o   (pos_loop_out),
                     .error_out          (),
                     // Bumpless Transfer: preload speed_ref_ramp on entry to pos mode
                     .preload_en         (pos_preload_trig),
                     .preload_val        (speed_ref_ramp)
                 );

    // =========================================
    // 速度环 PID 控制
    // =========================================
    // 速度环仅在速度模式或位置级联模式下运行
    wire speed_loop_en = pid_start & safe_mode_select & (safe_speed_mode | safe_pos_mode) & safe_loop_ctrl;

    wire signed [31:0] speed_ref_final;

    // 速度给定斜坡：闭环切入时先跟随实际速度，避免输出突变
    // 开环或非速度模式下，斜坡跟随实际速度，切入闭环时误差接近 0
    // 速度闭环时，斜坡缓慢逼近 safe_speed_ref（一级低通）
    localparam SPEED_RAMP_SHIFT = 8;  // 数值越大，斜坡变化越慢
    reg signed [31:0] speed_ref_ramp;
    always @(posedge clk_core or negedge sys_rst_n) begin
        if (!sys_rst_n)
            speed_ref_ramp <= 32'd0;
        else if (!safe_loop_ctrl || (!safe_speed_mode && !safe_pos_mode))
            speed_ref_ramp <= motor_speed_scaled;   // 跟随实际速度
        else
            speed_ref_ramp <= speed_ref_ramp +
                           ((safe_speed_ref - speed_ref_ramp) >>> SPEED_RAMP_SHIFT);
    end

    // 位置模式下速度给定来自位置环，否则来自速度环 VIO 给定
    assign speed_ref_final = (safe_pos_mode) ? pos_loop_out : speed_ref_ramp;

    position_pid #(
                     .INTEGRAL_VALUE_MAX (32'd500000000),
                     .INTEGRAL_VALUE_MIN (-32'd500000000),
                     .FEEDBACK_VALUE_MAX (32'd15000),
                     .FEEDBACK_VALUE_MIN (-32'd15000)
                 ) u_pid_speed (
                     .sys_clk_i          (clk_core),
                     .sys_rst_n_i        (pid_rst_n),
                     .position_pid_en_i  (speed_loop_en),
                     .position_pid_ack_o (),
                     .P_i                (vio_speed_kp),
                     .I_i                (vio_speed_ki),
                     .D_i                (32'd0),
                     .desired_value_i    (speed_ref_final),
                     .actual_value_i     (motor_speed_scaled),
                     .feedback_value_o   (speed_loop_out),
                     .error_out          (),
                     // 进入速度模式时预装载实际 Iq，避免输出突变
                     // 使速度环初始误差接近 0，避免速度给定跳变
                     .preload_en         (spd_preload_trig),
                     .preload_val        (iq_meas_32)
                 );

    // =========================================
    // 电流环 PID 控制
    // =========================================

    // 校准期间使用专用控制策略，避免校准动作受到普通 PID 给定影响
    // 预对齐和旋转时注入固定 Id 电流
    // 校准期间关闭普通闭环控制
    wire real_loop_ctrl = (calib_is_running) ? 1'b0 : safe_loop_ctrl;

    // Bumpless Transfer：通过预装载脉冲初始化 PID 积分器
    // PID 不因 loop_ctrl 复位，通过预装载脉冲初始化积分器
    wire pid_rst_n = sys_rst_n;
    assign pid_start = park_done;

    assign id_meas_32 = {{16{id_meas[15]}}, id_meas};
    assign iq_meas_32 = {{16{iq_meas[15]}}, iq_meas};

    // =========================================
    // 无扰切换：边沿检测与预装载值选择
    // 区分校准结束和手动闭环使能两种切换场景
    // =========================================
    reg real_loop_ctrl_d1;
    reg calib_is_running_d1;
    reg safe_speed_mode_d1;
    reg safe_pos_mode_d1;

    always @(posedge clk_core or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            real_loop_ctrl_d1   <= 1'b0;
            calib_is_running_d1 <= 1'b0;
            safe_speed_mode_d1  <= 1'b0;
            safe_pos_mode_d1    <= 1'b0;
        end
        else begin
            real_loop_ctrl_d1   <= real_loop_ctrl;
            calib_is_running_d1 <= calib_is_running;
            safe_speed_mode_d1  <= safe_speed_mode;
            safe_pos_mode_d1    <= safe_pos_mode;
        end
    end

    // 切换边沿触发信号
    wire loop_ctrl_rising = (real_loop_ctrl && !real_loop_ctrl_d1);     // 手动切入闭环
    wire calib_end_trig   = (!calib_is_running && calib_is_running_d1); // 校准刚刚结束

    wire cur_preload_trig = calib_end_trig | loop_ctrl_rising;          // 电流环预装载触发
    wire spd_preload_trig = (safe_speed_mode && !safe_speed_mode_d1);   // 速度环预装载触发
    wire pos_preload_trig = (safe_pos_mode && !safe_pos_mode_d1);       // 位置环预装载触发

    // 根据切换场景选择 PID 预装载值
    // 校准结束：Id=3500，Iq=0
    // 手动闭环切入：预装载当前 Vd/Vq
    wire signed [31:0] id_preload_val = calib_end_trig ? {{16{real_id_ref[15]}}, real_id_ref} : {{16{vio_force_vd[15]}}, vio_force_vd};
    wire signed [31:0] iq_preload_val = calib_end_trig ? 32'd0    : {{16{vio_force_vq[15]}}, vio_force_vq};

    // 速度环或位置环开启时，Iq 给定来自速度环输出
    wire signed [31:0] iq_ref_source;
    // 未启用级联环时使用 VIO 手动 Iq 给定
    assign iq_ref_source = (safe_speed_mode | safe_pos_mode) ? speed_loop_out : {{16{safe_iq_ref[15]}}, safe_iq_ref};

    // --- 校准电流给定 ---


    // 校准 Id 电流常量
    localparam signed [15:0] CALIB_ID_VAL = 16'sd3500;

    // 校准旋转或预对齐时使用固定 Id，否则使用 VIO 的 Id 给定
    wire [15:0] real_id_ref = (calib_rotate_req || calib_force_zero) ? CALIB_ID_VAL : vio_set_id_ref;

    // 将 Id 给定符号扩展后送入 d 轴 PID
    assign id_ref_32 = {{16{real_id_ref[15]}}, real_id_ref};

    // --- Iq reference ramp (Bumpless Transfer: error=0 at loop close) ---
    localparam IQ_RAMP_SHIFT = 8;
    reg signed [31:0] iq_ref_ramp;
    always @(posedge clk_core or negedge sys_rst_n) begin
        if (!sys_rst_n)
            iq_ref_ramp <= 32'd0;
        else if (!real_loop_ctrl)
            iq_ref_ramp <= iq_meas_32;
        else
            iq_ref_ramp <= iq_ref_ramp +
                        ((iq_ref_source - iq_ref_ramp) >>> IQ_RAMP_SHIFT);
    end

    assign iq_ref_32 = iq_ref_ramp;

    // d 轴电流 PID（Id）
    wire signed [31:0] error_out_id;
    position_pid #(.INTEGRAL_VALUE_MAX(32'd20000000), .INTEGRAL_VALUE_MIN(-32'd20000000), .FEEDBACK_VALUE_MAX(32'd12000), .FEEDBACK_VALUE_MIN(-32'd12000)) u_pid_id (.sys_clk_i(clk_core), .sys_rst_n_i(pid_rst_n), .position_pid_en_i(pid_start), .position_pid_ack_o(pid_id_ack), .P_i(pid_kp), .I_i(pid_ki), .D_i(32'd0), .desired_value_i(id_ref_32), .actual_value_i(id_meas_32), .feedback_value_o(vd_out_32), .error_out(error_out_id), .preload_en(cur_preload_trig), .preload_val(id_preload_val));
    // q 轴电流 PID（Iq）
    wire signed [31:0] error_out_iq;
    position_pid #(.INTEGRAL_VALUE_MAX(32'd20000000), .INTEGRAL_VALUE_MIN(-32'd20000000), .FEEDBACK_VALUE_MAX(32'd12000), .FEEDBACK_VALUE_MIN(-32'd12000)) u_pid_iq (.sys_clk_i(clk_core), .sys_rst_n_i(pid_rst_n), .position_pid_en_i(pid_start), .position_pid_ack_o(pid_iq_ack), .P_i(pid_kp), .I_i(pid_ki), .D_i(32'd0), .desired_value_i(iq_ref_32), .actual_value_i(iq_meas_32), .feedback_value_o(vq_out_32), .error_out(error_out_iq), .preload_en(cur_preload_trig), .preload_val(iq_preload_val));

    // 电流环闭环计算完成标志
    assign current_loop_done = (real_loop_ctrl) ? pid_id_ack : park_done;

    // 开环时直接使用 VIO 强制电压，闭环时使用 PID 输出
    // 开环时直接使用 VIO 强制电压
    assign vd_loop = (real_loop_ctrl) ? vd_out_32[15:0] : vio_force_vd;
    assign vq_loop = (real_loop_ctrl) ? vq_out_32[15:0] : vio_force_vq;

    assign vio_force_vd = real_id_ref;
    assign vio_force_vq = vio_set_iq_ref; // Q

    // 逆 Park 变换、SVPWM 调制、PWM 定时器及 UART 输出
    inv_park_transform u_inv_park (.clk(clk_core), .rst_n(sys_rst_n), .i_valid(current_loop_done), .i_vd(vd_loop), .i_vq(vq_loop), .i_sin(sin_val), .i_cos(cos_val), .o_valpha(valpha_ref), .o_vbeta(vbeta_ref), .o_valid(inv_park_done));
    svpwm_generator u_svpwm (.clk(clk_core), .rst_n(sys_rst_n), .i_valid(inv_park_done), .v_alpha(valpha_ref), .v_beta(vbeta_ref), .o_valid(pwm_update_flag), .cmp_a(svpwm_cmp_a), .cmp_b(svpwm_cmp_b), .cmp_c(svpwm_cmp_c));

    wire [15:0] u_cmp_a = {~svpwm_cmp_a[15], svpwm_cmp_a[14:0]};
    wire [15:0] u_cmp_b = {~svpwm_cmp_b[15], svpwm_cmp_b[14:0]};
    wire [15:0] u_cmp_c = {~svpwm_cmp_c[15], svpwm_cmp_c[14:0]};
    wire [31:0] calc_a_raw = u_cmp_a * TIMER_ARR_VAL;
    wire [31:0] calc_b_raw = u_cmp_b * TIMER_ARR_VAL;
    wire [31:0] calc_c_raw = u_cmp_c * TIMER_ARR_VAL;

    always @(posedge clk_core) begin
        if (pwm_update_flag) begin
            ccr_a <= (calc_a_raw[31:16] > TIMER_ARR_VAL) ? TIMER_ARR_VAL : calc_a_raw[31:16];
            ccr_b <= (calc_b_raw[31:16] > TIMER_ARR_VAL) ? TIMER_ARR_VAL : calc_b_raw[31:16];
            ccr_c <= (calc_c_raw[31:16] > TIMER_ARR_VAL) ? TIMER_ARR_VAL : calc_c_raw[31:16];
        end
    end
    timer_top #(.DEFAULT_ARR(TIMER_ARR_VAL), .COUNT_MODE("CENTRE"), .PWM_OUT_MODE("MODE1")) u_timer_a (.sys_clk_i(clk_core), .sys_rst_n_i(sys_rst_n),.timer_pwm_o(internal_pwm_a), .timer_wr_type_i(1'b1), .timer_write_en_i(pwm_update_flag), .timer_write_data_i(ccr_a), .timer_read_en_i(1'b0), .timer_read_data_o(), .timer_trig_o(), .adc_center_trig_o(adc_center_trig),  .CCR_OUT(), .ARR_OUT(), .CCR_SHADOW_OUT());
    timer_top #(.DEFAULT_ARR(TIMER_ARR_VAL), .COUNT_MODE("CENTRE"), .PWM_OUT_MODE("MODE1")) u_timer_b (.sys_clk_i(clk_core), .sys_rst_n_i(sys_rst_n),.timer_pwm_o(internal_pwm_b), .timer_wr_type_i(1'b1), .timer_write_en_i(pwm_update_flag), .timer_write_data_i(ccr_b), .timer_read_en_i(1'b0), .timer_read_data_o(), .timer_trig_o(), .adc_center_trig_o(),  .CCR_OUT(), .ARR_OUT(), .CCR_SHADOW_OUT());
    timer_top #(.DEFAULT_ARR(TIMER_ARR_VAL), .COUNT_MODE("CENTRE"), .PWM_OUT_MODE("MODE1")) u_timer_c (.sys_clk_i(clk_core), .sys_rst_n_i(sys_rst_n),.timer_pwm_o(internal_pwm_c), .timer_wr_type_i(1'b1), .timer_write_en_i(pwm_update_flag), .timer_write_data_i(ccr_c), .timer_read_en_i(1'b0), .timer_read_data_o(), .timer_trig_o(), .adc_center_trig_o(),  .CCR_OUT(), .ARR_OUT(), .CCR_SHADOW_OUT());

    // UART 周期发送机械角度的十六进制 ASCII 数据
    always @(posedge clk_core or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            uart_timer_cnt <= 0;
            uart_en_r <= 1'b0;
        end
        else begin
            if (uart_timer_cnt >= UART_REFRESH_CNT) begin
                uart_timer_cnt <= 0;
                uart_en_r <= 1'b1;
            end
            else begin
                uart_timer_cnt <= uart_timer_cnt + 1;
                uart_en_r <= 1'b0;
            end
        end
    end
    function [7:0] bin_to_hex_ascii (input [3:0] nibble);
        begin
            if (nibble <= 4'd9)
                bin_to_hex_ascii = nibble + 8'h30;
            else
                bin_to_hex_ascii = nibble - 10 + 8'h41;
        end
    endfunction
    localparam ASCII_CR = 8'h0D;
    localparam ASCII_LF = 8'h0A;
    wire [15:0] angle_reg = foc_mech_angle;
    assign uart_data_w = { ASCII_LF, ASCII_CR, bin_to_hex_ascii(angle_reg[3:0]), bin_to_hex_ascii(angle_reg[7:4]), bin_to_hex_ascii(angle_reg[11:8]), bin_to_hex_ascii(angle_reg[15:12]) };
    uart_bytes_tx #(.BYTES(UART_SEND_BYTES), .BPS(UART_BPS), .CLK_FRE(CLK_FRE)) u_uart_tx (.sys_clk(clk_core), .sys_rst_n(sys_rst_n), .uart_bytes_data(uart_data_w), .uart_bytes_en(uart_en_r), .uart_bytes_done(), .uart_txd(uart_txd));





    // =========================================
    // N. VIO 调试接口：输入 FOC 状态，输出控制参数
    // =========================================

    vio_0 u_vio (
              .clk        (clk_core),
              .probe_in0  (id_meas),
              .probe_in1  (iq_meas),
              .probe_in2  (foc_mech_angle), // 观察当前机械/电角度
              .probe_in3  (calib_is_running),
              .probe_in4  (calib_done_flag),


              .probe_out0 (vio_mode_select),
              .probe_out1 (vio_set_id_ref),
              .probe_out2 (vio_set_iq_ref),
              .probe_out3 (auto_angle_increment),
              .probe_out4 (pid_kp),
              .probe_out5 (pid_ki),
              .probe_out6 (vio_loop_ctrl),
              .probe_out7 (vio_angle_offset),
              .probe_out8 (vio_sensor_inv),
              .probe_out9 (vio_open_loop_angle),

              // 速度环参数
              .probe_out10(vio_speed_ref),
              .probe_out11(vio_speed_kp),
              .probe_out12(vio_speed_ki),
              .probe_out13(vio_speed_mode),

              // 位置环接口及校准控制
              .probe_out14(vio_pos_ref),  // 位置目标值
              .probe_out15(vio_pos_kp),   // 位置环比例系数 P
              .probe_out16(vio_pos_ki),   // 位置环积分系数 I
              .probe_out17(vio_pos_mode),  // 位置模式开关
              .probe_out18 (calib_start_trig),  // 校准启动按键
              .probe_out19 (calib_apply_en)     // 1：使用修正后角度，0：使用原始角度
          );

    // ===== ILA 调试与采样触发 =====
    wire [31:0] vio_freq_div;
    vio_1 u_vio_1 (.clk(clk_core),.probe_in0(1'b0), .probe_out0(vio_freq_div));
    reg [31:0] trg_cnt_ila = 0;
    wire ila_trigger;
    always @(posedge clk_core or negedge sys_rst_n) begin
        if (!sys_rst_n)
            trg_cnt_ila <= 0;
        else if (trg_cnt_ila >= vio_freq_div - 1)
            trg_cnt_ila <= 0;
        else
            trg_cnt_ila <= trg_cnt_ila + 1;
    end
    assign ila_trigger = (trg_cnt_ila == vio_freq_div - 1);

    // ILA：按 FOC 数据流阶段观察完整控制链路
    // IP 中 probe3/probe4 为 32 位，因此每个 probe 打包两个 16 位信号
    // probe6 为触发信号 pid_start（等于 park_done），每个 PWM 周期采样
    //
    // A 组（相电流）：probe0=foc_ia，probe5=foc_ib
    // B 组（反馈电流）：probe1=id_meas，probe2=iq_meas
    // C 组（角度）：probe4={active_angle, calib_elec_result}
    // D 组（控制输出）：probe3={vd_loop, vq_loop}
    //   ila_0 u_ila_0 (
    //       .clk(clk_core),
    //       .probe0(foc_ia),                               // 16-bit: phase A current
    //       .probe1(id_meas),                              // 16-bit: d-axis current
    //       .probe2(iq_meas),                              // 16-bit: q-axis current
    //       .probe3({vd_loop, vq_loop}),                   // 32-bit: control outputs
    //       .probe4({active_angle, calib_elec_result}),    // 32-bit: angle chain
    //       .probe5(foc_ib),                               // 16-bit: phase B current
    //       .probe6(pid_start),                            // 1-bit:  trigger (= park_done)
    //       .probe7(sin_val[15]),                          // 1-bit:  CORDIC sin sign
    //       .probe8(cos_val[15]),                          // 1-bit:  CORDIC cos sign
    //       .probe9(calib_done_flag),                      // 1-bit:  calibration done
    //       .probe10(calib_is_running)                     // 1-bit:  calibrating
    //   );
    ila_0 u_ila_0 (
              .clk(clk_core),

              // --- A 组：电流和电压观测 ---
              .probe0(foc_ia),               // 16 位：A 相原始电流（ADC 采样值）
              .probe1(iq_meas),              // 16 位：q 轴实测电流
              .probe2(vq_loop),              // 16 位：q 轴电压控制量
              .probe3(ccr_a),                // 16 位：PWM 占空比比较值

              // --- B 组：角度与速度观测 ---
              .probe4(active_angle),         // 16 位：当前 CORDIC 输入角度
              .probe5(mech_angle_32[31:16]), // 16 位：传感器机械角度
              .probe6(motor_speed_scaled),

              // --- C 组：状态和触发信号 ---
              .probe7(pid_start),            // 1 位：PID 计算启动
              .probe8(pwm_update_flag),      // 1 位：PWM 更新脉冲
              .probe9(calib_is_running),     // 1 位：校准运行状态
              .probe10(calib_done_flag)      // 1 位：校准完成标志
          );

endmodule
