# =========================================================
# 纯开环测试 (open_loop_spin_top) 专属约束
# =========================================================

# --- 1. 时钟约束 ---
set_property PACKAGE_PIN N18 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in]
create_clock -period 20.000 -name clk_in -waveform {0.000 10.000} [get_ports clk_in]

# --- 2. U 相半桥 (PWM_U_H, PWM_U_L) ---
set_property PACKAGE_PIN W18 [get_ports pwm_u_h]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_u_h]
set_property PACKAGE_PIN W19 [get_ports pwm_u_l]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_u_l]

# --- 3. V 相半桥 (PWM_V_H, PWM_V_L) ---
set_property PACKAGE_PIN N17 [get_ports pwm_v_h]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_v_h]
set_property PACKAGE_PIN P18 [get_ports pwm_v_l]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_v_l]

# --- 4. W 相半桥 (PWM_W_H, PWM_W_L) ---
set_property PACKAGE_PIN P15 [get_ports pwm_w_h]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_w_h]
set_property PACKAGE_PIN P16 [get_ports pwm_w_l]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_w_l]


# =========================================================
# 以下为 VIO / ILA 调试核心自动生成的约束 (交由 Vivado 管理)
# =========================================================
set_property C_CLK_INPUT_FREQ_HZ 50000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_in_IBUF_BUFG]

# =========================================================
# 以下为被注释掉的原 fpga_top 约束 (以后切回闭环时再解除注释)
# =========================================================
# set_property PACKAGE_PIN N18 [get_ports {ad7606_data[15]}]
# set_property PACKAGE_PIN P19 [get_ports {ad7606_data[14]}]
# ... (中间那些 AD7606、CAN、SPI、MA702 的约束全都在这里处于注释状态) ...