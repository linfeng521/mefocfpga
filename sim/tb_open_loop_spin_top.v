`timescale 1ns / 1ps
module tb_open_loop_spin_top;
    reg clk_in = 0;
    wire pwm_u_h, pwm_u_l, pwm_v_h, pwm_v_l, pwm_w_h, pwm_w_l;
    integer checked = 0;
    reg previous_valid = 0;
    reg [15:0] expected_u, expected_v, expected_w;
    integer signed_a;
    open_loop_spin_top dut (.clk_in(clk_in),
        .pwm_u_h(pwm_u_h), .pwm_u_l(pwm_u_l),
        .pwm_v_h(pwm_v_h), .pwm_v_l(pwm_v_l),
        .pwm_w_h(pwm_w_h), .pwm_w_l(pwm_w_l));
    always #10 clk_in = ~clk_in;
    always @(posedge clk_in) begin
        previous_valid = dut.rst_n && dut.pwm_update_flag;
        expected_u = dut.calc_a_raw[31:16];
        expected_v = dut.calc_b_raw[31:16];
        expected_w = dut.calc_c_raw[31:16];
        signed_a = $signed(dut.svpwm_cmp_a);
        if (previous_valid && dut.u_cmp_a !== (signed_a + 32768))
            $fatal(1, "Signed-to-unsigned mapping mismatch");
        #1;
        if (previous_valid) begin
            if (dut.duty_u !== expected_u || dut.duty_v !== expected_v || dut.duty_w !== expected_w)
                $fatal(1, "Duty mapping mismatch");
            if (dut.duty_u > 500 || dut.duty_v > 500 || dut.duty_w > 500)
                $fatal(1, "Duty out of range");
            checked = checked + 1;
        end
        if (dut.rst_n && ((^{pwm_u_h,pwm_u_l,pwm_v_h,pwm_v_l,pwm_w_h,pwm_w_l}) === 1'bx))
            $fatal(1, "PWM unknown");
        if ((pwm_u_h && pwm_u_l) || (pwm_v_h && pwm_v_l) || (pwm_w_h && pwm_w_l))
            $fatal(1, "Complementary outputs overlap");
    end
    initial begin
`ifndef MODELSIM_SIM
        $dumpfile("open_loop_spin.vcd");
        $dumpvars(0, clk_in, dut.rst_n,
            dut.vio_loop_ctrl, dut.vio_set_id_ref, dut.vio_set_iq_ref, dut.auto_angle_increment,
            dut.auto_angle_cnt, dut.active_angle, dut.sin_val, dut.cos_val, dut.cordic_done,
            dut.valpha_ref, dut.vbeta_ref, dut.inv_park_done,
            dut.u_svpwm.va_32, dut.u_svpwm.vb_32, dut.u_svpwm.vc_32, dut.u_svpwm.v_com,
            dut.svpwm_cmp_a, dut.svpwm_cmp_b, dut.svpwm_cmp_c, dut.pwm_update_flag,
            dut.u_cmp_a, dut.u_cmp_b, dut.u_cmp_c,
            dut.calc_a_raw, dut.calc_b_raw, dut.calc_c_raw,
            dut.duty_u, dut.duty_v, dut.duty_w,
            dut.u_pwm_driver.cnt, dut.u_pwm_driver.dir, dut.u_pwm_driver.comp_u,
            dut.u_pwm_driver.ideal_pwm_u,
            pwm_u_h, pwm_u_l, pwm_v_h, pwm_v_l, pwm_w_h, pwm_w_l);
`endif
        #2100000;
        if (checked < 100000) $fatal(1, "Too few valid updates: %0d", checked);
        $display("PASS: %0d open-loop updates", checked);
        $finish;
    end
endmodule

module vio_1 (
    input wire clk,
    input wire [15:0] probe_in0, probe_in1, probe_in2,
    input wire probe_in3, probe_in4,
    output wire signed [15:0] probe_out1, probe_out2,
    output wire [31:0] probe_out3,
    output wire probe_out6
);
    assign probe_out1 = 16'sd0;
    assign probe_out2 = 16'sd8192;
    assign probe_out3 = 32'd4295;
    assign probe_out6 = 1'b1;
endmodule
