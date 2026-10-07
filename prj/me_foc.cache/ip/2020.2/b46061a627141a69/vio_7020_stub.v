// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Oct  7 17:03:43 2026
// Host        : DESKTOP-NP6HTQ7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_7020_stub.v
// Design      : vio_7020
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_in4, probe_out0, probe_out1, probe_out2, probe_out3, probe_out4, probe_out5, probe_out6, 
  probe_out7, probe_out8, probe_out9, probe_out10, probe_out11, probe_out12, probe_out13, 
  probe_out14, probe_out15, probe_out16, probe_out17, probe_out18, probe_out19)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[15:0],probe_in1[15:0],probe_in2[15:0],probe_in3[0:0],probe_in4[0:0],probe_out0[0:0],probe_out1[15:0],probe_out2[15:0],probe_out3[31:0],probe_out4[31:0],probe_out5[31:0],probe_out6[0:0],probe_out7[15:0],probe_out8[0:0],probe_out9[15:0],probe_out10[31:0],probe_out11[31:0],probe_out12[31:0],probe_out13[0:0],probe_out14[31:0],probe_out15[31:0],probe_out16[31:0],probe_out17[0:0],probe_out18[0:0],probe_out19[0:0]" */;
  input clk;
  input [15:0]probe_in0;
  input [15:0]probe_in1;
  input [15:0]probe_in2;
  input [0:0]probe_in3;
  input [0:0]probe_in4;
  output [0:0]probe_out0;
  output [15:0]probe_out1;
  output [15:0]probe_out2;
  output [31:0]probe_out3;
  output [31:0]probe_out4;
  output [31:0]probe_out5;
  output [0:0]probe_out6;
  output [15:0]probe_out7;
  output [0:0]probe_out8;
  output [15:0]probe_out9;
  output [31:0]probe_out10;
  output [31:0]probe_out11;
  output [31:0]probe_out12;
  output [0:0]probe_out13;
  output [31:0]probe_out14;
  output [31:0]probe_out15;
  output [31:0]probe_out16;
  output [0:0]probe_out17;
  output [0:0]probe_out18;
  output [0:0]probe_out19;
endmodule
