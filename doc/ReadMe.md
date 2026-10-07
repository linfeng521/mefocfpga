# MeFocFPGA RTL 命名约定

## 端口方向前缀

统一使用前缀表示接口方向或对象类型：

```text
i_  input 输入端口
o_  output 输出端口
r_  register 寄存器
w_  wire 内部连线
```

例如：

```verilog
input  wire signed [15:0] i_ia;
input  wire signed [15:0] i_ib;
output wire signed [15:0] o_i_alpha;
output wire signed [15:0] o_i_beta;
```

含义分别是：A/B 相电流输入，以及 Alpha/Beta 轴电流输出。


## 内部信号

模块内部信号不再使用 `i_`、`o_` 接口前缀，直接按功能命名：

```verilog
wire signed [17:0] sum_ab;
wire signed [33:0] beta_product;
```

## 定点数约定

FOC 算法模块的数据接口统一使用 **signed Q1.15**，例如归一化后的电流、电压以及 `sin/cos`：

```text
实际值 = signed整数 / 32768
存储值 = 实际值 × 32768
表示范围 = -1.0 ～ 0.999969
```

常用数值：

```text
-1.0  → -32768 → 16'h8000
-0.5  → -16384 → 16'hC000
 0.0  →      0 → 16'h0000
 0.5  →  16384 → 16'h4000
接近1 →  32767 → 16'h7FFF
```

两个 Q1.15 数相乘时，使用 32 位 signed 中间量，乘积算术右移 15 位后恢复为 Q1.15：

```verilog
wire signed [31:0] product;

assign product = value_a * value_b;
assign result  = product >>> 15;
```

ADC 原始计数应先完成零偏校正和满量程归一化，再送入使用 Q1.15 接口的 FOC 模块。缩位输出前应根据范围进行饱和处理，避免溢出回绕。

Q1.15 约定只适用于 FOC 算法的数据接口，不包括时钟、复位、状态信号、计数器、PWM 的 ARR/CCR、角度编码以及扩位中间量。这些信号应按实际用途单独标明格式。
