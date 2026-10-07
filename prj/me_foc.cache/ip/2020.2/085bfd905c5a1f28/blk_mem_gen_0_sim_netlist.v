// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Oct  7 17:29:30 2026
// Host        : DESKTOP-NP6HTQ7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    douta,
    clkb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
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
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
        .ena(1'b0),
        .enb(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 46640)
`pragma protect data_block
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
T9J+lmRv1giFrMs2bb8=
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
