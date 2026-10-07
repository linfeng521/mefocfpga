// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Oct  7 17:41:31 2026
// Host        : DESKTOP-NP6HTQ7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/MeData/foccode/mefpgafoc/fpga_foc_motorcontrol/MeFocFPGA/prj/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [15:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]dinb;
  wire [15:0]douta;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.142799 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 47264)
`pragma protect data_block
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
f7eNOBfVQimxQUo=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
