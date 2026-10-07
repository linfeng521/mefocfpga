# 开环波形仿真

原 open_loop_spin_top 和算法模块保持不变。testbench 内的 vio_1 是固定输出的仿真替身，不是真实 VIO IP。
仿真仅加入脚本列出的六个源码；不要同时加入真实 vio_1，也不要把 testbench 加到综合源。
Vivado 中将 tb_open_loop_spin_top 设为仿真顶层；排除真实 VIO 的仿真模型，避免同名模块冲突。

在 ModelSim 的 Transcript 中运行：

```tcl
do D:/MeData/foccode/mefpgafoc/fpga_foc_motorcontrol/MeFocFPGA/sim/run_open_loop_spin.do
```

脚本自动编译、加载顶层、保留内部信号、添加分组波形并运行 2100 us。
有符号电压采用 decimal，无符号占空比编码和比较值采用 unsigned。
ModelSim 使用原生波形记录，不需要 GTKWave 或 VCD。
重新运行可用 restart -f，然后 run 2100 us；修改源码后重新执行 do 脚本。
Icarus 脚本仅保留作独立交叉验证，不是 ModelSim 的运行入口。

固定输入：Vd=0，Vq=8192（Q1.15 的 0.25），使能=1，机械角累加步长=4295。
50MHz 时钟，机械相位每拍累加；乘 10 对极后电角度周期约 2ms。仿真运行 2.1ms，覆盖约一圈电角度。
步长仅用于快速观察仿真，不是实际电机上电参数。

## 观察顺序

1. auto_angle_cnt、active_angle：机械相位累加和电角度编码；按 unsigned 显示。
2. sin_val、cos_val：按 signed decimal 或模拟曲线显示。
3. valpha_ref、vbeta_ref：反 Park 的归一化电压。
4. va_32、vb_32、vc_32、v_com：SVPWM 内三相电压及共模偏移；这些是阻塞赋值中间量，不是流水寄存器。
5. svpwm_cmp_a/b/c：加入偏移后的 signed 电压调制量，不是计数值。
6. u_cmp_a/b/c：unsigned，等于对应 signed 整数值加 32768。
7. calc_a_raw：unsigned 乘积，等于 u_cmp_a × 500。
8. duty_u/v/w：乘积高 16 位，是真正比较计数值；在 pwm_update_flag 有效的采样边沿更新。
9. cnt、comp_u、ideal_pwm_u：载波、含死区补偿的比较值和死区处理前 PWM。
10. pwm_u_h/l：最终互补输出。

先缩放到整个 2.1ms 看三相调制趋势，再放大至 20us 看载波和 PWM，最后放大至 200ns 看流水线和死区。
输出映射：duty_u = floor((signed(cmp_a)+32768) × 500 / 65536)。
例如 cmp_a=0 → u_cmp_a=32768 → calc_a_raw=16384000 → duty_u=250。
非阻塞赋值使 duty_u 在下一采样边沿接收此前的 SVPWM 结果，不要直接比较同一时刻新 cmp 与旧 duty。

检查包括有效更新的三相比较值映射、A 相 signed 平移、占空比范围及互补输出不同时导通。
不包含电机模型、算法精度全覆盖、真实板级安全验证。
现有顶层使能关闭仅令比较值为零，不等于六路全部关断；PWM 模块也没有周期锁存比较值。暂保留原代码供观察，不建议凭本次仿真直接上电。
