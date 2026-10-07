onerror {abort}
set sim_dir [file dirname [file normalize [info script]]]
cd $sim_dir
if {![file exists modelsim_pwm_work]} {vlib modelsim_pwm_work}
vmap pwm_test_work [file join $sim_dir modelsim_pwm_work]
vlog -sv -work pwm_test_work [file join $sim_dir tb_pwm_motor_driver.v] [file join $sim_dir .. rtl foc pwm_motor_driver.v]
vsim -voptargs=+acc -onfinish stop pwm_test_work.tb_pwm_motor_driver
log -r /*
if {![batch_mode]} {
    view wave
    add wave -group Input sim:/tb_pwm_motor_driver/clk sim:/tb_pwm_motor_driver/rst_n
    add wave -group Input -radix unsigned sim:/tb_pwm_motor_driver/duty_percent sim:/tb_pwm_motor_driver/cmp_u sim:/tb_pwm_motor_driver/cmp_v sim:/tb_pwm_motor_driver/cmp_w
    add wave -group Carrier -radix unsigned sim:/tb_pwm_motor_driver/u_pwm_motor_driver/cnt sim:/tb_pwm_motor_driver/u_pwm_motor_driver/comp_u
    add wave -group Carrier sim:/tb_pwm_motor_driver/u_pwm_motor_driver/dir sim:/tb_pwm_motor_driver/pwm_update_tick
    add wave -group Ideal sim:/tb_pwm_motor_driver/u_pwm_motor_driver/ideal_pwm_u sim:/tb_pwm_motor_driver/u_pwm_motor_driver/ideal_pwm_v sim:/tb_pwm_motor_driver/u_pwm_motor_driver/ideal_pwm_w
    add wave -group Output sim:/tb_pwm_motor_driver/pwm_u_h sim:/tb_pwm_motor_driver/pwm_u_l sim:/tb_pwm_motor_driver/pwm_v_h sim:/tb_pwm_motor_driver/pwm_v_l sim:/tb_pwm_motor_driver/pwm_w_h sim:/tb_pwm_motor_driver/pwm_w_l
    add wave -group Deadtime -radix unsigned sim:/tb_pwm_motor_driver/u_pwm_motor_driver/dt_u/dt_counter
    configure wave -timelineunits us
}
run 610 us
if {![batch_mode]} {wave zoom full}
