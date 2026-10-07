`timescale 1ns / 1ps

// Complete motor-control top for the Zynq-7020 motor board.
//
// Hardware interfaces:
//   * AD7928: two INA240 current channels on VIN0/VIN1
//   * iC-MU150: SPI SDAD command (0xA6), two chip-selects
//   * LMG2100R044: three complementary PWM pairs with dead time
//
// The math blocks and pwm_motor_driver are reused from 8.7_openloop/rtl.
module zynq7020_foc_top #(
    parameter integer CLK_HZ                  = 50_000_000,
    parameter integer PWM_HZ                  = 50_000,
    parameter integer DEADTIME_NS             = 30,
    parameter integer POLE_PAIRS              = 10,
    parameter integer ADC_SPI_DIV             = 3,
    parameter integer ENCODER_SPI_DIV         = 3,
    parameter integer ENCODER_SAMPLE_CYCLES   = 2500,
    parameter integer CALIB_OPEN_INCREMENT    = 21,
    parameter integer ICMU_DATA_BITS          = 24,
    parameter integer ICMU_POSITION_BITS      = 18,
    parameter integer CURRENT_CAL_SAMPLES     = 1024,
    // Kept for source compatibility; the mandatory feedback path is raw.
    parameter integer CURRENT_LPF_SHIFT       = 0,
    parameter signed [15:0] CURRENT_TRIP      = 16'sd30000,
    parameter integer POR_CYCLES              = 256,
    parameter integer SIMULATION              = 0,
    parameter integer SIM_RUN                 = 1,
    parameter integer SIM_CLOSED_LOOP         = 1,
    parameter signed [15:0] SIM_ID_REF         = 16'sd0,
    parameter signed [15:0] SIM_IQ_REF         = 16'sd1200,
    parameter signed [31:0] SIM_CURRENT_KP     = 32'sd32768,
    parameter signed [31:0] SIM_CURRENT_KI     = 32'sd256
)(
    input  wire clk_in,

    output wire ad7928_cs_n,
    output wire ad7928_sclk,
    output wire ad7928_din,
    input  wire ad7928_dout,

    output wire icmu_cs1_n,
    output wire icmu_cs2_n,
    output wire icmu_sclk,
    output wire icmu_mosi,
    input  wire icmu_miso,

    output wire pwm_u_h,
    output wire pwm_u_l,
    output wire pwm_v_h,
    output wire pwm_v_l,
    output wire pwm_w_h,
    output wire pwm_w_l
);

    localparam integer PWM_PERIOD_COUNT = CLK_HZ / (PWM_HZ * 2);
    localparam integer CAL_COUNT_W = (CURRENT_CAL_SAMPLES <= 2) ? 1 : $clog2(CURRENT_CAL_SAMPLES);

    reg [31:0] por_count = 0;
    wire rst_n = (por_count >= POR_CYCLES - 1);
    always @(posedge clk_in) begin
        if (!rst_n)
            por_count <= por_count + 1'b1;
    end

    wire pwm_sample_tick;
    wire [11:0] adc_code_a;
    wire [11:0] adc_code_b;
    wire adc_pair_valid;
    wire adc_initialized;

    ad7928_dual_reader #(
        .CLK_DIV(ADC_SPI_DIV)
    ) u_adc (
        .clk(clk_in),
        .rst_n(rst_n),
        .sample_req(pwm_sample_tick),
        .adc_cs_n(ad7928_cs_n),
        .adc_sclk(ad7928_sclk),
        .adc_din(ad7928_din),
        .adc_dout(ad7928_dout),
        .ch0_data(adc_code_a),
        .ch1_data(adc_code_b),
        .pair_valid(adc_pair_valid),
        .initialized(adc_initialized)
    );

    wire [ICMU_POSITION_BITS-1:0] encoder1_position;
    wire [ICMU_POSITION_BITS-1:0] encoder2_position;
    wire encoder1_valid;
    wire encoder2_valid;
    wire encoder1_error;
    wire encoder2_error;

    icmu150_dual_reader #(
        .CLK_DIV(ENCODER_SPI_DIV),
        .SAMPLE_CYCLES(ENCODER_SAMPLE_CYCLES),
        .DATA_BITS(ICMU_DATA_BITS),
        .POSITION_BITS(ICMU_POSITION_BITS)
    ) u_encoder (
        .clk(clk_in),
        .rst_n(rst_n),
        .spi_cs1_n(icmu_cs1_n),
        .spi_cs2_n(icmu_cs2_n),
        .spi_sclk(icmu_sclk),
        .spi_mosi(icmu_mosi),
        .spi_miso(icmu_miso),
        .position1(encoder1_position),
        .position2(encoder2_position),
        .position1_valid(encoder1_valid),
        .position2_valid(encoder2_valid),
        .frame1_error(encoder1_error),
        .frame2_error(encoder2_error)
    );

    wire [15:0] mech_angle = encoder1_position >> (ICMU_POSITION_BITS - 16);
    wire [15:0] elec_angle = mech_angle * POLE_PAIRS;

    reg [15:0] last_mech_angle;
    reg signed [31:0] motor_speed;
    wire signed [15:0] angle_delta = mech_angle - last_mech_angle;
    localparam integer ENCODER_RATE_HZ = CLK_HZ / ENCODER_SAMPLE_CYCLES;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            last_mech_angle <= 0;
            motor_speed <= 0;
        end else if (encoder1_valid) begin
            last_mech_angle <= mech_angle;
            motor_speed <= angle_delta * ENCODER_RATE_HZ;
        end
    end

    wire ctrl_closed_loop;
    wire signed [15:0] ctrl_id_ref;
    wire signed [15:0] ctrl_iq_ref;
    wire [31:0] ctrl_open_increment;
    wire signed [31:0] ctrl_current_kp;
    wire signed [31:0] ctrl_current_ki;
    wire ctrl_run;
    wire [15:0] ctrl_angle_offset;
    wire ctrl_swap_current;
    wire [15:0] ctrl_open_angle;
    wire signed [31:0] ctrl_speed_ref;
    wire signed [31:0] ctrl_speed_kp;
    wire signed [31:0] ctrl_speed_ki;
    wire ctrl_speed_mode;
    wire signed [31:0] ctrl_position_ref;
    wire signed [31:0] ctrl_position_kp;
    wire signed [31:0] ctrl_position_ki;
    wire ctrl_position_mode;
    wire ctrl_recalibrate;
    wire ctrl_calib_apply;

    wire signed [15:0] id_measured;
    wire signed [15:0] iq_measured;
    wire current_calibrating;
    wire current_cal_done;
    wire calib_is_running;
    wire calib_done;
    wire calib_rotate_req;
    wire calib_force_zero;
    wire [15:0] calib_elec_angle;
    wire [15:0] calib_mech_angle;
    wire [15:0] calib_debug_error;
    wire [15:0] calib_zero_offset;
    wire [15:0] calib_ram_addr;

    generate
        if (SIMULATION != 0) begin : g_sim_control
            assign ctrl_closed_loop    = SIM_CLOSED_LOOP != 0;
            assign ctrl_id_ref         = SIM_ID_REF;
            assign ctrl_iq_ref         = SIM_IQ_REF;
            assign ctrl_open_increment = 32'd4000;
            assign ctrl_current_kp     = SIM_CURRENT_KP;
            assign ctrl_current_ki     = SIM_CURRENT_KI;
            assign ctrl_run            = SIM_RUN != 0;
            assign ctrl_angle_offset   = 16'd0;
            assign ctrl_swap_current   = 1'b0;
            assign ctrl_open_angle     = 16'd0;
            assign ctrl_speed_ref      = 32'sd0;
            assign ctrl_speed_kp       = 32'sd0;
            assign ctrl_speed_ki       = 32'sd0;
            assign ctrl_speed_mode     = 1'b0;
            assign ctrl_position_ref   = 32'sd0;
            assign ctrl_position_kp    = 32'sd0;
            assign ctrl_position_ki    = 32'sd0;
            assign ctrl_position_mode  = 1'b0;
            assign ctrl_recalibrate    = 1'b0;
            assign ctrl_calib_apply    = 1'b0;
        end else begin : g_vio_control
            vio_7020 u_vio (
                .clk(clk_in),
                .probe_in0(id_measured),
                .probe_in1(iq_measured),
                .probe_in2(mech_angle),
                .probe_in3(calib_is_running),
                .probe_in4(calib_done),
                .probe_out0(ctrl_closed_loop),
                .probe_out1(ctrl_id_ref),
                .probe_out2(ctrl_iq_ref),
                .probe_out3(ctrl_open_increment),
                .probe_out4(ctrl_current_kp),
                .probe_out5(ctrl_current_ki),
                .probe_out6(ctrl_run),
                .probe_out7(ctrl_angle_offset),
                .probe_out8(ctrl_swap_current),
                .probe_out9(ctrl_open_angle),
                .probe_out10(ctrl_speed_ref),
                .probe_out11(ctrl_speed_kp),
                .probe_out12(ctrl_speed_ki),
                .probe_out13(ctrl_speed_mode),
                .probe_out14(ctrl_position_ref),
                .probe_out15(ctrl_position_kp),
                .probe_out16(ctrl_position_ki),
                .probe_out17(ctrl_position_mode),
                .probe_out18(ctrl_recalibrate),
                .probe_out19(ctrl_calib_apply)
            );
        end
    endgenerate

    // Control changes are applied only at a PWM boundary.
    reg safe_closed_loop;
    reg safe_run;
    reg safe_swap_current;
    reg safe_speed_mode;
    reg safe_position_mode;
    reg safe_calib_apply;
    reg signed [15:0] safe_id_ref;
    reg signed [15:0] safe_iq_ref;
    reg [15:0] safe_angle_offset;
    reg [15:0] safe_open_angle;
    reg [31:0] safe_open_increment;
    reg signed [31:0] safe_speed_ref;
    reg signed [31:0] safe_position_ref;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            safe_closed_loop <= 0;
            safe_run <= 0;
            safe_swap_current <= 0;
            safe_speed_mode <= 0;
            safe_position_mode <= 0;
            safe_calib_apply <= 0;
            safe_id_ref <= 0;
            safe_iq_ref <= 0;
            safe_angle_offset <= 0;
            safe_open_angle <= 0;
            safe_open_increment <= 0;
            safe_speed_ref <= 0;
            safe_position_ref <= 0;
        end else if (pwm_sample_tick) begin
            safe_closed_loop <= ctrl_closed_loop;
            safe_run <= ctrl_run;
            safe_swap_current <= ctrl_swap_current;
            safe_speed_mode <= ctrl_speed_mode;
            safe_position_mode <= ctrl_position_mode;
            safe_calib_apply <= ctrl_calib_apply;
            safe_id_ref <= ctrl_id_ref;
            safe_iq_ref <= ctrl_iq_ref;
            safe_angle_offset <= ctrl_angle_offset;
            safe_open_angle <= ctrl_open_angle;
            safe_open_increment <= ctrl_open_increment;
            safe_speed_ref <= ctrl_speed_ref;
            safe_position_ref <= ctrl_position_ref;
        end
    end

    reg [30:0] current_sum_a;
    reg [30:0] current_sum_b;
    reg [11:0] current_offset_a;
    reg [11:0] current_offset_b;
    reg [CAL_COUNT_W-1:0] current_cal_count;
    reg current_calibrating_r;
    reg current_cal_done_r;
    reg recalibrate_d;
    assign current_calibrating = current_calibrating_r;
    assign current_cal_done = current_cal_done_r;

    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            current_sum_a <= 0;
            current_sum_b <= 0;
            current_offset_a <= 12'd2048;
            current_offset_b <= 12'd2048;
            current_cal_count <= 0;
            current_calibrating_r <= 1'b1;
            current_cal_done_r <= 1'b0;
            recalibrate_d <= 1'b0;
        end else begin
            recalibrate_d <= ctrl_recalibrate;
            if (ctrl_recalibrate && !recalibrate_d) begin
                current_sum_a <= 0;
                current_sum_b <= 0;
                current_cal_count <= 0;
                current_calibrating_r <= 1'b1;
                current_cal_done_r <= 1'b0;
            end else if (current_calibrating_r && adc_pair_valid) begin
                if (current_cal_count == CURRENT_CAL_SAMPLES - 1) begin
                    current_offset_a <= (current_sum_a + adc_code_a) / CURRENT_CAL_SAMPLES;
                    current_offset_b <= (current_sum_b + adc_code_b) / CURRENT_CAL_SAMPLES;
                    current_calibrating_r <= 1'b0;
                    current_cal_done_r <= 1'b1;
                end else begin
                    current_sum_a <= current_sum_a + adc_code_a;
                    current_sum_b <= current_sum_b + adc_code_b;
                    current_cal_count <= current_cal_count + 1'b1;
                end
            end
        end
    end



    wire signed [12:0] current_delta_a = $signed({1'b0, adc_code_a}) - $signed({1'b0, current_offset_a});
    wire signed [12:0] current_delta_b = $signed({1'b0, adc_code_b}) - $signed({1'b0, current_offset_b});
    wire signed [16:0] current_scaled_a = current_delta_a <<< 4;
    wire signed [16:0] current_scaled_b = current_delta_b <<< 4;
    function automatic signed [15:0] saturate_current;
        input signed [16:0] value;
        begin
            if (value > 17'sd32767) saturate_current = 16'sh7fff;
            else if (value < -17'sd32768) saturate_current = 16'sh8000;
            else saturate_current = value[15:0];
        end
    endfunction
    wire signed [15:0] current_input_a = safe_swap_current ? saturate_current(current_scaled_b) : saturate_current(current_scaled_a);
    wire signed [15:0] current_input_b = safe_swap_current ? saturate_current(current_scaled_a) : saturate_current(current_scaled_b);
    reg signed [15:0] current_sample_a;
    reg signed [15:0] current_sample_b;
    reg current_feedback_valid;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            current_sample_a <= 0;
            current_sample_b <= 0;
            current_feedback_valid <= 0;
        end else begin
            current_feedback_valid <= 0;
            if (adc_pair_valid && current_cal_done_r) begin
                current_sample_a <= current_input_a;
                current_sample_b <= current_input_b;
                current_feedback_valid <= 1'b1;
            end
        end
    end
    // Do not put an IIR pole in the 50 kHz feedback/OCP path.
    wire signed [15:0] phase_current_a = current_sample_a;
    wire signed [15:0] phase_current_b = current_sample_b;

    // Encoder calibration uses mechanical angle in [31:16], matching the
    // original auto_calibration_core contract.
    wire [31:0] raw_mech_angle_32 = {mech_angle, 16'd0};
    auto_calibration_core #(.POLE_PAIRS(POLE_PAIRS)) u_calibration (
        .clk(clk_in), .rst_n(rst_n), .start_calib(ctrl_recalibrate),
        .is_calibrating(calib_is_running), .calib_done(calib_done),
        .rotate_en(calib_rotate_req), .force_align_zero(calib_force_zero),
        .raw_mech_angle_in(raw_mech_angle_32),
        .open_loop_angle_in(open_angle_accumulator[31:16]),
        .calib_mech_angle_out(calib_mech_angle), .calib_elec_angle_out(calib_elec_angle),
        .debug_error_val(calib_debug_error), .zero_offset_o(calib_zero_offset),
        .ram_addr_o(calib_ram_addr)
    );

    wire real_closed_loop = (calib_rotate_req || calib_force_zero) ? 1'b0 : safe_closed_loop;
    reg [31:0] open_angle_accumulator;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n)
            open_angle_accumulator <= 0;
        else if (calib_force_zero)
            open_angle_accumulator <= 0;
        else if (safe_run && !real_closed_loop)
            open_angle_accumulator <= open_angle_accumulator +
                (calib_rotate_req ? CALIB_OPEN_INCREMENT : safe_open_increment);
    end
    wire [15:0] open_mech_angle = calib_is_running ? open_angle_accumulator[31:16] :
        ((safe_open_angle != 0) ? safe_open_angle : open_angle_accumulator[31:16]);
    wire [15:0] active_angle = calib_force_zero ? 16'd0 :
        ((real_closed_loop && safe_calib_apply && calib_done) ? (calib_elec_angle + safe_angle_offset) :
         (real_closed_loop ? (elec_angle + safe_angle_offset) :
          (open_mech_angle * POLE_PAIRS)));

    // Mode edges are deliberately synchronous to the control clock. These
    // one-cycle pulses preload the PID integrators before a loop is enabled.
    wire real_loop_ctrl = calib_is_running ? 1'b0 : safe_closed_loop;
    wire signed [15:0] real_id_ref = calib_is_running ? 16'sd3500 : safe_id_ref;
    wire signed [31:0] id_preload_val = {{16{real_id_ref[15]}}, real_id_ref};
    wire signed [31:0] iq_preload_val = calib_is_running ? 32'sd0 : {{16{safe_iq_ref[15]}}, safe_iq_ref};
    reg real_loop_ctrl_d1, calib_running_d1, speed_mode_d1, position_mode_d1;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            real_loop_ctrl_d1 <= 0; calib_running_d1 <= 0;
            speed_mode_d1 <= 0; position_mode_d1 <= 0;
        end else begin
            real_loop_ctrl_d1 <= real_loop_ctrl; calib_running_d1 <= calib_is_running;
            speed_mode_d1 <= safe_speed_mode; position_mode_d1 <= safe_position_mode;
        end
    end
    wire cur_preload_trig = (real_loop_ctrl && !real_loop_ctrl_d1) || (!calib_is_running && calib_running_d1);
    wire spd_preload_trig = safe_speed_mode && !speed_mode_d1;
    wire pos_preload_trig = safe_position_mode && !position_mode_d1;

    wire [31:0] cordic_data;
    wire cordic_valid;
    wire signed [15:0] sin_value = cordic_data[31:16];
    wire signed [15:0] cos_value = cordic_data[15:0];
    cordic_0 u_cordic (
        .aclk(clk_in),
        .s_axis_phase_tvalid(1'b1),
        .s_axis_phase_tdata(active_angle),
        .m_axis_dout_tvalid(cordic_valid),
        .m_axis_dout_tdata(cordic_data)
    );

    wire signed [15:0] i_alpha;
    wire signed [15:0] i_beta;
    wire clarke_valid;
    clarke_transform u_clarke (
        .clk(clk_in), .rst_n(rst_n), .i_valid(current_feedback_valid),
        .i_a(phase_current_a), .i_b(phase_current_b), .o_valid(clarke_valid),
        .i_alpha(i_alpha), .i_beta(i_beta)
    );

    wire park_valid;
    park_transform u_park (
        .sys_clk_i(clk_in), .sys_rst_n_i(rst_n),
        .i_valid(clarke_valid & cordic_valid),
        .i_alpha(i_alpha), .i_beta(i_beta), .i_sin(sin_value), .i_cos(cos_value),
        .o_valid(park_valid), .o_id(id_measured), .o_iq(iq_measured)
    );

    reg [15:0] pos_ref_synced;
    reg pos_just_entered;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            pos_ref_synced <= 0;
            pos_just_entered <= 0;
        end else if (!safe_position_mode || !safe_closed_loop || !safe_run) begin
            pos_ref_synced <= mech_angle;
            pos_just_entered <= 1'b1;
        end else if (pos_just_entered) begin
            pos_ref_synced <= mech_angle;
            pos_just_entered <= 1'b0;
        end else begin
            pos_ref_synced <= safe_position_ref[15:0];
        end
    end
    wire [15:0] position_error_u = pos_ref_synced - mech_angle;
    wire signed [15:0] position_error = position_error_u;
    wire signed [31:0] position_loop_out;
    position_pid #(
        .INTEGRAL_VALUE_MAX(32'd1_000_000_000),
        .INTEGRAL_VALUE_MIN(-32'd1_000_000_000),
        .FEEDBACK_VALUE_MAX(32'd200_000_000),
        .FEEDBACK_VALUE_MIN(-32'd200_000_000)
    ) u_position_loop (
        .sys_clk_i(clk_in), .sys_rst_n_i(rst_n),
        .position_pid_en_i(encoder1_valid & safe_position_mode & safe_run),
        .position_pid_ack_o(), .P_i(ctrl_position_kp), .I_i(ctrl_position_ki), .D_i(0),
        .desired_value_i({{16{position_error[15]}}, position_error}), .actual_value_i(0),
        .feedback_value_o(position_loop_out), .error_out(), .preload_en(pos_preload_trig), .preload_val(speed_ref_ramp)
    );

    wire signed [31:0] selected_speed_ref = safe_position_mode ? position_loop_out : safe_speed_ref;
    reg signed [31:0] speed_ref_ramp;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) speed_ref_ramp <= 0;
        else if (!safe_closed_loop || (!safe_speed_mode && !safe_position_mode)) speed_ref_ramp <= motor_speed;
        else speed_ref_ramp <= speed_ref_ramp + ((selected_speed_ref - speed_ref_ramp) >>> 8);
    end
    wire signed [31:0] speed_loop_out;
    position_pid #(
        .INTEGRAL_VALUE_MAX(32'd500_000_000),
        .INTEGRAL_VALUE_MIN(-32'd500_000_000),
        .FEEDBACK_VALUE_MAX(32'd20000),
        .FEEDBACK_VALUE_MIN(-32'd20000)
    ) u_speed_loop (
        .sys_clk_i(clk_in), .sys_rst_n_i(rst_n),
        .position_pid_en_i(encoder1_valid & (safe_speed_mode | safe_position_mode) & safe_run),
        .position_pid_ack_o(), .P_i(ctrl_speed_kp), .I_i(ctrl_speed_ki), .D_i(0),
        .desired_value_i(speed_ref_ramp), .actual_value_i(motor_speed),
        .feedback_value_o(speed_loop_out), .error_out(), .preload_en(spd_preload_trig), .preload_val({{16{iq_measured[15]}}, iq_measured})
    );

    wire signed [31:0] current_iq_ref = (safe_speed_mode | safe_position_mode) ?
                                            speed_loop_out : {{16{safe_iq_ref[15]}}, safe_iq_ref};
    wire signed [31:0] id_controller_out;
    wire signed [31:0] iq_controller_out;
    wire id_controller_done;
    wire iq_controller_done;
    position_pid #(
        .INTEGRAL_VALUE_MAX(32'd20_000_000),
        .INTEGRAL_VALUE_MIN(-32'd20_000_000),
        .FEEDBACK_VALUE_MAX(32'd12000),
        .FEEDBACK_VALUE_MIN(-32'd12000)
    ) u_id_loop (
        .sys_clk_i(clk_in), .sys_rst_n_i(rst_n),
        .position_pid_en_i(park_valid & real_closed_loop & safe_run),
        .position_pid_ack_o(id_controller_done), .P_i(ctrl_current_kp), .I_i(ctrl_current_ki), .D_i(0),
        .desired_value_i({{16{safe_id_ref[15]}}, safe_id_ref}),
        .actual_value_i({{16{id_measured[15]}}, id_measured}),
        .feedback_value_o(id_controller_out), .error_out(), .preload_en(cur_preload_trig), .preload_val(id_preload_val)
    );
    position_pid #(
        .INTEGRAL_VALUE_MAX(32'd20_000_000),
        .INTEGRAL_VALUE_MIN(-32'd20_000_000),
        .FEEDBACK_VALUE_MAX(32'd12000),
        .FEEDBACK_VALUE_MIN(-32'd12000)
    ) u_iq_loop (
        .sys_clk_i(clk_in), .sys_rst_n_i(rst_n),
        .position_pid_en_i(park_valid & real_closed_loop & safe_run),
        .position_pid_ack_o(iq_controller_done), .P_i(ctrl_current_kp), .I_i(ctrl_current_ki), .D_i(0),
        .desired_value_i(current_iq_ref),
        .actual_value_i({{16{iq_measured[15]}}, iq_measured}),
        .feedback_value_o(iq_controller_out), .error_out(), .preload_en(cur_preload_trig), .preload_val(iq_preload_val)
    );

    wire signed [15:0] voltage_d = real_closed_loop ? id_controller_out[15:0] : real_id_ref;
    wire signed [15:0] voltage_q = real_closed_loop ? iq_controller_out[15:0] : (calib_is_running ? 16'sd0 : safe_iq_ref);
    wire voltage_command_valid = real_closed_loop ? (id_controller_done & iq_controller_done) : cordic_valid;
    wire signed [15:0] voltage_alpha;
    wire signed [15:0] voltage_beta;
    wire inv_park_valid;
    inv_park_transform u_inv_park (
        .clk(clk_in), .rst_n(rst_n), .i_valid(voltage_command_valid),
        .i_vd(voltage_d), .i_vq(voltage_q), .i_sin(sin_value), .i_cos(cos_value),
        .o_valpha(voltage_alpha), .o_vbeta(voltage_beta), .o_valid(inv_park_valid)
    );

    wire signed [15:0] svpwm_a;
    wire signed [15:0] svpwm_b;
    wire signed [15:0] svpwm_c;
    wire svpwm_valid;
    svpwm_generator u_svpwm (
        .clk(clk_in), .rst_n(rst_n), .i_valid(inv_park_valid),
        .v_alpha(voltage_alpha), .v_beta(voltage_beta), .o_valid(svpwm_valid),
        .cmp_a(svpwm_a), .cmp_b(svpwm_b), .cmp_c(svpwm_c)
    );

    wire [15:0] unsigned_a = {~svpwm_a[15], svpwm_a[14:0]};
    wire [15:0] unsigned_b = {~svpwm_b[15], svpwm_b[14:0]};
    wire [15:0] unsigned_c = {~svpwm_c[15], svpwm_c[14:0]};
    wire [31:0] scaled_a = unsigned_a * PWM_PERIOD_COUNT;
    wire [31:0] scaled_b = unsigned_b * PWM_PERIOD_COUNT;
    wire [31:0] scaled_c = unsigned_c * PWM_PERIOD_COUNT;
    reg [15:0] duty_a;
    reg [15:0] duty_b;
    reg [15:0] duty_c;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            duty_a <= 0;
            duty_b <= 0;
            duty_c <= 0;
        end else if (svpwm_valid) begin
            duty_a <= (scaled_a[31:16] > PWM_PERIOD_COUNT) ? PWM_PERIOD_COUNT : scaled_a[31:16];
            duty_b <= (scaled_b[31:16] > PWM_PERIOD_COUNT) ? PWM_PERIOD_COUNT : scaled_b[31:16];
            duty_c <= (scaled_c[31:16] > PWM_PERIOD_COUNT) ? PWM_PERIOD_COUNT : scaled_c[31:16];
        end
    end

    function automatic over_current;
        input signed [15:0] value;
        begin
            over_current = (value > CURRENT_TRIP) || (value < -CURRENT_TRIP);
        end
    endfunction

    reg over_current_latched;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n || !safe_run)
            over_current_latched <= 1'b0;
        else if (current_feedback_valid &&
                 (over_current(phase_current_a) || over_current(phase_current_b)))
            over_current_latched <= 1'b1;
    end

    reg [31:0] encoder_watchdog;
    reg [31:0] adc_watchdog;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            encoder_watchdog <= CLK_HZ / 100;
            adc_watchdog <= CLK_HZ / 100;
        end else begin
            if (encoder1_valid)
                encoder_watchdog <= 0;
            else if (encoder_watchdog < CLK_HZ / 100)
                encoder_watchdog <= encoder_watchdog + 1'b1;
            if (adc_pair_valid)
                adc_watchdog <= 0;
            else if (adc_watchdog < CLK_HZ / 100)
                adc_watchdog <= adc_watchdog + 1'b1;
        end
    end
    wire encoder_alive = encoder_watchdog < CLK_HZ / 100;
    wire adc_alive = adc_watchdog < CLK_HZ / 100;
    wire drive_enable = safe_run && !over_current_latched && current_cal_done_r &&
                        encoder_alive && adc_alive;

    wire pwm_u_h_internal;
    wire pwm_u_l_internal;
    wire pwm_v_h_internal;
    wire pwm_v_l_internal;
    wire pwm_w_h_internal;
    wire pwm_w_l_internal;
    pwm_motor_driver #(
        .SYS_CLK_FREQ(CLK_HZ), .PWM_FREQ(PWM_HZ), .DEADTIME_NS(DEADTIME_NS)
    ) u_pwm (
        .clk(clk_in), .rst_n(rst_n),
        .cmp_u(duty_a), .cmp_v(duty_b), .cmp_w(duty_c),
        .pwm_update_tick(pwm_sample_tick),
        .pwm_u_h(pwm_u_h_internal), .pwm_u_l(pwm_u_l_internal),
        .pwm_v_h(pwm_v_h_internal), .pwm_v_l(pwm_v_l_internal),
        .pwm_w_h(pwm_w_h_internal), .pwm_w_l(pwm_w_l_internal)
    );

    assign pwm_u_h = drive_enable ? pwm_u_h_internal : 1'b0;
    assign pwm_u_l = drive_enable ? pwm_u_l_internal : 1'b0;
    assign pwm_v_h = drive_enable ? pwm_v_h_internal : 1'b0;
    assign pwm_v_l = drive_enable ? pwm_v_l_internal : 1'b0;
    assign pwm_w_h = drive_enable ? pwm_w_h_internal : 1'b0;
    assign pwm_w_l = drive_enable ? pwm_w_l_internal : 1'b0;

endmodule
