onerror {abort}
set sim_dir [file dirname [file normalize [info script]]]
set rtl_dir [file normalize [file join $sim_dir .. rtl]]
cd $sim_dir
if {![file exists modelsim_work]} {vlib modelsim_work}
vmap open_loop_work [file join $sim_dir modelsim_work]
vlog -sv -work open_loop_work +define+MODELSIM_SIM \
    [file join $sim_dir tb_open_loop_spin_top.v] \
    [file join $rtl_dir toptest open_loop_spin_top.v] \
    [file join $rtl_dir foc cordic_0.v] \
    [file join $rtl_dir foc inv_park_transform.v] \
    [file join $rtl_dir foc svpwm_generator.v] \
    [file join $rtl_dir foc pwm_motor_driver.v]
vsim -voptargs=+acc -onfinish stop open_loop_work.tb_open_loop_spin_top
log -r /*
if {![batch_mode]} {
    view wave
    add wave -group Control sim:/tb_open_loop_spin_top/clk_in sim:/tb_open_loop_spin_top/dut/rst_n
    add wave -group Control -radix decimal sim:/tb_open_loop_spin_top/dut/vio_set_id_ref sim:/tb_open_loop_spin_top/dut/vio_set_iq_ref
    add wave -group Angle -radix unsigned sim:/tb_open_loop_spin_top/dut/auto_angle_cnt sim:/tb_open_loop_spin_top/dut/active_angle
    add wave -group SinCos -radix decimal sim:/tb_open_loop_spin_top/dut/sin_val sim:/tb_open_loop_spin_top/dut/cos_val
    add wave -group Voltage -radix decimal sim:/tb_open_loop_spin_top/dut/valpha_ref sim:/tb_open_loop_spin_top/dut/vbeta_ref
    add wave -group SVPWM -radix decimal sim:/tb_open_loop_spin_top/dut/u_svpwm/va_32 sim:/tb_open_loop_spin_top/dut/u_svpwm/vb_32 sim:/tb_open_loop_spin_top/dut/u_svpwm/vc_32 sim:/tb_open_loop_spin_top/dut/u_svpwm/v_com
    add wave -group Modulation -radix decimal sim:/tb_open_loop_spin_top/dut/svpwm_cmp_a sim:/tb_open_loop_spin_top/dut/svpwm_cmp_b sim:/tb_open_loop_spin_top/dut/svpwm_cmp_c
    add wave -group Mapping -radix unsigned sim:/tb_open_loop_spin_top/dut/u_cmp_a sim:/tb_open_loop_spin_top/dut/calc_a_raw
    add wave -group Mapping sim:/tb_open_loop_spin_top/dut/pwm_update_flag
    add wave -group Compare -radix unsigned sim:/tb_open_loop_spin_top/dut/duty_u sim:/tb_open_loop_spin_top/dut/duty_v sim:/tb_open_loop_spin_top/dut/duty_w sim:/tb_open_loop_spin_top/dut/u_pwm_driver/cnt sim:/tb_open_loop_spin_top/dut/u_pwm_driver/comp_u
    add wave -group PWM sim:/tb_open_loop_spin_top/dut/u_pwm_driver/ideal_pwm_u sim:/tb_open_loop_spin_top/pwm_u_h sim:/tb_open_loop_spin_top/pwm_u_l sim:/tb_open_loop_spin_top/pwm_v_h sim:/tb_open_loop_spin_top/pwm_v_l sim:/tb_open_loop_spin_top/pwm_w_h sim:/tb_open_loop_spin_top/pwm_w_l
    configure wave -timelineunits us
}
run 2100 us
if {![batch_mode]} {wave zoom full}
