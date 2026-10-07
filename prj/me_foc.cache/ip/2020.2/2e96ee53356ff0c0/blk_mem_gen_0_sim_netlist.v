// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Oct  7 17:41:31 2026
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 47408)
`pragma protect data_block
y9n1PP8QZONYiK6CfbGex+LURa7W5c6s8gTQVlRqHfQwLAbgbMiWvVME19y0W/wdXn5ETUUZSY6T
NULHvvVBWoIoZ9bdm4mkpKAoMp8IUjQJ0Qqw+0abgBBUfhJF/qCVZmL4LW1+IJ6ZZF4xDsnwqURL
s/gKhVd4QtF1cZmAlbsFax1xssLDUlHZ36qkGIC3ENret9+Bp08y/ruYIbOqpqf6W0vvKbSO2O3c
sDhff7yDQqPVs0hfqoHkCeaRNCOjBewMP6I/UntLAVjLqhmwgH4i5LIBUTD8LVTw0cIw51gRJXTB
PM4+rA33rPl4ptZbstBaSY7Z1IWKEZgeu6Oaf5KxoDW342gna/8ZgPSv9LZB3dzMa5vYovL1cOEl
FhNYKqOffaMKzz5DS3XbVwR4Y/dDN0M07nd1zNz6/vIGtDS0PjO+j3m5tEixnrXo/uC8x/N9EFGH
GBcwEsUixerOcfGRQbxFJ/mgjx16xelbxzGKQk8pLaPhejiUxUzHABAoGJVbOfqIVQnr/1v2Wkew
ZyMaMnccOAaKf6LyI1q3gVavP0efznN4ZUZr8GJKMUJZBFfmT6BJ1WXBOWR/2EsiKSfQJtmlLDsw
N6XYySjRx4A3O+Pim+9o3oFuzc6xppOCQ/AmjByobQ4TNEWZ2KmYThAOYwgRdMUS/iEJQYniB85T
b1ZVxER2bQ8/Q7a61YbYlMbxyvZgfdTQhLxZaJYii+Lmy2fZbtyXKI0R/unEkTKhCID+Nhqw0i7k
OBFp2Nem2lFqAlw3QGK7eAoKF27WseIMrEjrCUYzKbCAWwKiAN3Ptopkr3DIhnGrM7fL/fjuKJT1
AR8vjYnrAD2lIlQRQj+G90zgrhlSc8CK/Gv4AwblcxhGWTYOPKdWCSqs/NGgbE25HgOW3ywe74tx
kjgX4kUqz+w0SQyWxVrmEubeSV80UQ6AqyJ5EykM2KCtbp2FpwaCb/s5SvcvGn4H/kFhWL1/k5bN
qgxhmfI5GgJkXN2VDaxt6J+0iPJYEDOJAwsUjWg66X+UdESa5MIQciZh5AC9CB06bZ6m/Y36jNqy
vd5AfNYfpFyqanQxIcbxnBdqTbJEFYTWpYvC3TCtkaXLLgsf4gFEKLd3XSgNmFS78KlHXNH2bWrc
rkSfrIabdQlEhEqFbGEMuBK+p1mvwFu8OjPzg0Kdi5FbH+cHqrWRe/bOgxaD+qqjttiUOtVhTJlz
q+SAafKBx0uD33FlneqohDe6g3z6VRkFt0t3t2hfYbslcUhHIbElCMqa77ktucHfez0H/UNqQkU0
pXpUfI7P6/LqGUK2+WNsl/k5EPQKXO5BfB/16TUZim3w0kuORIPOGY0LugIYYzE2/y8hi/iHoiNi
MLvpD8tew5c9WyPzE9YgEl9stCwOCgcd97PKTTH88Zo34IErFEhIaiNo5vKP5c4wMbKdbF1l1LiZ
TBnGqyHxHeOL4Af4EGgyNH3NTuKq5zdhTK2OLOwFKgWIDh1siBoYZ5PWmZ+XOp6med6QO9TjQBr+
JPZUSaXbahTrNPH3RMStJHAsrqn2IR4JGjQHaoCrC1UjPSrVO+e5itH8hA2/d89fJTGUBXmSA286
6L52IPv/9CMtih39ceya6m066klG743Y+IzM/CKg2RUXlVEwP8H6zr63oBXy3Pe/fspbfSkdVJFw
rQISdynKdTsI+PsEpivpTEYCPinDvsXm6yuDLWwXwKW8p8MI33OICubkdB2gYDzfWveIFbL0/z4d
NfdakG//jg3ftxIeWoRJ5BWAjEqOk2BBlwZDr2NKI0jP3d4o4zo5wZZP+wSvdljiLKM1rmDwzW+V
bLjJ9/LWjypukdzypOhHoDHYBDi6HmxRBXX1iJp9+BScqWxrBxPJsoZychSrjWsvlx3l7LieDpuB
9WeLx7iduFTHUXG4VCPKrUDsjr/L30gPUn7pb9RpiQGgnoWkNX89i75w5VV5Sp9svuiMISdIEUgA
qjam7CXgciWZP+pwaoBIVfzee9l5rQPCO5y6Y6dL/Crxni82gjUY9Ise8ueUsD8VBd0TuUm5SQP6
hH5a4grwgOc2Fs2jAeOUOVqlzkU2G2K8J04rFTwN5kjDc3hCstpPYFYTOlcDAXCbAsh5DazO++lJ
fmMxFZZ5snhkSe0Vx30KiHKFH+2IsiaMvHU57GQqfrLvjvJL0vzX2v+21gZcaT5oklIjTbWDoYzs
pZouiCmGCQLG/ubmzAx+t7Qi2pqIb0c30L1FYSKUL+/tzQKFQO/RWlG6aVgCmeyHzgD1JTS0Rx+1
BZgVqVprrCvxIoagVvWVypnGcKlsly5amhfY0Zv7d3G7ySi8xW3yjUIdrsHLmCc3Pnc6fC5gSJaG
E4Z4/lhIo617OeKXF4EASfs5MVbnmbmcUx2OkVg6kDp9IscLpwhY3mRrLjlbdniYcmbipJ90xo1x
/bWhSZV2dfHj4eIEr+ZcYySA3HMEcEUQJ48bQv1/HwhT2UplKU7YxC3dxqZaJcGeYho+u+Gkshxc
pH6hQIthADYjP8L84f0+354RFUrXh3SpH81FV6nMralNnB0IXNTaiBI8hQNkIfxRYviSTimA+NF+
3Kg1762LjsZ/7lhyswjuLjVuYHjQs7M0PwrE+A4NnzOvrTrFlM5QLxQGCdF2yfth6lKGJrZ1uZSt
UcU7M30TLsNrylKIUlDnbQW/hBO+lWa+H7oyV+9G+ztvJzbBx5AmBWYVA4ed7F27pVlimZ7l4TJ4
8ingwkc0R3Fgca4ugkRppZf38t3JksfDpjREN7j+aUkT9RhyqhYJJjLV2bQBqnXDSPkQNufLpPO0
ZxLLoII8eE7qhlTD4kP0A+G6kNLxp7bS5fcghehCzn0N2NDihQha+UjMct0DYTQuO7gc5EGdVzBp
BGj2u/zUzZr5v7O2o9ICvIjnH3SgcmL9uvq7EhOJhEfV3LMEk9Y8D/E0cMDeqBwvqjBK30q+MCUA
ADoY54iNmXwIqTj4vdl9xe+Sp/PDyu4pNDYVvz/RnWaYOaVd5IIP5KhyC2vfCX6O13Wt+Tkq5pXA
/fMS1MmgGUCKWqkBW6jz/evqOoQKaC/V4fkrM6qIXS2ovDXhrkJcCSPnxwmF06mLb4VrUb9xRL9I
uS47M4FyU61Z9BLTbVPZw4oRVyPQ32LpC3GFfduH1nt4bAw2gEIhCUanYVRtt1suxJ6wpxptRv3J
a3ycowfyYWfK71ZumQ2Ua3nD6PYGP0TrM+kKljd58h1nU980M0Wk04yJZPLEgxyiwHaBiNF0tCfC
zNp9Z+cG6n0EF8UQQhAw+aZQUsAXl8SrG57jQV/fTa0VPXuemeN5j4GhPW9ZHGcp0pp4A3HBjlbe
UKMmajZ2X78aiu0qLOdAMBRFCDH4WT6r4k+4zy1gmOX3hiQCnXUNJaIPhYjaypH/ysKWP1xhj5Eb
LY28b45oQLALigV3xtDUuPNqhMPoJf3Nuxf6PuRCqmu+ByWkFdroUeu3SKC4IU+FJaVX0d2AiRAQ
l10XVYJRZeL40MCu1cZHCet4O6ARhaRpn3SYT3omTt8iJSJqdkYHLshnqKpEPpXEWC/AJbWXGsM8
91960QezcX46yGgPOWe2nN2ZvllZKF2LRQRs763D+tBQKPGc1ij+Fg6PLPtIm3CIBw1HgUSfTlt/
RwDPuG3RUiy4D2lThOADOHDvks7KsvNV0XQC9VL5BK3vPpAMUVcGEwfDS6SpovJx3CE/bo9AhARF
hVxU+oXxd5pmQo1iQmGTe+HwLCXjupitjc2L5tYjdxY0m7nzkGF3CN48Lx6f6PwTZoaUysYkTvAv
2EGLbfelAAjvztJ7DxyxOFil7ktqKJQGALJe5beAt1arfgzaBcYwWV4oUloFoPPK3SuvSaPTcsSB
0RO6TZAP/ZTac3rMGF1posczQLB1iO+jND7+DqernEl25jhwP02Wdf4Sb3d5kPzYLez1ge0js2hN
2JtwvoLPGu8cG6hoxp0Ztv8hAstIav1X4ZKnkT+oxdwuspRrOhIs/aCA6/iURv0IIZxyVHEULX7W
Yj6Ta32xVN0d2jprnnX7waxjPiSe2Mc6Nl71E6YaTvWT3FlltwSFyGIRK2nv2766vQCeF+pgrl/S
iS0BlDSneAMIm+qCYsoXvSovzS1ZmRrsDXQfUtRW6bv7seHYEY5Gn7Jpk0ahw6dMg12To5xc+9T5
e9v23dynWrWHVALTquMgLO1dMgPrXlnwpdG/m+yFHC7HTuK0LYGkUaT47rGWTXloszhAUAbTk2R3
6KmUpmYZ51C/C+3bzUsAf8V8Cs86AGTTBbGAXIL9SYE8Vv1HNXUZqfoMMV9YJY0DXEPQuIvpNgLv
LKfc0oakrdQtgAYdmU1KqbJFxTeDFsMorBvFhBtapf3SiAGK7IGJH1MVfM5AN5INxLj8Kt+wiAhT
h1iZ8O2HBEaGykxjXHXQVO+lwwzUqfyxNH8wIUx2xCrv07qoVBYt9HbF0C625yrgVpB52vpskyNo
yphzKqmvehtj1lvag45G8tFPCTzllaWRvxVOmndKQ12rLRnMlm5kNh3jI60Q130MI/DvCTthfJ7Y
pt/F/415imlN/nE+l/wlZDVVoYui4cCgbl9S1/2re018c/HonIw7oiJLceZ0zXa4p59rHaV0Hw0t
A73LsGUBbheaeADbNJldhmJCrh1OZ2xhFxrSEBBcdgo2652HwEYOKW3vgT9KrqXR0hq9U7YWFvo8
0W9REKvlyElY5oMK5NMm2wIZDR8k7tGJn9bmkhjQg5moOlKWE8TIQeOsMq6qlVcThdUVCetParfT
St4/3k8Nv29Zie5E19Z9GLtnmcWh+Y5fibLH4tzldlCSqYz6nTBi8p0mQY6n8ZFcLtoxGbzZUy+t
qgs89n4RaQY7BJ3v8ktTE7MYqJEMAtxtZce7UY429u0BtitQS30T1j1cK9C6+92rOQ/AuOHoUvmH
Yr2ubS32eI+I2eSO9BOqgWXrdp33/sjEqy1+raRTghzxNnzYFmaK31rC6Q2bBZv+Gez/EGms8FwW
1dWaFrcZnziE+WglIimn3zxnxbuZ8eNNPHlLgWoQztuYxIhLMnPDmvJN+W6hoI8+ZU1j7GoT141O
lxzs8bWZnCxq6wFAtiopUOvSt7HhB9YNe9Iina20ESjzyWbEp6FPsq2Xo5k/Hx5+aXNQ51tXyGoT
IJZjDGYE4v/F2oesLsnLN6pwZovqVc2vc6xXDDBrgyV3mtvmKv3WXt+87pu/sIm7QqPMGUVgoveq
y/YsZlXVMTDmDo9ztQs7RGTEhcgAZmI2CMSrKlm/PdN4u+BWlGRt5w4UWYr+LZuEkAzrJ2I0vj+D
CjCfOWxbKwugxwP1nkLFHSNoy/9XmmXT/yY/0wQQgkjPgrcLnelKkK1YDxE91vLyGIPY4XWqTsCt
dSL6oDrA+H4LJcGI0xMiuwYQGJtzV8eF6gSuaMpdNP+wXcnHiSTstXUaD/ck4nvfSFw5ry0oHFVn
AInk+VUl70Uo9VG4Si6Q7COqzusjajrFSq+BHRkEeq+qNa+ej0ShMwk5T4+pL69RwXHvubOabnAY
DEj0jdE11JxojVNaI9X5OQ3W/T0caNC3J7R27uhfdpRmIYBLCu7ovju/OWWwhpkWm7In0MltCj4x
p3iAsHJsKxUVe5RJ403MElXFNCNbFbxNPGG52C6unt1677NMf6zo6E9pGbU9McOMoTO7j+15w/9b
tFAbTzQzxVbZsXE1FVo0FqiDKrrCC4hUY3K7ZaquVU0hamrT7RSgTZbRwhCyj9ocYYm50lBBaOBW
3EEWYtSn6EMevGrg9nOPWnAan1+7kw4oE3jQ5Aya3O/XMXjOrwCNye8+MDP48rqm3mjk8NXviLeO
D5G9QYijXEGlgoMq3JdRJdIZcr1xjf55lmfFLlm8CGAsX9f080aQBNxS5kkRxkOpIK8lZ8WtYmOr
4wVNMU3DWZ1dxnQt1kZIJN5TWipqr3zUGy1qAbUfrHbOxAJXIG84rlJlVqy6BG7jydoRO6vUGbuz
+YRXNs5e5/Yhd8cK2e2iy1TCNX64ShtGGzj2hk2IFKCxsbrnxi6y/gf/opKSsL64kCZvU21k0oMj
4rqEXmzGsSkFlMis/3v7CfhSAr3peRbuA/BSfaUdCQeZbSbZlDIK56IFpGYXXjrfWRqAUSKbXmeB
qjsL+YBqI7oKirArJiNXHkOg7Ksbrl1SRgSSXnvbquQdHz0Z2P29eb9z7m88FC6CF3tTySwjaYwX
fPaOQZiJnGqmv9Wj9aP97K3+mYO6VUVsdJlfGEAv2G/a63YlxKWbKvhHEZKVm0sdLsUo5bj/l86E
rFV2tpRLWAqV3TPAIuYe/r6t+D8o/T8Kvd3fxScG9hALMdAY8+8Nlo44/XWJDeMaoQAHbjyiCBqG
lhgZbXLcsEEOti2RyH4yZRfVSCq7QAQ2yXWbCEB5R1oi9yXvWmjmn7jCDweq44D33PvayUJOhPmd
b4iBAdmlrV5WQbMk6OuKxImQTfdb2b36Dg9bZxHVGGd8GEOlBzG1BHOOFZFKlWKw8JcLTQX02fn2
DJJB1LHAQjcG44RugtopqiLJuUWFXZqNUzKCl5m9OCqYJCcczIihYW9FaFyoJJmv50HMfWKWCZ8J
YfyaZDaYI0GjO2pnFLDEB7Zf5xXxQ3kgqnpGKbsk5Ddy8mjs6mRlEiy9C8WWefMZVZOOznC8NwO1
Dyacuz4fUMuCewQOesggkB7skQvoHy+HT+6fVi9fmtJcTE1/pPWp96A7DM50APPVlCHRTg/eSyU4
qOE3JDp44qob9H/0p6ARauERbIQn3dhZ0VH8oqc/Eq4PrMzewkcEHqwMHWSNR9qdO+L+P2Q8S8vb
i88uP+IoTkMxD74OAw+a/4fCqfIEIDz/xZ+fs+LfWRhW10gk9m38eDSWbAqTfROt2OSFoCoIK5+i
qmMwdMf7zXwVZMMeGRqwa9ueVnF1Xofy1iEXBTuEq16WrjLmes6wWiO63ozMtYij4R7lQwjivP+I
AtWqWaZJaCyy1zVJm9bMBPm4dyhjoWqpRFdrY1teoY+Hduk/EemK2tpkZOmwkNsaAks/V1SO2KXU
GF1E5+IT/Y9npK5HxIPeg6e07T42ERpXlYec/EmV6EUoT0aNhKvXCvUkVTQK0REdiDj1niMlZOSa
3M/F7Rc8Y5ugDIWH3vqqKLSudGD1CnTnrPcrMNXLJ2FAGcozsD8pdaHJOuo7ePqhE+IX4e+qNnMj
lYvOzhsBwmacA7Z8cFxuuAd8l6W+fM9HbF6r4zcQiB5tp7Ungmjw9os3htG0hMkrpGUn1urArsq2
HEFQgldDFKhMnnDLwFR4tVB+3Z4TMeXRxbdgcM7Kvuagxe3GhpXmMA9T/PXBcGFz8A4VVlgUNMtX
6wf/0rijRGR+AZtFf2WYVngRGigQT04dq0Iicj0SCNqUSL4GJkFxgbaWzvtp1uOqUsDJolE+RZhY
Wf4pmkiUJRZdTelEcP8yKl6+1DdVtHMRQ9HcEpo1YlZ10FL8OoNj1oiH+dLfhq1OEPVWo20dbc4B
JpdvakJ54r5HhdVGYb5BwEcUujgYi4W5IDmi/oPzTpsdO5TDN5sTPxmROsxy5NytWfrFbltCu3Jv
ukfIlxkasnLPnJ3Vinnd06ZfnHVuf+gqtO9H2DxB4PZmV5lbPC4xB2Vs2P/bkWPvPypncGzl5D8x
D+CqK3Cw3hUV5O6nKP47lMjPlbmUpPp6QmvDEWDXW9KcLmShWHgQK78xgjFigbRCrNWt7rQz4Suh
5RDiO3Pnpr1My8V2VYQnQQqVJgE3m7EXccsCInXJAKinpcslDzuqkKXXcHr+SzGlNhCZHbIJV3i6
zjpTZWwYizaY7tMWTevNHLBbbeC/qYddQtJw2hHAOIpf08ONRvRsCh3SFxju5Zj5f+UpcvVUHaPv
oe/6jaZiieA5Qktxhehw3wiuaDzMwRHgalIA8Z8hLR9m+uCowPOQrTcXV2Mzwy1AaTnAo8V6noTv
K7L0SaTVw0whzTmt/+Oj2F4/IGLE9EYJpEBviA8euutA0jN512DlwErn6+brjeir5Nshv3Tj0wBw
uSVkZgExGbS+GJQHn+uB7Q1NChTUyWyMV1WTLLOCEUXw30SlDCfg41M10aAm71AI8pyWxIfxNref
58Qf5AU370I2i1GGVXIJI/5m1V1oTC1hplRHsFjhdHoVdWkmQHbfY35qQ62/z2DmwtvEDYiYSvDO
zBEibXQACrphNGVWDlFpkMonVXcoOQlBdZdN72wY4/1TIbGPlz59WQ/AbCE+9fY9YWVT3mv+3XHF
7owZB/fZxCzYdks4vXXwyhyEGqP4pxFwf81aPD/1uTdOWlkzeLIH9jiIO56R6dCkv+WWuJleUw/E
XXclVDYiPMzBT5u3aQbMli4tUbot1ASrN2Q6CPhOLOf9U0GslIbfolL/mvRzs74yJp4haZb7L7N6
hKi6jdBhQdPK2TfsyNY8PwrSO1ftUb0koMZy4Jnn3WOOb/p7Wh9nt5HMqlPPujUSrlXd5MWtPQm+
Qk8qBayf9eWTegLEvstClPXS55sCau3ZTf5qeAhzIW7uH9fiATJrk9kMUPDpsQtrDlrGlpmF3F5B
Yf19Z4FKi45qD2ePmi4VJ2eg3sDp7TAYAi3t6NQdR2w5/3FIlgiSeX2Ek+x3Bgwqrpl8soZovm4O
7KZeYZn8CehxpdYizq+lEgkWHYuYkTXyN5olGTmhMloJu+3q/gfikeiSc45axU3qU4WjGza81mdN
tp8zPBmFGVjgM9SNdfawv+ubMerxogh7ySNUJ4AzpbwjQJLit5HhMrJ/YAOnc1MfrSnpbwsrVmM3
cKXuXvNfwqNUW/YCx4zrfs+fHRUgO7DlzKj0ibB1YNaWpt+monwsxIqLXihVWtbZ8lnu7yQE89gD
Ch+tm5QZVM5mGeSHXLW1fS4BqbMh99Y1KZaAzp7YN3PkMDPwalJuLFdqZYiuATIobcJ+Wm8pCSzD
QuMNsOGLnS/lpadsTUMAicXQgh2GMh2NF5scMonHoGYS2nS2TsQa1GLqHxkrTKpHy/2RxAjMzLJ6
X2tcT9Bmdni5Mx+MLxqTGCHIdA0lVrF1MQV7WpI501ny1LmhHDU6gSPu/aZ8BYZoj4t4gGpKjNRE
lvxgRZqPwp4nILg50r1FfBhY4LvHoSrPxZalUwpsc6hFu7W6XPBxnHNLiQz1OWZVSCNEaCyb8dJ3
TFyG4t4zbjuzzinsn/EDufkGE2XQuDtszhV4S+7Zjd8ef0iLz/G29zhT0k61ZfFfACZMA8mZ1b6h
QSTA2/R6JT9KI0lY+RFjT6iqGU+k/bckz96K137clVJhT9v+ChJRHQM2PEwAgOBhVplpxKnRdNmu
cEnL3gBpTsCSkd2RdvAWPx1x4w+sheAnJytKFy2e3EqARplD0/M/Td3I+uepJ6WqnXlLgp6lauo4
RYTtor9Cs9kvGU2IQ+ANrI1xP1MDvXzWRySrg7ynhaZLcoS5AfQfiKVTYaE+PDQehMnGrZPIzqKm
VPZ1tIzpwwZRl9sHQg8IImphSSWOVAb8eC5GPMR7PaEcGlvEaJbf13mWO8H/nyVcMfKI5C8yHt5i
5aT/t8lQN8QTLf+2ZjF1linTxT8FqGOBQLZrBd26OBl7TEa/ntMoCA1/ti3RK68/RlguxqJRsPx/
fNKZd03kWpN/Zll8VXh1FYml9typz7kBb1GgsuN0sHAdabFZgUePDE8NG7LeMzd4uOkdHytydTSA
r54TxbrE5HysG7WH3bHmwAeJSwzrhVQccpR+OX4AvkawcVBvDsYJ9NudaCZXoudvf5hXMLW5AXEW
xdp9fzzLE9mydkcsaJDOeCghmMH6WErZw6yqp9r1Bj+kWZf8umRRaR6WuMPUMJLebyP/hCAfQI95
+SlT2GLggRrYtQytBseo8oz2ys8eb6FOYpW4jaBJNR3ocm/uyqhxD8seQQXQf6aD94xwnQfplDZV
PPxqjvoyHCCClhOg66Zwhc99fHUtjYHK6Oo7iYszBElNwMLJE8ssoKPF+axGBpRW2yTZy0/zdF99
d34wG5olfR+FQiCek7XdfZTFs9857tcnlEqjMlIqoMzSFiYM3ZYGglvqngXRjAlp1C0Hdhx/aXDp
tYpr/2r1dZGzcq9DOyWlCsbAMYQ+iMwuJHMw65xSIRKwvmX4f8b8Vnqk2l4f3xZcxy7lEHOq53JZ
JkObQiTFBHAS9ToB/1yEuU0q3jRqr+ABiJd8rSDPLfbpPCaHfGz/LODiU+whlMKs/Kg9wwKFydMa
U+rI63a0KHsXu1VG9eX07FoqKWQd9WOH2q3mau4Wm8Z6s5FA9CEf0P9m23RoAY74YudoWKEYM+7g
yE/gmHzsmQvWEWf/vfgBXarfMtOS4KaHJxwTbTlUZ6+QndTfkbNlJgxd5YWRa8G2ZlvH83XX2fTD
oe8Qto94ukEe0OsxqIO2YPUOH90uGaY0zWg9KsVwprO7ooEbfUPK+/7aUQ1z++oN/n0d/Kb+cC2v
1fxlRV0cXNkaYb5Lucbd6UTO1QsEsq2V/p5b099dJBcLMst6TC2WJoek2ViKAGhSLKK8MWhgHIZ1
YJ6X4awyu3gWSCesLyti7R9kBo8BYNX78HRTPKA984wBgqlgB93QMq0EGoEiPGdR/9zG+fYRspKk
hHRlGK0VTU7y7JNIFiCTh3BkHks3TDzYIXGK4YO0loW9NwWxKfNhyneEO4bwXLl/NbcTuER3Q61h
kYo68SiX27Q1G3ts95PttpC2ycz0hwn6OnoKryNWKzmqyE5nM8qkxPqzDrXgJeXAgd98Z9cxvXhR
QM0Jak5OoZPvTshdYvMfbAAH75o0/EsXjLsuegIK4hwtU/nKvUN3lZP3IJiQtuMFuCoeudg1pGl6
HN3ONEsj+v86P7aWIZXZMpymHV8xx6fIS1QqgOir5MPyMB3X/FiHDLjw79TcP4PcSuslHfUTf/Pp
D7iqZPAoBo4kamzMKLv+F2K9xum9cWWmVdeq42EmVwzrZls9M5bzJ9DUiedfKOUiAwZRnF4mBHbY
lf47Kbaz+LzIFnwsk9lHFMuh8WkdPhFjdfntbWoDIACxVBY1t0XEC+p65KJYg6RIz52ivUwkPo9p
eiD+JG6tVpdErwQbo3geHNK/L49UmBqMupUmoHFRbhe2yYZEdz2oYSCXKgQa+g//W91KXmM9IXM1
qv+J/v9XsxzUdGqLN0fD+3wOncAcGQJneCi6+C/e0xeNujMrMP1t1zK68V2EG8Ykr+NdYU8Ih9yb
Djq47D5dWU+kapiTCoi4ELeIRKbQX3xgSG9v8wlyPZJUGbb83EcSlXeDFbfUPS89+IBYboZeRMb+
XObvv40lYil1cHPOpVqPb7P1dCgexkPy43SxNcLUKLv9VJHLMtLwf9x7uxwbuTOP6N852d4ktsvb
lq+4GkNXksjtig1clHYOjseGOpWFo6KUImCWJSeLCN+zzhZRAqaVnap4/yiNx89GkSW1sLhCHmIc
F5K2GHBT5IAzly4DQbnqsVfe2qRvqe1PiGs5lbTlX7lwUQpb/ZDrqDcsQipCr1K4kiOsRPI8DJYo
sQ7ql6DvmL4kq7FHUthhLhglsZOQEs1LZqWFy35Kv6wZJVWgVkEyFb/Ia1ZnRSLRhuyWu+5YymIo
XgDHvNdV05k8HUdeM0foM077lHz345v/n5cJXReyrmDI3aYbkFQB9ySpIgoLRrsSo47H7jCjTOND
d2HnAs4qOrDleEgXo6OUcZiPds2gek1Seo8dSdgKLOGu4lqFnQ7TUfHI67/Glszezgc9BdzlUjxz
azdaM7jCA2BKrK13g4Rg3CkpLrXIcidSpnSG5YIAAdtA7pmadnkm5VXDHDCgTsW378iNCiYebq1V
RBFSrpIUU1TtuyQVeBoKDLy97CZ5rkIqBvW0EmCvxNyidvhwwH2jPZvdxSWK0wXvbGo3kDnPn65Y
tbXJY18hNo406U48gNx9LZZ8W+nnrql3UZpn9kCv+C2hja6GUvcl1w96j6baARE1tQ0q5kHtK+hb
/JDEGRmcW4tpcvuWnrRqCsmML+xfDLN5ocCCuYgUTJbbqZwmrchp6iF3NiYwf0MzqjUrtHppad+D
s5ZW0lY+BvtujO/0niziNkhlb4IW9NVip4uMR8dinjD/eUNi1Hn5iQgn41BQlcBOIpN0PUwhnmXP
BV9xX0XWMeFG4dbaH57wbmfO/KuAOTO/Q0K64dOlKy87Kcv5xF31TZdBZ2SQqo/WeymFpJfdxxNB
ENcVQw90a226XYnWR/AFYS14SLIqu99QC9px+U/kJlt6SSCWZ4jWzaX5wpjRupci+zrryCgPieKd
rJQRRt3i9K+SJ1YyblCL/TNRWIRJfIkVLZLt5tweYmdxUh8fvKz1VGALc7deSV3NOwNIi78nbyLr
kl8gUayo3ec2dfy4RqRyF5+9bNjAHIJaYFJ0O+jtCJMe6j7VR+VQLTjQmSQ71j1k6qN3KFUkxLCV
d4cgxS7DlLgmJs9ydilvSEFKAYkkXL+azaCGoecsrs/G9cdHh9tgIAceIx5NvNeAY5J5cIcXkA0/
DWOIbzseKQIZWuaT0iaQpt9AHSqJ2XucQ2Y5TA3fnABa5/Pq7fhF+CSp8hFu74LirWv7D3x38xbY
zLnwzVhZiOSghvriKdLYCB+6dD28IZw3iFtq7wtcQKo/r+OeQML7X/ELuGw031PLjcUx3XovJ90T
hlH9Eo2Z+pxy/OoICE7svkLmaRtVRw8qAUfdZazmNXlf6vvUFdyl91o+9Z4QtVcei4RwZsDyVq73
pCO4RVEuGSwK4IlGQv082fVK9DJo8BrXI2K8o0kqv2MvVMQOCDuc4GgDayM/Ehr0+86qeuc0ONb1
rxYsvcxmlIRoDUJXQbthAI2vA52lsbx/fxbKlMTWYVCpqD+eA94cWaPMoFRhe/K330RSJ5KZJGo8
o1B4lMVVkwH952jhc+1yV3wqz23d31mVelepOZRiDUZJOnmz0zcBZfWyGWhCZWUqx2ETe4lb+w4K
Xrjpo3sqWv91NyyeNnnPGel7FSzfVKDfBy8fFG1sonoL5R94cxM6rrCgRBDctCkUqjBatnH4dMMN
HIBvu3DfdM/k0nmpm7gKOKLVDN6xtGDO8UK+31aqCHxUWgfpwtHzKwYEnTmxnYYEaj+ZvGazI2D8
ifJyO7cqKVmnItEgiLtKxJ3IC8QDlmcNN2OucGBppR8Sd+zy46hjnQJ8mKz/RXmFGuFwlLbT84xd
GwPU4jl+v2w1YjUEnuVIx9Hyjk7gbp7NhWx4M1vKJ+8yL73021/DSUCddfvy+QIx4ZedE8f4br4m
7RvLc8K7w77vh7LPsWr1ik6VAL6kkA4M2pBP+f0CKHThfcym9uE4SFl2DmUIPoaeSJ5hJUusbLMk
Lo6BzT4hKOAgrEYR8RCqkKC25ULSa+o2rlp6qmyXhyzgB+g6k6wcV7+5L+iQq7Bw/io4RHVRX3Em
2YW7QNjtYsaHnWOAC2ZBVsRUgZ1qHoZLJtSemwmu8u8TKqUhFOfWhSdhwOO1KcuemhMRtqmWUApY
8qdBkMujS5giXTscXDC0lWIfDGP02IIks1n+xyX49Bz9kotWbyJNmrUOwu6ak9RCTO4j7sVzjf5L
CMyat9Kro5v/v+YvR9qigoHZBHywgiJYHplvesuB3GS7GuITGAwnx46fO4vgpDP4jvWt2WuhpK/g
SSx1/DBUnshFZGU36ABo7JqAx592CcIgc+NnKNllW9WfZ4UeNQsjynKFvp5PrRYNbwHHeWZNhN87
YHjxIOF12IlQ2CBgQSKIR30qjb8q+IOkWragu/hzNyt6ZMOTm42UzvvRmITqYPTfllp7/p3wDYPJ
ZpIIi+2zwbvPd6jWGX/pXzPiE7WRvX7wPRhLg7gkFVDXgUvGgQKKlAPhs4763f8RIplvx3QOGFVn
yM4znkQEU7LYaJSa/CJ53LkRIvA7JE03LiBSLcw8pFEcwL2UFc3lQeA9WibHyDL0lQ6WfQASRZpH
XgoBF90e6bLuwUxxBKrYqNadjHHnZjr+2MRtR68h1Gf6sUJGQOrY8UqukwG76YDfWq4NPKQbAXXN
C+HCMWAi94XoMsLTmqoggpnc/2M+Q0cUaUC46p7XEKeNIbHD7u6OnxUYjFEkH3Rrb638rpaXSlTZ
EDYkAqiQ7GO8HcqJlkISnVMpY7o6+vThQ5HrGsce8QCiJCOjnypmHHmgkgByvhuwABuly7sxN8We
Dvoe7r8a0mTO2Lwqdyie6o0rTNKTGh9+RKa2Vs2YSsopx1QiimNin2WlGYNW4Ie7sB7SR3HQvKml
aUw38QlbCJUk8C9YMyNNSno+YpW9AtK48NjrLCx49Vld0Pmjm3IJxl8K+oW98apxZ7XnIshEf3IV
AVLPbzLLSJs7BK02oSkTeHysQZM0xj+T9Q7AEh9QTX0cVHnazBEP1bdREbFN6l6RlA9xTxTj6Sg6
GkmbJhRSRV0tdYzys1ig5LoURmrsppIHxVZe8D4+h0A+cYFL8gCLFwwIre/JlMZ/NqlFe8ovRyQQ
Lj49L5BuHOL82AOa4pOtrkLhYkurFc0NbJ+MlcssZ+vNHPF8sgJLhV/ecahM7ixD2vQMDMf1LaNK
b/+LuyX8k6mh0PQm24A69kdbrM7LbyDPrHCrvzYvC8sKu4CZc/b+L2Uz0GzZQn4piTstim1npndC
12q0X3zBAKFL1eg9pmwjRf+h0Fno27njaZwhYlDyqFW7DxbyNC0hcqI2gznT7iiOSr5UKypufXJM
qL0E7njVfbXDOWH/Sjb32IAKSybYRkNlQHrvUxA8UOiQb1S6SlDlx3Ij3dLPQrs+giSSoyCm2gM7
ED4OZBDKOpUSwBjwlO2CZJvCzjD7KRlHkW82yiC+BchIhsqTvWlh40Th8hcu72DFDvuyDz6BHZxm
XOzm4FyXK1x3zq6d6Dyb0LAK7+PKt3as/GE6jYLtkL3hniWAUQgIeV8gAP+tMI4n+ZCp2CfD4QqN
QlAae1XcRWJdg1+idmmUIeIxs7IfvoNVzGN2X/v9JTwnsicCgYwbKCffrzUujgy+oX/m7cMfUlFJ
HhFKYs4e/RvqOBU3t37lUwiQbRHNOsFwN16lJb66zxZp4CM8KKLmAhvsL3GA0zx0SIzwV59SUsxf
x2EJ52CC7xzyI1Wx+kNRlUp4rPgf233ZSiGL71zLS8PSueJUryIB07y6+6Ric0B0PdjklaX/Kjmp
x/lqs9hgUGk/Y1VHnUNShwmkvVuNzWk1QMDQR804xhZWGA+wybEDrvf7BREztjJbg7vmbpIP/OwO
39tNx6nlNDfJbf/NxslWHiSPf1+sPLIzWRlmeZecKP1w2j+impQd60fMzG038HZZI1PvVTIOSYIQ
MHwWdlYZ5bfnD0EwDbYKE6eD4Y4xfHwStOQtmz2/pMuBwNf94PmcW07EMMVRjLwBTkU26SMZ1JSG
8+0FrZrRmV4Hi1gxAdkJivyOGaOZoWLnhbhVYTBoWkS3Z1MksJUBvnsrembvbMNu1E/DzsPhJNtb
+ubr/FD9GTQtZrjAoC/MrcXjc7w5/NxLGJcueyw6JVIn9m8j7m3I6xrk/eIGq6QwEUcEnEeYhgjr
vEk6hQzUX/HV4ob1HK0ziRAzu9z0TqYUVJDTDJScnMcogcuD5tpPT5Q33N66qcwffQjjJ80FZkel
9/DexdcUMR4rYhY2VYhg52vA0bHcV0tmi8+0pViRuuptH0tQr+RciS5kLDglIi9vwe16VK7AOBIF
Uf+6uRwJV/PYkVNFSEBX9LGQ6yNjQZUwdZhEr9AEZoqnt6Xb66eNvhlrPm+aOWM9Fu2aUhgCLDvV
dyVHjQX0eb4g6kU120RzI7wJtkOZxfOnjQnsCdUMR6CtarjvaJofIFwI6WjVLndcIaPF8mnRmzOA
L8+0kBexBKHM7q172+GS6pR/V7LtR310cOM8t/wTHtgZqjwUU4bvyaVDRxpazy581pKhMVFIMBor
BunFzr1P0LBtOdtQvVmIOcg2ktLNP8r5By7OhwUsjjGPzwZsjn6PWwfBup1NpcDMYinxRz/B3M4K
RudF0mkd1Yvb6W0yntFujM7MaSX9fBNItbl3AacqnqPiIFTVl43Z+qwJkxyyz4hh2d1aUgKTldi9
CABCFHPqCOTA4VfXkz/tl0GPCjJG7ptp8wb+l8VGrdlxF/ukXqwdOIvnqRdr9IXKeNaZgxqSSqd7
f9ZXQYjyf2uRU1HTwJhkmgbN+6iLPam1oeY9ExgRyRgZJOma9s6Bl0wFXcp2PRybRRM8TL/UkT44
TnuOqpzmXCqyGKWynV7ySJ4hGwbGmbSkWj4dX0HiHa3bagveJlwCpHLEFdEuKXv4l/Ht/wAiqvHe
O0dKc8JNrPU413anQx+hIdWO9FYMwpN6Wx9ZZi9Jt3VaK22rbVjob179lEw3Pl3EDksWeyencHyH
jvkdmOtoTemhDKr0Hbd4eqJKcq383L0In/baqW/dp7BGxcXkYjvD20jTbwWwaGe3CAFeiIObS1go
HDvrhJl57lEAuJcn6fB6hnwnIiQZnh8FJLUm8d+8r6AGwvM80ytZJabCLcssPQJMH0/2LQ55QuEg
sMv8io2MQcC9mq6SXM8zPnLFb//9k366jFOzZleuTkubUR0Xyxb0b65eX37VPO/QMNDHH22MoZJg
shGblQWwd17+ZpTZbG8rh2v+TW9YdajgkpSuUxDdCKBkJxr2g7U2gYZqsse/jCufwcEadoaMOyNn
vKT8KXaore6kwWYomsroolvZqxTL7ICDsUClv47FWqJoawBxTu7gIDTDa5H3zkl4UdZOISsmLdNo
6hkplKsromblbAfX6cg/V9/124bnGUOLRqlIgSKYkO9QFY/NIwoRA9N2WD+szvzQ1DsPE6Zz3c5w
tYFKa2ydTLuaJWMgdS7S7FYAkYU23RQ/vN+ckh9De0oBSmR1Q5Mqib6y45bov58OeG6dCX6mcrY1
Zv6mUbUYxfzrwOwWcpsHMuD5+D0zx5n4DFjXmyLiQ6PImeOzS4BXQhL+46wZ/xuzR1TFdw1Sowz+
K2gUaXcNUAPrkPpDdFnHfkDb2va5vi3HhA+7AmOerUBf9mdD6I/i+7q+nU2cGr3p5Fl3UXpZNkrp
vPaXVcoDWkhnhnoSYQQ3qPtG6ZvFwFUaLIJ2REmGa6yEf7++++dzWa3yXByEghzkLZ/Mupy/W6ED
YvzK4+xGUtSU4mfW52Lk6tpUvfXXj2/Npc/c89QW6aPhhxLsxjoUXMrN381oGIwq0V0/+YiZv/zp
eNR35+hKDLVkdUlYYnklgayc5L++X+Y9TqfP8PNOlScKx+qyYNM+lNDb8v6zLYIP91FOMzLo07VR
8hPqiyNwGN+nC0jEQ1KieEhBoGZyR1Z5JAeRzs2rkmZqpyxKGPSkii/08uUTG9yjm7P8tehgQvI8
4XJrQYjVS2q985jYZZPwhiJgea2EtnRjyMAItGhebpVFXGEn9RHCVhF30ajCFET8Ncd8n5LTcZ6O
XfjJd7bEMKkr9gdKy7mtqhIVF9vvAVyZFFE9aEaJgoHReKdM4JJysionMwKVnLawTm2ePev5FivQ
AvK3w15rQ50jSLL18mBZoIw5Ib5Hycg1NElM/P6C8e7lSYWYO8aorsOFZk3DpEdW7YzZXGiD4dwq
lOo3ny/ZwrEwNHv5RVx+8h7jH7R3Gr1tNCyyWTUnJJZwc93yxfWI7qpqNHzPdUL7ZBQHCc6cCa0C
ZMnpLerpshoxLsZELyzgRP0XCaVygybUyfw+0VCzVDhINIAhf5lFQTNtTFeHsLJmWX00QywAYZKc
jENByeHyWBoAcxRdDguc6TbXpjs0E0/F3t04pEViMVT31Ltw5Apk1Oz4cwqwphewfN6XvwYdA+Ya
L3eGvmAPuy2qnEUXJqbDZGzsYflyi6p+Tdq9iFsQ30cCjgdqYy1mBiJaqbmyWW1vNajhhvNaoQHG
y+RyKAe0UqjgPPEPhJwt+x51w62vCkulQOM2SFUAwWFaBz3mdhGYbqVfj85wzf2HlNbSr/F3Rzam
zW45IvCkvSfyh9DUvPTiyStFTqTim42lqEos0JRnZ2H+8C/aJ5AA2Z1Qi65+IbBjEfOxxcf8IZi+
0o/CIvh6YdHAP0uIDahT9V0At1iH4+jL0j2VJyDUuJ6j2xaivAb1iUuQNb2ub7ZvyuF2Hza2C6uj
+FYKsjTegB2bhp1KJbqZ1xsltW3HPHK+30Ci3QqGUcAbCyo1nwWOc6uSD/sTNQgXgBTUkgKCVCkC
uCoSAlAdOyb2vtoTW6jy8BPjva5e+TZNijN/TrRW24RqoLaFbQjLsLANv5u2J3yHjREbaMZODum0
ETCdc+//nTK67j69gt+KDC+3Kwb/4ju11a2SJ6taB5l1MB6FJXF3dvUqNcejGMOy3e+MmRuqFoYR
hmIK+rWelrDBkRuPgRwNVOis6bEAPEwVTyp8hF2Ol5B5NW5A+S5U4Vvr9SXucB7KUZJeSedbo7V2
ui5SQ1VhtIGEvqG7b9PepuboMkIhItq0be+o2KJTt0L5zKdyEiOD8mEpniFkHSlJFb1gt+WgDIv0
TCdxNf0U+ZyxgilTOrXlcOC1L9N/dCBA9brIdR5jrddbjd8SakoZy5qTz0q6BEk7ECd6ImLShtMo
dBNfb6xZjZN6FZxCPBXLwwZezvJh8Vm5tCrarKre2miVRa2vUMwxps8vuNvBpWDRdzvqgd9G+rwR
1aDWZoUD4McDWqLy507o0+xL78VpqRXEmNvqtYk9bOcrBcBJ4DSXpH78mLx5vdDf4Ukg4QP3a0GF
98nP7kRGJb5khNuB8FHa6KgnpVBzO0cVJXW5OKEQGGk1VYxiO/hF368gGHE26X88GDI96Hhz0eVa
KtZC+JHf3KYSz8ZhTEbo0KZe9zb9uCQU3xtu7sGwDlCrlZixInS+GG2DJk8+2Kh9N9m8K9XVqWeO
8rGEG7kHwRm39MeWHfbHvc6vRzOBkU1kQq3h6GXHWcoZtAVW+sEIBEOipm/tt1uBEaQ/iIHzYHkM
Htz0Twp5d7k+kE9G+JkA26SpKayoGz6ZvndlBR6Pceanp3HqP5l8y3h6M+ylq0c6prG1gOuxhc/q
/edPqAf+3ScsMYNl+R8Uc+o51mAhyixbt8L+ukhmap9bzjR07feScx13CxuhsaelTNXBmalWvBJ+
6Zqx5XJsu0MNw0v7Qbbn9pGcpLuJ2lME/Avi0jofNFq2HW36LSTZiLQxaD1TkJOEA3DX1m/isGou
NLrMjnPU8+QQKHx/3rsVfZ5Jzr6fLArKqvuvMieRXfAZ5Bfw0KMz45D0ZZXlp/K+k3+IBbspgI73
IbMF36PQWmDBL8S0KOOpfNNot1KueN2v8FXqzXfCXBUSkkQhsKSovDaDEnvrLL4t1IFPx1EZx2al
XMEv1WctnkiOyhnxUPPgjTbmYHk2qVmxDVs+14L78ywkaAAoxtV7h6YNXgLsULHaV98sSL9sENz1
thpcpobFPqv6Jg7NGXOZ5v3winRc79B43hjZHa5zl0VV5QVooPbZ14LIqnlT13iubcuNGPQRVAWy
AUCmG6e+uxLOeOcF0Us/DFt1Rkxh0x1q2GFXTjxElzUhzaDECBXGrjwPVi4bnIm4616WphYQQuKc
gU3xA2CojkMVZTDYGoTc5HyIX76dZ4w3OKOX1pc/JzlUSAsInVG2mOfM+40Js/oUDO8pEl/BVfN1
yxcd2RZpEYxzNxd5jOZ74wYkFKBpQKwgKd2vxXh/zGDjF0IDt6DlsR3nEKrNZYSBXTuaBxnw8UNa
3+vya28Hn1mDmujsGeWym0e7JRnclDEdoxqPfHkHYCseMI+936s5ccySDahyE4GnATZfALRsNCNz
lhFRJEeCC16shTFSwA/NXAvhkAXLGo1LPkzku4Ywbz0Q68JIA2+G9oPvz8zGIr8afovhOLwMQCpu
GU52a2WKG2mcuA1da3BaMXuqhqiSJqoxSqPTUbHCmivt9vPxTo6UhdP03l4G5+1qG4JHRo7oq+9u
VwBUKcDOusXVJh3C6Uic/Ip17uzI/wLMX9SnDd7jqdnlvZA3xiiZ+w8/l55ajSpYsjD/R9R5kec4
bp7lE1yWFzgoSYB1qZ3kxw6nZ63RCDvdXOM3DEcZ6lhPSc/0IQYvcqkIaGgTC0kjQhXX1m4pfs/x
we+dhNjMMD+V7+n7kunrKQCX1XL4MpVx+V4uPuiD2fuyfs8GwhcUpVt5cIfl4TcyyUa2eD59t0bC
TRIXfEXqL0kulWCYVfI/dvKreVi0n7esC2PZ8jQ418/q0YyfSqY5NqExwpw6ndbAhidsD58QN164
hwNzflkOMGkrE/25rjDE6MgbikeywJIgtdfZYx0rOBNTWb86ewRv1JPVq2RI5lx1ajSv0R4o0J13
CwwkjcfbQAlgpNJtrBqCOpMGVIHkePO0h17rfab6yPB4DDW96OMHVqgCEveCgezKvlKuxInVav1s
rCJqyfM2X1vcdWl2a1820f7uivl/i8LGyRaTpQFW69hNGSii7LI9TinDjbEFnt96K64yRvVZTD5+
4ZKvCDeKynwogQKyGOFSu3lrlQvvbNZV1BgVn2u77qNxH0D6CMsc7JV/f7pLUjovfXWrI5x54yrV
cu/eKXJ2VhYe0EQSOGRLJoVFnasP3ogosqqh9QGgnSP0nlvxEicZ/ynSxKMtR/hvtyIVvTi0NOLv
8wnxjFs8AUOS7VMT255CIA26JPkYGRkEtUDoV/zND87iaYmDfXj2muTqXJDmDtLZQl70FJE4YhIX
WtqRWv6VWLryFqe57eGD7q3S7EiHCnG0WMUvYg1OdNSMApEpJBX5rkFf0ifnjj6w4cz6QuQM38h+
o2zBqKqEByZe7RLYbSpChY37NL8FtLOxownA3TZI1Ktiplu/PTcKyrsIx9X1iEkAJRQTX16/Gvm4
AkEn7lmxwrqK7O5CLi2g/Gx5uyu1FFwgYQe4p+N2dIrHc2lh6rzVkt1Ao1uOnzNk0StUhKPnOVkO
oVbD6OaEZtAR+W2Wkyl7ynWWcfk/hhUDDqpZ9F/I2bwY8kTValhhDGiezyhqp0HCHzGl6+ZhK258
L0UBN2q/AEGTzAu7vK5rPowCRRIqCeg4m7W6PMGLY2bDfIQRUJ78NV4k5nu21QgFUP9Rh2kJs1Dp
TmJyB9GFX/lBVBY5NVu1MoYtMNZ6ycz29j9Y6XNcTtmsxGGr6rfo6Avnf7mixa8m/qiHN1BjYWAn
bTOGAcFRVL+PMEa6GoRk9XuAnhF19980/KEwRsQQeE3F69X+Js423FXQ4yC3TqXEES1qzcMLUlO1
gmEV/htDm1oeyNQOkJNBKdXluzTTMeFhRiSxuYSZ7oNbUh2ajrMV/XiT7pfrtNanSuonVdCtDQoN
QJaO0LHl7wBWtQp2OTVTUqbWm7UKpO+LjfIoa+Zgj/sWSjZYJLC26oZJCLW3UpFwWGUUjsJon4IL
/7XlFKbP98Bj39wyRsx8vc/OZtO13J19NclOomgjfBVWvTDOCNW4nVGHI4il9UA/ORE4ewNgB98r
oH1oBIFjyNN8pOl7Ej3DrGNWnkd/ct4N4tsltVI2P1CubdGlKBjAhB4Jd+bK7zUTk4l00NBpq5ux
TldLS0FHMJnA1/z+46NM8YdBlUPe+OH9fGHiiuUQvHFYDvzu4twNqaV3cy67eUXn4KUQEuyoz39j
DF80wUh9VAYEY3+dV36gLhOyiJnTxEH+JWN+ht6ZKtJALtHSE4AaU6ZkuuYCuGfBUnru+DI4aEBi
gxGbfcyqDbCBH7LiwAK/R4R85g6opXdLTHabhtUaOuKwurDwuU/EpC3P/J2406HZQnbnZkShpzWd
+dBJCP+pKXt/Bi26yF2JxWkinETGJCUYnEKtUb6NLIk9wdnHeFO4XRYtuox8GEC+MLoAy7Z3dNbZ
6aXaL410kYxCigfcQ2wEnELDJemaNHGojbdW+Fids5zsy7ZVUlDqYQLDyldgqh/AsssIoNClLtEF
w7GC9Mw59U7mgCiu1A26x8hTyuIBUSnnE/sIcKnLaxtW8pOiL/W+D3n2UyTZrg3Ufp41iatBv4VG
b9PsfXLItCT3iu8kSjpyIj0+7H9rIsAtpGJOFChKfwJ6NkyxOHYcQuxsa6Hr6J9b27qhy2ch9Q4q
s9E2pJvbijSZj/R2A80+cOn9DmKScC0z6gVbf2pFz4MFORu6CHk+6/Qf/7IljI1X9eKVQTUDSsNl
Bvug0/Hj8krXsy6YQqyLGPa9BZi1L9eWSw6flw/lekgXWdIkTheRnGK+A98XQCduY2lNy5aLaU6B
EFRvFjTs7DawqeT8wddNM8/25qQDVsOM9x2NyzHpwOFPVJXJ71ZO0pLdeYaz4+K3fTjVfb2Na2LW
KWwsv0os3kLCH7Q8x+C7uegD52RT0tbEr1jZaD2BXiCavuO9TN9XQ8mlcamhN0cIO8b0YzIyDqon
zmK/X/akttvQFZBr8aZ9pZbz+xnZr54jJSv6MPOctdSpsyKn0nhoktCp0SiYx+1Lvr6JxBePUCgw
VqUXEIJxo/VshBkTYziXFHm6Kezxt13r0Rbvi6My+WyXZwzbtxHcu8SaVvGL36v8iYeLALTya52l
5t/hhI61yiuMhZ6u2H9u4q+lkgvRtwKhri9N+p45NKZL73K0uXQwwKAlbZdXz58o106ife9qOkYz
/Y5uCvrTqpIOKKjg4sPsEtvOXIr884ZKeDjPJ4ojcIE/LbfuQ6rQ3HJD0O9MEFkarUVTGGcvZ/d8
zYdSvObZLSBhcn/6o7Bk5KSsoM2c6D5simZ7E9HNuqktwRAc/FmnImJFy6F3u9PCDsryY/689RsB
2BCChQCv7O+bIPRUhWQ/gdDN64I+LcOWwgH2D0eNVyuqZghCKoV0AqKTr9e+P7q8YIWT5HRc2K12
jt9bdGENVIHkOWAlsxFioikRsDF7kVpQc7v6+ihhIb4+EvWH4Xr0f2jAJrQDPL5AovaqQCiZWSLp
ji+gfZxycatpddl5qSZRILPyFCCd1jIX8EfFUSY+Jlzrn7acix4RISc4tg/UsH8DT0roW349DdbJ
oJujiRDY/hlSQ+Gy//OY/CcWTkjC6U2173Jts8XXq9Ia7kzuINxr64biCGRUzb55WeGFK+TIehNV
2CevL3MdT0Lcp4LM/GgCgaoUVwXbUI2NcrZo54QGf4efABOC1xWbAPsw80E5s8SVnvhUJkRUqumk
006Gi8dtraUyp6heKjlIidtvsDoF4csAdJ9Yii/grzjcGVrasS9T0p6I3eYyxFxhiss14APbIjpc
Vk2zTTqntOv5CbzT3hsQop5fGP8oVp1/wNyBf2ZIvMP+ranHKXFdUgm9Xz5/XxTwoMxKqYSELTRL
Md0GRPV+2fwxxm5fnoKOukY4eCjV6r3QnZFPoFNJ2wDaoV85cDFKTvRoIJwTDKb5hHqwUZ+4XfBc
5zbeVt8rclJfnTqXcWlZFHgBfu9lD8hngel+YYYH34WfCiwJabNYGoFgF0Z57pK111r7wGkMgr5M
nJEPb/mTtTggmuO65vojCL1aGNwbZv0VyQnMNnGU74jplj/4m0jAF37RGFjXrvDawsGjFgCd6aQZ
rksQVUoYLWOTo8Xzhjsvj9gd+sYGHOk8fa5DWx+wk0dANa6TiWDYgYnSiLN+DKRJ2AvmNPryHC+Q
JHW/FfF1xiEbIpoVy81gM2Vfb8VyAQS6vIKgnteYe2FVu1qL0oPP4c8aCcpbpT/wo0wE+qMemWbn
nSKdWxDLNtIa+8BBwlvNLr/CfLazuyizqbXhDb3iSsMrsES+MEKhWY6jNAQvCB/KHAwLDwmbOdXp
wqOgxBVaJGzgnGKt6tT4TxtC4bsJP1MXE1/CHQKo74GDzyE4YfVvaGG+Ex8nj8/R2bY9+u0peEWM
qh9ka1lKi3ySSWrIl6kxYQcxCBm1iWz9yEAQY5V22Yyu8XuuJE0or7RzSGRitVzTsPfmMSCn9Gb6
sCjGmEV82jcXpHQqgq7OXDefUDqJaa68pTSJiZtRMXDYumm/EjOKTODCtfG+KrqQAolhOtb8YMZa
C90yoXY/8debPlKMopk/tO9HSW0P3oLoUyICimcmsR6VT1NDoX7BklYbGWbq8P6zu23JkZYmCg6J
saFrv0rq+3SeLaG8rVFfhPkRHsOsJ/c5AH3NhpiidnnxB7HHu2W9/TpVElKH6+fGaWad6D7Loknb
cFcEb+R3kz9885nl3J21dvde2r9Z2S23RzfgswRTnZcbrcFuH4OlsM4JH7JAFSBTzi47pgYkKcae
awckMq2M0oy0v32jjEeA6vbxSnfEy7P/5pZp/jGtipc4zkXxUse51rEr2JuXuRPTNw9gWFMirq2p
G1dq+WrT+JjiJRRBujujjKOxD3D3Ups4nDT/9N5TS5yFoyfqOgGCMhg6aYVpafuNaSHtsKZVvXqf
RLYO2sW53qzIKYGwGcHrm9iR4QZN5u6FNFqqnzfZqxLzL5AhPs3OxV8JWrlcrvbPvlQTamE4Ct2a
FArJteovSFONpwGzxYIJxvCX3rF0m/5tEe6Es580wr4FDyPa/bZP+vR4W08u7H0QN1OJVO0sIYOZ
oRjpB8qrAenejUstxyOHz06vBZSj/vPmQ6TAMaL/Q5N03btyL96GV/JVMS22n6/R9vPxinCbYFWm
hMuAfqMlLB2qUsKMpy5vPO6MHywzn0f8W7nLvze1lSRn8iHmfW4TP4psoCQ8IQ7mSgsIJQz/PfLk
jgnQWTYSAj2pysSQMSmxWJvR7U31c4NYTPqQLSK8EFXJPEZbegzoLfW0ZZQiR19wkj/UWpiycfGo
KNCGL0uitmajtH/3mvy/pOXMAa1No6IMrqEBzg5f7k6lVrrqmD+MPwbgh/w1ghsPgZXbrUblIkMi
/yWHOhVics3UDdTkzhkQfpmFuV8jBYdj3lR5zdUs5ZqLYylX8JnQE7zHC7G+VzCHTY4ucZCWydZq
7zxfFapXZb8xsw9hMgoeyTURO6WLcd43Obr3kJFpcP0eqIdqWXwlhaKWpQl5RijcTEFDuYH8mrpE
uHwknkDPTFkA6acimcZ6RT13m0xHSJeEU6OK2Mhdu/nb9a1m46E1N2o01v3pSh7GzDSo1JjCZbyF
0epuRRQX1uV4IJWeYzxka1DEivp2yJmIaa+11etQ3B2VcJGj32epfJogdEWAYKumgfFZdb8F/oob
i/E1Rj1EcjRCM+gadjoXFVVpnEFtXWXuENXvPVF8O5nVHUDr8mUxsE8oDGb7FeuiABQRI4z0DcPe
ZK2+EAEnvsjACqgqgZungPMZgmYeHoluAaZpTq3T9NYrMj+goNhoBSRu6soxdo+rt2zBpJyS2jSF
9wWO2znMQWY7IL6YW2/gqUwLxctGdkPN+BzDJxwRfrGE1vGRU9aP8M8Bj0fyvej2QTS7QIP5Qv6y
XFm9i5lNp+qKXyGOEcAPZM4uiRlwBXu2wazn0ZijVJ7ZKB4mSZMVtmr2NVUU8EOBui4UwQyafKzh
YewW99bShmZxW4BgouXqqk82UpgE1AFnIyJOX9W6+5auLBo3xAbOtu3IfsCcI/sf8+QMAKCuCFCk
QQBaVZHerRUELRFunqopTe8eDaKQpWLOqcAURHlHGY8kdkZvTfkVWYE1ExShfQfPW4PPGxHa1fwI
0f7HJZ9DuCe3umtLNkW4pcyXGMwyWfKGHoMX/p1NT2oxKESyiYYhArwWHJmCau0D4TPIBYwGp5H9
f2HxDKHunz1u3Mv6xqzXT77xAempyeEHZJgb5rb0vPaJHS0DM31lg+EvN1/5cfTph0y6n4h3lxs/
wEjbiTIPIqR4clTeizRI2jmt5np2kJTJH7379obqg204JKAj9igG1vaKCz3FmkIi6Cfl7/GhA9iM
LLcdQ9deSgr4nKPvgiNEGrXVI0QUReNGaXmIHQresTkYBWqIvXytRkzk0l3S2nnJteR49yU3t9fu
n5BYZV6qW5al4U/ToUcB30lolHbb2FTUVq45dxOumzxpcp6rOmT7yGdQ3lnquA6zXo+/i1oeLcbe
xGGDaHBDZwl952NAtUH9GBOIOuC67d/6NVj/RZPUmuWpgag1tBFHlgQgdvlJQ5PNfwdvWj9xzuq9
aQCm5VazRJgpl6Ny5LS5gDQEC333ZAGEHWLMQtGtq32ZckxBBBNM1V95ozGCnp5Ri7F86AUJupoK
SqBt+XABrUuVdv93+URQqpbmGqJlkVYgoo1fFi+6nhfRkqvHsNMSKIuo7CBGQ332kx8PTMJ86Mzh
v0BGNB4XKAsDChZUvG+BWOM0iE+z4EYqhrU6hx3zL9pBw58nCNiFLsjmp/JwHDL+0C5/fMKUPgAY
BPe3pWD5RzVDf2NKRi+cLZamgFt2LCQvXJOjoz4qxHeS8L9g/uDPpMPPZ79ceeHZhsbKnFz6Wynl
y6FyTxHLpi6BiqwvxGWNrP5EwnlUoI6NpE4OGOhmWBhfnvqi7wE6FzC7z4nTnnOh5sbfLWWze2k0
6NEuaSwUP9fT07pbJ8oRK3bspEUQ1FLxQV8aiM4niwDidfncFutEQ4cS0BzBnFhfbNHGu04mpQSW
ISKKDvR5eBYfa9PyHYiNrwdUaC+Q3o02I+aMuBfewo3n763YSM56zIWjGzXswJ3/UzEC9GfpdTeN
fh6JPclO/cf+73pqY5YRSpJSR0GKwSKmsTPsOoFPrYNz5v8YdR1Y4o67YbrlVZlMIT7JrkORT3bc
7c+Max1CenEsbU+8JkrZIe78bHorv1RL+7j8ZR6cQ8OkiCk6GSNVuFOlTCw2EgDBpjn8u0T8cMfM
FcYvChyM5boFbQt0/Pd6z/H+ZixpZSSOAK8VxlrsTTB9uS9zqA7Rk6DqX3XABn8nNeltQ3v+ridb
7BOKxdVtUVkaxsVPQMCVYVVBiO0pJ2dlPBToFL+7udwbNm0fknWD2uH8I7XidoIcV/rI5mcltFMV
kaa+Bp8WfnT95zR/thPdMGvysODDXPf0n/gnfQY1f0giT+HMzg2qoWZl2ZLlcyg8NduswSpiYpWt
xPNpszCPvCXP1TkL6ZRb7YnPxaYseK2AVcSQ702lSMAzyelvxbFf/I6wPhjpfmSKRRT0MJhmPSxw
FCvONkpdWV+ndPcEWp1885vYiIzMxjTVmsssUyNQnXNEDuWVcfP6Q/dd7fIq6hICJVAcvXhaAv1o
dUBZg/0UdiMOFquDyZE7o23ICetmbb5whPpeQ9LG+eAfl/VgsfM6OQ/8K57TFqcgC/bmwhJAieC3
ggfPWGGBBLzeu2OI96BH3tiNa3iOLwmPtMxKzmrFWKnLWfjS6Wl6hOr2z8c0eaQsl8gdrm7fDWjE
Wevcc0qhLIP9gqkE99kysCl6II5rulGlLrbzJdHjbnDwlMEaxK8qGx7RsAp+PDMcTUShefjR2KR4
LqnCCr39tneyogOt8cX6TdTa9JeRA93LXvTEuEGLUScrFDjCUiumEdfoVHQJNPraiMZow/gZ3ilz
r9H70oeoMmGWnXchISsoTKYt83Ziz6ouOs1IOynSCJixXpKxQW7vwGbEB5zkw/b0+gOlxHe5UIOy
uTmUrarxlTHFAwf5ubsuKNJl7UItRr/IF3nsL1OefX8nngU5nr4GngBithMP+oFnYSWQBkXefnzW
wcmIgDyEFhBrqLqoHIXTI/nRbGM7Ni+lwegYVG9x9SatHViQWjLeAmvTAPSay6Z2vTAW+Y0pcsuq
zGYQQzJ9Bdp+nh938b+Ce8Y3BdmTha1LWz/h5g4+Glry/TQwQBw2V/88Hvb15fnTLuS6zCgonFCS
c/Z7//YjTgDTRUAnlIbJsm93kIEpzAE9U3IancxLdBmPA5T9eMhZia1FsjFwxFkwMJYepivZIWec
ArTRBmAUC8VwdiBPVrgK8q42s+iR8u67O4XD4lDwXsjKWTcVA0Fxd8fDdb12mBS0Mq4YdhEz3ezw
DVl23MLPlsC2nZ91Ys5YfQdwv0w2UIVYB0kVEWiIMVc4+GKMkJwLjxFH3XF5UQhDh2+LrnH4+dvV
EQBD15/fxaoO1sPTd4cdGCsVbiTwwUlpkPFU9Oe7Uq80CUfJ1Di4Ql+EdAUU9/QJFcRtPDVecuQz
CSIWdl7vX4FO6Pyn/WDuYInxg1aitviRT3z1OV9PdmeE6dywEZo26HiraRux2pBfUp9JNHN4GzdE
JJotfC8t1KEdsFEO2RmPAaKrBASZxyBdo43/eoTzlgOuHEg6RxJLaoSBgT0Yy0CTywNKhiNMst0y
BGGCOn/3XpdVESyyDvAzXCQPVOnRpJ4JUAN7X8dNtlJrMPq/hH1eYYRRBh/Lx/1djJ9aTEjcvhwE
YzbreRXd9IBtiCR+cWoUbyQcm+T1QkEZL8/Re8HN/vIuquYutVfl6u7dH8M35BmU0C43I/0Tgesl
DANLY04Iz+iCd9nVACuradhUnE4BWfQStBur7lwYek5G5XL2yoP/jnSUiZjICXZ3aThewdICgqDG
a3wkuexhbblLG85iAEUIEEtBf3qdb7F/0NSbckV1/amMJnoUybBYgMUq9cP+XNgoGH7aEoRYfGx5
d0JUPI2WWQocQ+x4p8MlHvEcJBQ/VkDnbuYjI5sB5PD6y1o7rA55/oAIUyQwqkotqGAwFFJ/eMcT
3jxtgDkxyjkungLm5NUMQ/qmO34stTijUv/uM2OdGqbqchfPXX7xTD/CnH09heNk94YB1YvZJn+S
Mtby/IadqDbVbjLkkassiOWDIHYdYKB+HEkL5VadAWhUqN8qB3jkWLAnrFLe7mqzzHlc9goKSrPo
vSt+JbTmqSSCcpzZ03cyBlJGN+xhp2RynYdbOaOZQkUXymThQjSGbXSjDz58rQ5Al6OyClxWhRSl
lfsivdkYhVRn/aDSyHov4APCI/bNM/iezWaWy4SWMpn67kk9tAeOXxIAYmvPvJecOfRbGYj4wQs/
kKqHKPG2fv3LD6/BYE20FDR9lzUim3YtStYQHZJgjlP3nGA46aLaGeTCKDlBAYjZAGLJsH/maGqC
5k/AeeuLyS1bdGMhiYBheD5AkQT2UnhVYQbxFynzeboqLiUyXMrOtDoKNlnIDD8ihLf6RQ/GCvTK
iuERUMVEkrKOsNNUD+8bJRXkX3T6wD91d/wGuLOhmjUgH/uPjLpnxFvXoO0fUx+F1vOseVupFjj6
R7py869Mx1k3z+d0+tr1lygq/tFIyMYJcW9jXm7IirIe8ahuC0AZDuh+29o/mgk0MY9ILC3zcIti
uQB8Idtd9Ou4oO2YeTab/dVz1PgvTyvCSymDGgj4dGSruzDSom6N5+BUWdiaeTonOghycFZhP9E+
jLJyupppDIzMNX4SCFVXe9eA3i2w3hfIPMNcMDBqkvr/UPJyGkz3gnIEKyXsx526IFkfkNwrRmRZ
LJLJ5zQBCXvCDT/PRUznQBnBfxT1H9z/DglkfDrZPkYrfAKBbCfEihfx/S5bSIK+SJrtNgrGuvHc
3UERkhanoNvW7i9qsAs283qwBRelntpT487rN+W5m5Q4DF02bErKU1cB4u+O9Zi0D9meqygHrxwA
bwVqLQUe1cmJB9UAr8d9aexTRoy7r1JIYe4VdAYgpBZ/FVtDXExQ4AqacyXw5ULScQnX/vmUdeUs
3pGGzST/CQhERhQv/yS8b5EcFbH3oU7f2IIozTSTY8HoCg8hRv7m2QzFmbAVitunKFazM4zjNZy5
BTXMQh2uuCyvzRN0XvSV4SezxKXhaqjlbEokslE6y1AT4ldT2VD2mVZG9wY1WR9AZvEHyb3ljdyS
vu3wXyluZwpjs3rFiKQiuWFz0O5yjs1b7nh659ghFG94lfhEUgAu8ERL94sfu+yk5V9mofbxvLBX
Cbs+stF08eQasz9M4dZ5wYcuzZxdhmLky5JaXOXKwln+gz3k/my5+heOVYOiGwUFDVUpIQebYrz/
YGZYHU76bifZ9Gnx2pNQr0AyO+pJ+0HlYtS2blOH51a7Uu3GeTrph60r6aHbGUeAgCkLQ7fdCYpG
4eJ4jdLAowDa/uCOYjrJH+//9cXPPBf7Gcb2A+YmDiVQdK81x14xbk5rkIdy/iA4iktsXNqh/iEY
zzanSgiX7vW0LmoscZTqNwNTAmYPyiZzrHqia64R8ALbGiVQl/qZBM8oJqXT94IRrnLllRVkaj6l
aJ3fJFETeO1vyYfzrnQveLeApZ1ssVb6+HNXE09lE77LopfWm4wm55Jnb12RJTD/Dc+BbQhjPYFX
GPYIbaqpyREnH9lQfMVQ8I2DmUDlJKgyEiglLkJfzKqm4WXWGZzBdqk05aAv2YXKlbuk5s/cKLA8
k6oVd9axU7/+Vxf/BNuVeK6P/Dyayejx/luyig0Uc1pb0qzWS+o6QUIUmw1Ese1DwOWNZgucII+X
fNOr3WKqOCz2gg58VGuDUNrV2MziScdtKfUwWqWQLO9cRbalInUNRoVXEzNfsA9U64h+Tz9O/1UV
urAJ9tQAJ4r/C8nafEZbZk9ObHSXAx+53QT0GHjeDuGgbrzXwQ4LLONWqMomnGggH80+h1udTaRB
8nmjGilbMRVwOPWYEUOOmEFGu90OoNQ8ZPXwPOmjk24P3B2CkaAvzNfCO2Qzp245++cLYuh+3cu/
M+zuzJfrf1zO47Nfxts81mQVcGZDYcpS9WJ6YOm5BACQwPk5w3p6jI8gGsZ9hj/CqBSEpgzbwypS
fmbG/eH6kxHR5zdzO+NeV/Kp//YUD+VNvFHGN5RZeT+JnGLoqHT/6cMGmZP5sSvjBY0Znzr88FAX
0cPlfDkdMZAIeBh0OoYSgxT0d1KbsKgBKcUNf3TY1Km3D0B88O3Q3BtfwnLNteeec7NbgNb5P6hB
CbjaBz4WrBrIlG+zWIhGPSgMMeKcWa3n5m8qxjpuex6WzjluyJkr/nmbYuicLMklQlNG4l1675nP
NN5BmDEFrGW5IlNMUi9rUSV9ltVyG4RIHCFPcg6XZll1OXzGSb9C9i6rs1xW8LdCn29fK/9rLwFS
neiqC+wFg66Ley3VzfPrL2804B7IL+rTSu8ArOfbS0lUj9boaDgCBIFIXqFj2vAXglk5w3ZLIo27
QdfXbKjXre63mcz6T3DeV33NKyAr1j4xzsisEDtPKUjDmjQ717ZnWfrlmfKbqLJ2KvZN8Mskuyig
/k+W77FeL8iff3Opw++tNBS1EsTxagAHZJtK9OVkQgBgEZQNt/7ZP4rQHjSgdcIbX0DF7gEck/ys
lZktNCjMsOwwlAULM/Q2JxcW2HzGJMdnQxplmbgXhdBdVzFUBRXG3fxSbFgZ3526URjVYXtcXW4W
ywt1pcPwHA2QbUfN/Niex212I1RueWTbEqebTzPz0cPqTjmpkTxgDbEkwQzXTANGFshY9b7ZCseK
OJdyaMN2c08TEWSFlEhkiRQPm/oSb0I1u7HfQ87AElkrQyrjY2p+jdDqqFXV1gnqaWHQqaZDL3Jn
1rSlavWpHdaPiTqLO9+ltgXsTgSwlbcj4RuLqGrLO/Na+z88hHnAWlQ36CWvGrypaA3gJO/u6EiB
JKlrxJEZIlHr7t/aA729c1WK9jbUMSM2er5sm/iMSfd3rALyVWahruIMJ7SzKlw9Y0iAJ6G9t4g1
peSmamRLBy2qZ0kH8Bxvghhd4yyFGxqLZ4ONx+b1/pXdMVksaBPOK1isBFekrWXyIOQFZjlj4HwD
3ChjFKpO7qS1CdnbTIZRtutS6jB+aENG0Zu5XSMp/SB1cYpv38w7AnEdW9/SYD/CwA7tCAAZgRga
R6hhfM20DHkLAd++GkaD7hhya/1ekyhxpSLDpbnOTNtv2dS+2kZ6YrTaq+GySzSuZYRYUgUA71jE
qHu8a/2rGVezFn0dUKYc1AVBDKkcgTbJpw5i8CVEQKl020kyt4BSoshtvKKqlH3zB7tIJxYLakkP
iNT/YsGHLdyytgogz89qXOyJgzC1BC0QSYbKZWoYwe1HftTgBhlEQ1Dqx2YO5wLByZFW/J688q3R
3gk0AsmuIFL+lZsOtpTFJyGWl3dpP43PRTRZxc2mdIgpUYItYB/Z4DprAeEWbp75bhOtr5hCvF6q
HZHxWqfyaEtVZeMJBsi3zw7JX8xy9xLxdhDixYoXB7vQMRPxAW1bkFQyysoed8ebJ83NTyjWPHFK
DGV2jhhwk1QkzcGeJSwdkJz8eXzfPHBn8LxTgfcv3T7OoDVu7YcK/ZaykMSpFYF8+bxQe+lT1wZS
aYPM5J/dCne9Qz0J5epvJ8gDeOnUWgwlnZVqvS0UFMoBxpB++t1szJ8koVl8hDT31BX9XeoveVQu
v/vYQtBsYT00W2JKTIZzRZ+tmfkOXdwwSNsjeeP9V7TD3xV2bryQOjth4KW3vXvgShqQQv6Q/rws
8dm3FXbfwSwhFrBiLQtEIg3MK8liutOB7NftjZ24MLRn8eKUWCE7DSWU552WDGqOCk9kEhnvdrUE
Hz3jSb1ZnfYvuBhV7OoIA8JS3J70F/29PzyxJuTeCIRHdL80qmpziccXDY5RrOcO24bRyQCKJ+/U
/rZPidXhWy50CPCFDBqJVP724Djl39XHjVc81vX1bwygDNDNXp7g6UVN+GFqRhpVfUhKA3IADmoi
OsoUl0P4iQOLST0pgKQe1T30bm3s7WrScOFcAurlxIrL+c3Zt9FUlxWHmSYY5nmjFwPMc+iY2+FC
HmviRqKscGb7tRlo/dltDNGu9yGerLUFu0Ik6w1YJZkvOAqdETvh6gnmJs0QZiNocFZ8fP9QyF8o
o/JZHxDOp9e70WXgomHjpbqzESQobjE+hKz7E31MDauqzGUI0o/n7hcTktFR2VQcysTy+AkShyw5
DvIfORRprE+PQ9xiAz9WR/z5oEqTAsaI2vs2Ce96naDrg2jcmeZ09Kkuzt3Z97lEkCFISfmfbOLo
+dHkLKJcNFhrSrpCSwqWQJdOhvLNjcvsfgXLgf7+0oqhFKAZCykn9KMguSJN9XzqZgnx8YjbTXbW
FHE5THlqfT8ZKExf/tAbTD3tZwuC4n0059+R/mT3omjC9+DDla0DIjf1jKV9hmtccV8FGeMfN38I
24FzXDRETzyGBNZDjnyRBjwRY7itdUPdh8wBAGhrnuIs04CAKLfW8tBwcEYBx1dO66GeddYEzbKi
/zAqxaK3imYf6oCbdW330eQF7njPelTSa6+JDMueGOiehKVukiGzgZVB4jH4ARnMw/+EzJUKzI0v
jzNttkOW4huaBwXmRlyhttQlVyW3IiJ7f76jWilhqMOhFhQlV4gcG3VFGGoePl8VJmHZIyftIP/s
WzfRZpBK9lv+aWEeJwJCZFZ8aTAEj7GHPqy2ZVYlYYdX6BWhE+j+i8piTp2xkA2P8B0LWoiKumXr
3fyhBZYemuk7p65mcKea4APwDkMXxlQYYn88I/MO1ZKLt9iaYh9Ls4xxX5jZsUQE/y8UMdWDOR/B
o2oPeZiMNmcn2pajsrn0c+1Rngn9RKxVI1w41Hild8OgaS9BlPWPM1yrEcZ/ESmsfEW1rJaQrAfd
hz7ZzanCUSt7LsgHmYnHtZ5ZsEwIVtW42LQbsFtDE09ow6IkBxyInnCjgVba4BXcfJgeVwF3IzPs
9lPxDlA2XSvuLwxu3Bk7ojdAQfk/w9Ya1VPKz9zzAOoraVHyIfXZ5wxaLtYdkxlBXTe/orDDYvzy
wyTIqwpplhz/7Zyt/AS7miy8C2RGbGjLwwyoStmFW8RqL3QyOFWcf/Nr+ysGjD3dVBzkP141iV/N
nVLdEVo1tNBAAbdM8C6U6PP6EiV8UjUUS13NAHDFZP8zTZgImEAoW5q9l9vAl3HZfWDANAGmmBsE
FtbA1xvAUkLFWkZd3RH59bzH8nRJuqatNRKiJVpb/tHrpnYYy1P6A2GYvFFrRl5TZZNqRUjZHJ7n
phi2iMsaNwVq3bxlt+Qw2KnJlU+2kME5y0kG7T554v92eQMcdFMl/upjp2WqTLOZnKo07ySdcVUL
+X9+JB23Ke8QnzDxWBKdxGMuv72xWPowXFY5ZnsNJEalFyWf0W5u/ACHZ88e+MtA4hlskeglr2US
AHn+RHsBnQHzrPTBxo3kvB2r6RtX2ZI0IYQeA10vTvSS3zsDD4UwjJjhmbDRF7zOpZZHtPLiJKtn
UaGFQqVUd9U1XGYIbb30r3yyK+RznV328dmYXuASUtpdHxvF1hsjFZY+xEo/MlkNThX0seDsrfT1
a2Op60+cvP8pLJdAv0PH81CQnjDTPhNXGNnP+MwIteOs5d+Jce8eDQMriUNppCb/GxFONOQj/2um
LhPv4aFYMLPXf5CVjRyw+qk+EOXogzm9Il/KtOt5UdX7FXwLB4As2r7n41I6rYNTqHJX4ZNepAmT
0ne4xIDK82jhYv88RdagJdQYyB7mgkch7tVovcs7fYtJr7RkAHaY+QYEPH3QnkS1PsiB321VQ9bu
2iHqlUpzNf+gGZazNJWjyQN+KnLsPIhh1xN+9di1yqxvs65j1jQwqjiIZrLwN+9RNeLpi6TVP/XZ
IkrvBaYk4GcNLcL3NPpLCiRHRlACtK1/W4Y4cssblnhr8TEL33pdH9JJKbH/+7c/vd8HN0b8Fowo
+PdBG3FoHF2GyZi9sNifmqr8qpTO23/BKtFTFIE/FY0diuOvpp327DpbEzlHq6rx7IjTbwm7g5hi
RXF3emuOHQAdA89zkD5ALCxfS3VjWSkotz5k8gRM3ZpdhiOHpWIahOL6p8g45a16HweI0MGjtoSA
0BM7FFJ+zfpsL05OeQd9+nYth5WCnjG9Gbto0lFIwPDX//sxRYHPz81s5I6K0GCpEwncb7E7zLY7
P52bXiqaNbys1sR+StTXB+yLl5lmbfT27gvG1GZM6MraRLRTLziS8vMtWrJiuRMn8IbDh2BLt4G9
Q2vGxWpe3CrvjO84sgBdhePQSswFCEhWl3WHC2HXIeA5dzrBLS+r5dIrlmP7TveVFxKha/tMA1/5
o6NCnhfMWGws7FcsEy1ZsTbcanFs7vK5LtMyZKVUp/bdz8M5hFWc+1AN8QNQNIDv+U+U8b6fEYkJ
J42HHp1FTnVIhaAdy5e31epXpiL1vtEfE2QMpRjy1yXSBGMzbzTU1gBs8SAG5VemcFb7E6S1ywPL
pTs8ctaNm5wZACf3m97VGyoR3feP7xol69pZURiaRSEfSy5gksRpJ/OXb30l4ohl7a9+MbFVMJWi
qKPw9J2Q15RBtkyheU2v9UDWxSq4g8Mc8fUjCh66oX8pMXqb5E7O3thTv6a1sNTUh+ITTwwMnSbX
Oqh1pyJWE3yOLJatiJGBT7wQhURuORI2HxSN1jxweFN+fUK6zaoR98PPLTziKZ+DRvc1Pyn1R0pI
XyYEPOYo8cBf7AFzsKHiB1Pucg9ZtCg5a4JsyTiutMkGkLWlS7jaBSoPSr7gtLIbsOPJBYp0Ksdj
9Va2Q1wP+6xsLwD9K0qjX2HJadjFwjlhW2zUNpF3K9zp6iMv4qQZ0Kh23tSyFxrAmFaVv5ba8Rg7
YcHxQcEcK4eXmJMNJgf+O3vEIT3u3VlFuvNyJhO+zGC0Q/dIPTY7titCBf/UhZHmkz/2TyQJ+fGc
HcaKxI/rlaRbQfVk9XdHpGCCMLVUCBsqV+gLisVMUxraJv3JBOZE/5CjvcUqcdyJgWdnNgjqB+67
AMvV6mv2a+HV/txJD63kRUGQsebVmCobxgoEn6ootLeEBcQAJkI0NV9R5J+RawTpm+twiIQ/kz86
4mmN9m23XwBp3K8qA6JCXDrbQgPQg2/8YVTKiztgOUdTp/mS3fY6KvrCW+D4Xqz9jMhOGjbR/heQ
C8pL+sg2SBnG4dlxTwee+ekr8K6oaRkTVcn9qP5wL4sHQQ/gt5u9yV80++0Ah576Lu8eYjv16ope
X8Loe0A2qzrI7Vbijd9M9caFhLKwWcQONK63rPUEWioJzn39aGdzXxNymVkcarKyBKzQJE4rnhSo
kVVICQ6nCF5C/h/uv8K5A5ZFr5ChMQwSyjcyL9tOREkz+DIKNInKfgvUWqffIzXwPym9HH3cHirh
xz/IXc1HPHYhryb67WDRVYprHuQCIDprkVZR0UFrZg7EryOR1OQypev+y8xbODY3pipIkIsmCZpI
wZuYT80K+UcF6iYxPVQfMUQsaXnZs6gdNhvxo0/LPysrfySgym/vovv9IYrX9Dimg1bjB03mS9Ax
SKDgOBKDfMuotubzRGpdN+4SCyvFDERFfOSXmJG1z41mVkLGlZ2IBhwbHo9RmKWm5MiGYlqwr3w4
1njuJQL+BnpylIZ947ORJq4Fr9mE6MhOdTN6RXQl8Ywri4lmoETb36miPEZ03QmNCqbQLrFB9C7L
Esgg1onn0yCJfF/+RjigrgG7i673WCq06FOI7QFZsxQaNVQKKaH3eVXyHHKm0zzy+q0qdDX6i6Zz
owRStBcLBCdNBOe/cCOj6Np/k/qVr37aDrwqgu4on8uw/1EuCYwAavBjM6fxylvHHUiLj6fvvuRR
suv/dMoXDw43XRAmOQkHe6f8QMQc7wU0WI4sr1CG6WhxxzEjpkprScvVRECWmdOaPVdCXdcQW3fB
WQpu8NoBZNcOSGOpX+Pxpa8dP1595dJBDHCDBU+GcGx9ztyuiOR2npSRY2KXRDiZQAW8m5m1FdfK
qbl+txoM152Gc841g8rIpU8bNrxynKxKY3GN3zG96LbVv1RWiBCYI6+tLNSQyVYy/T5GcwyzMyit
X9NvuWPqeGGxqdiV7S1K54aS2MoES6GouQEQHPCY5c33l8WhPMj4Cbjgwj4DLN2B/kDA7OQtJpuX
YoANsSXCpTpt03Y15BjpNDl+32F4dTYfLB9xLqjH4wGy/CE3huJjg12Ez+EFruKN+ZZ/XjzanqnY
MHRVRLUesfuFWZWzys4ivwMnoKQ5CPKqTzkfkDfTiX/p6uJefE46YtbEcjM9P8zg7+bVI1N0rM27
ZsSOjn0JBo5z0EOBBsUgrDxmLdf8CVAaN1RnnN7oh8OyZ3CuCTxbTZaDcVtSnp7A5u1JbzrbPnnw
NsqwUWSxvdL0nBqbpPViXbhTprxKQj5YiIEtOUnzEszVli+4yda+lMHZejWMjGZIEVVr24ZscJg6
50mzKlLkhYsGxXLJUpqcUIQrK39pDU2MP+/YGc3LrYPm9BM13xJ05lT60OZfozbdg8R3J+avpiBv
8Xm2LNLd6fS6b+/YI8mOsGsiD2nxxPSvEQUsz9TWdQTjlKy76lsl+ze/OMMLTLk1YZ7ENKdKEwtX
v20ZImzqavdvtNi4b0dLWLVts/3ufUr3ZptspIeGaV188AAYCrTaKiMqTJ5PVoax6Lakz6/21mwz
laiid4lycROOeeBfeizvqWlJsBq/noh7ytOSd4XURUTbjV+km+InyjRsxE/MQU5deifX6BYRWlqd
0wdoLAo5H8HDXWQnivpe3tpZkXMjfKolJsT7Le80TS7U3wCoX+13uIRchubtdSrjQ5wZ29oHk4jR
ZF0WBJDMIG8dLtJc/N+tUhYt4yE8F4jNxmfApUh0SJWxFTo8LFV8RTsFbRfqrOE8tppPZbkJxOUT
Zjd1cE+dG8WSU5/s/ghq80dHy5LhgBWcyiM79hH0wCzkEvEj9OTtkHbN7Dad+dykrZt9L+hEDkOM
VfJyLTc/FGQQTG/CoElUHjU3qBs3Wlg5YYVurmYT8U6QkTtHe/6kQ2tLEkMsVP86q76cLTn4hn7v
o30eeYVTeJobOcMqSD9o4KBAGI53aIQ3FcynHhmfba/N5M1xk/91zgIQudhFsJ2oJL1hyyYgbApX
ir5gjtJjVntvuSk/B+G9b0WOkf0XTIp9Hv98UhzGgeKLxBquU+QKFrEgP5LvpknDnDhx/eDY9IjW
zykcwZ6Oq/bxGPi8CyMGSkdADFwR2Yq9MI7Q3kOwzifrN7jfDTip3uHtdKfvD8bIKsm7Ke2xSpwE
xX8o+OYps1qkenr8NRC/WZC4TvT2bypeHdFp4rr57ljgy+IIkN6JjcH8hdmOCxBTdg/tPq/uLbV/
TdxcsYe8NXew2+9JVJvXwRCJxzSbAreILRoC5X6xg5Jx1+jeeAuLj5iNuSkISXsmft8zZJJEto54
w7VXdUj9TpWEoxfEVg/5q49RyNXr8DMEhoj+r1zyhbaG9VVvGmYH25BswxGCAhoL8IALBQHWxBAe
8N951XbEi5PxLStPG9qv4fppHbSVpGhhe/GWSub9Nz79zoU7VAod5NtddDDWbksoveh5hgOZBddr
KMhm6hD5InvBxo3zn8mk3Qx2TaWq1NYGNzOkLvfvWu5BoA0CDVK4jCREEEaDQ4Kct3u8smdhl58u
tRHFza6pU2GIG/zsuyopps3PFmFA/G5p4/QdizZ4Qy/rGs/jTE/3UNW7cK6NOzksyOlm1/VnXYPA
1FOSijbTsxxZAj9dAxtYpal1WO3E4elrA/nYZygJHFyjzPe8BbwZCXX+RbuvT1zGGquJDks823hF
nVs4PuD9HcXw0rf57yiWXUrr2q+r4vOs8avn1FC58Uhbvrv15z2D1R8yzzJMgoX7brxaylPK2fTu
/zZET3S+vgNqmUb5I1eT8Xn/7mHypHWQLhjJkurya/jS8hI9j+8d2TptoWVVhg6rQjLEtXwZP61i
ubjK45vLW12e/FplUR29GU6mXmqmPv2lSMCu++0G1BtCIo45puweoUJinnlmm8HQKvClMU4vQBYS
50gl+Tjl/TAdubTfmtQGoj+s2dO9RhEwBqNO5A1jsuKpOWlF3vy95yHreeQstmjhDi+ibOsJXdmp
sstgJXcHDRXxYhU/7DGAtDmu7k//QbbUtI/1ae419ye9Feiy+d7IsDwRnhucioKWO9rB8gf72zBp
P5oG333aIC5zLe0qoX61wj+sp8rjV/M+Q+JcKO0yagG4nO+bgdGuAb5txC5tRNOn6HaeblLjt/Md
bRzBsCq9YSJyVRUSUYwAZ3Zv5zsNC92JW83WARbv+oKurrmrocmd3cki7JvhYlj7G3aM/JSbbWpG
lde5UnanvC3TKfW5vlF+0l2Lrrn4OYrTBQvZbEZwMf0JDYC1nnDvUF9V0YPAklUEO8vK2jsm14lE
sTcfwwG8antVs/qU6SpWEcnWjZ5aFTQ9b5JXZoRh1bOS/bo5dSS/D4vMz1ewfP8kjIHzazsoSXB6
T39yEQl2DppDCtA0gqSUZ4Qml5ar9jA5YO4/ffx+E1/Xq7ae6IkSi7MDEChfpnvtsozrteXqxNrE
MLtOnE4j21bRlyhtgwq+lQETTGklf+Qm+TWOkf5BQ5PYQa7V3Rox3BmyVWlcFNyUNrvxE/ksX892
4pdiuCUJ6YSKz9Vu+j7P0vPWBghtX3xVal6xpvFU0x1+iAydDZ0ueer13xiamTYlYqa/L9JDCU/t
X9OR3XvKNVgw1p/p2kiD82pecArC7wWr0jQ1P6UUp4ag8tmvE135kv2j1ruOxT+NvU2KHZaZuK9n
X8+DqNdgT3p1g0pLZPi5eNPuOYzGTDOLFp7R/SS92VkqRZFakbhrL4GfW60sJy3XDpdVvJL+6hhF
LCU3grTxfqEy5R+nYT1Yef7JyS1IsKWga19QyNIqjdVT/Y+pgeV+KCyvF0WppFUs1YSExdvFgTCb
+p9MiJ+7ZfH2MnG3ZP2DqltKFHkzxlAZ5VUJ7qhdGzYCvXiypW1H1X9FsHkwYPaKDtF8etkrWMd8
0jiJImPJubIZRj6vH6+YhQoUbIGQioC3AAmiSf+3rVb2SAkQlgnuKFyAAGhXA/G420fGW13qQA5E
UbN+FOVWubl/bmKnwkmgtNNeA586W+F6tvYbBWfeuVldvdqlZrx0EPotyK+yG/aowR6KopIIkCzS
tmWjiIyt2CkGqJeo/MDzNGmYCEOlOFaU/naoT2OzhzYE6Y3LKeJJdmE6dC7OQ/qPDV6ZONkP3/gp
vobIiolKj/6YFttmk/j86qRzctNtCSPG7bvRDPzSPnbpu5ouak2TSgoIFh0Ysb8mx0loSfErvzFo
+bFIRZmbAJt6w1h4K5h0q6CS5iPb6RjzRQ3gayv1s7Xg1aZN1C4GU5DALwYU6vP1f0fZysS+jfH7
L1/xTh97NAd1n7i+SzKIv+1ENjoccJacFs8yDySSZz7uP7X5omf2aNCmSnHSz1iqYUx/ZTGpkRbY
o7mE0A7ahQjr8q210PCSWKtIWw2KN2X49fgs57Kk5DIS+udvMQ7OGIeXpcKK9YcQfAkm9YmcJ20L
3vjZ3BBZ8eRigwxnmeJju0bpjrEnX/1AthSYMkceMEp+ka0JI0/CcPL2hXNjBC/WlW7en9Yxg2Es
0ubSMjE9ilGp6+kCG1VpTwqnU+KkZE7EMLILXgAHLcrxWyqKKHYO9QWm/DBIyCoRPppg/pXpkaLk
bU1VB1Dzox0rv6tvzx6e4pl/3NH+FZL9EvnBk6FvBKYeZv6YY6teSeijNxxFvBUSr2esVX42diif
+oeZ4gmfkW2w6Hiy8OJc8oJJkj0IP3EyEKhPF6YoDl0suFNMGL2HrShLr9C6xrS1cq9doxnHE0o9
CpbSY4iVUV5NhhTi0y/iZCLaJldSRZPzi9HhJ8s915jESDXaS4YVrldrOOVZ6WDdkmmpmsUqiErY
8SEsQpPhxgSG0PlumtaViPrwZIiWsn2WnrIFEJUg9e1DFUflSwVmAss7aDgxxv4jnbaW2ssep9sM
dwnIte8aB2vVqH+PyZRe9pwawcLMZcl0HiNJdb+bv+LcO45+CyamVPKz66VHE15V8yhdNW12e/7h
ccUavOR1/Q/18EIzuTlsjWl29ms1T0qiygF/BxWQYV/fQPTm7ClTaXvl/uAatTie/34vKf0hPjHW
Wx4Z5WD6lOTZ9q0UnymnXJuXAlvddDHiNDB5NfPNwsckhOnr4Y0opkG+uNISsH3GFHyKY2tK+OL5
cpW3BMWwxpS09asxjz0xo+TyKY7yhRUNpIRRjj++rIysHdCWtdpO/0RgNJYbaBl74fBsOtpG7kWk
WaKEz1sp+Y1Wohqcc186wgF5KXfsqJKxJc5VrYVY+vwhdBzRcn7Zly5mVseg0RjjKidGFGplxu46
r3vyMmGDFX5ivqPXqJL4C5QTQWpM3ea56rurKtT0UonFy8yDFswC8TNzyYwnSjE0mcGQMSin3RPJ
OjJmf5Llv7omYRQPLTVEaypMQ7wBA//YqzfuzoC303f23EgL4bYPQ1LRJ7FozlPJ5cish9BcN0PV
OydzVE7c0j/dp393tu1JzbCjDcZ+0ivOxNvnlcOcz6C7PqybKHd5tOafmtVFXfYGcNRwu2zxqHu7
DZ7CHfxEZboHdLpP3Agf31nq430rvUAMklvbW+4DjldCgmIVPQE2LWDMkWyxILfCs1egoTyOpHGS
xMHYtyP+1ZObOE7JRNyQWG2oxaKSISDHHJkbVRMxMK+QXZbN2DSQd2J6NHKY/jMkprsjxe5I7iEZ
cVxJQkkDXIvScZbJZ/HAhb3bs2b5S9ZPnuDW5yaWZ6FWQ6xo9XzEXWSvdbTafHFzU972vWe3zl/k
qAPXaDfKrSixBkgdRIVLBE4Z2Muxda6uathhs8pSPPJDOew+BBpVclFx+zN2c57AFVYsOeh04/ai
wT36wgaH4KLc8hpGQcEaZ1jBEdJ4tnEv9mztNeP3tUjFisIM2YkHrGbImlMXOqgTRjx6GmgVVoPm
TdUAgLPpQLmKuTuuLc3nXhkCSxVjpnjNA7uLNpHCz8cdOZCibgn0l9CERI3V5+PSJi6eg1KCAdvL
+2MP3IMNQ+wRWzn6qoKwvCQxsFzAnhL5UIRfuzywpZmUN4tqOvenQpsEwKaXPHlQMKOdZ8/0PCjG
IV3U9NVv1BTsAdAHSBuaItD+ytcWNbhJVk4GZRbPiDanGJKXRS4/nOIdMK95FX29W719TPoiiroR
A+EyvMTWTp9CoK7rOKpHnIJMrjah+0GrVpGyLDJqFXdEwdMLfFsbZGqjj7WidnQEf0ARCMgVC6oh
nvYlJH7uo+kDvBSNl1APw6xytkgKOTE2B0dN4dXFzRiGFse9o47yz+J4OmYhk4C3UzfGVuzDcNQ2
iTm2Vr64gnPALrsCn2+luIKm+LCvozzaVLicgDa3kMUk71Ag6s8aEqy3HUB5ENFl59L+73Ez5ZMC
yrH7Evu3PTijzV8xvRgakjfvHQNBvPGNQJU2C6a3oE70gcdLIWyIdhYDNbcyrafu+eCCer0eRJVg
2qrozH0AwvCQ112ruxOZV+vysd96zHf/lXTGlwpTxWPQpKZ7HEOO0WRUjWTQP4tlAXo94OyWhUon
OOUNtCZSgQ3QMyRJ4TEre47SywlGHVgEYkgkXjuFY4x2/MxRsL5ho9yOlHLyJraiiPHyK7agC3cb
nUJgkf5TbipggjA5K9G1U+gM7Fw3JYJbsEfrTDCTHOcjuYxN29Hm8sCo/r+rYn6CbAR0yz6J6Cul
JavC8sdMiLvXB6g7bNkKqsTTekKifhs/SK3XuJi74ceIcL5909oQdKgbii+EiWsAoVUTaOP4mcfh
bGni5w1kfGUGS/C4WpkKOFN29aVy9Cb40Uvxzt/V1DVJSCFSA/jSTvjGNNPL6Mfpz62NFygLRU53
3loznCbKhTY4l6iwFaUroTfB8T8XhdmRQ81sN+AMA4f1KpADa/u5A9G+Wsf97riub3HO68Wfg1qz
KJ9+fQKFDxMb/gm6ntUzi4Vl5kRvUhrbBpBtDZipG8HLff+8Rqs0vkovkT8LHCLsLbBkWc4O2kfU
t/g0H9Gn7v6fTjJQluOFYc8l/aanT8BC5o5koYEjj3NPIATCZM14us6qqz2gTjfHVBq5BLKLaKmX
qxdmTXoxBZlI7qy2HSTxpDAdIZgzLAgLeZlJuqHpMYMw8VHCAu9vgl0fA2Cw4yaQ9n/ZGH6HleB9
fd1AxG/QK/VnGOEl1gwEp95sSbRm9GlGjTZ/A1qpvX3BrncEKxLpbpzzr5vFz+5ozZ1ekk7NhWWl
lmup1/y0djN3C0qUT1iYCXu/phJ/WDyOqP1BTFnqGk0atQ83m8AdV4A2R1k6A1bxKjau3y35Ravr
262qkLqE3V6Fkhnf8PAc0PCaxR/EixypJQKLyscI53hSQtt9MDRGSCD1UVN3P/0bQ56FgVLBY9/G
y064ALpJ1EbcU9xvSxKA+kEVnGHiPpVodval1XWEkV5GNuxeszzTr67LsHJ9bqofSkpN+FOe89rK
bx9hV7Ak8E1P2AH3Q4NQyF0/0vSptRx1ckLLdNWEv7I3LREBDo7m0RCaom6lqVRCK1Ry+8NAje0c
MGjZT3BpXz2rCSR8v4hC0i5ctkAd0wn/9aBbpnwZ1vz1XdEhxFWhAzsAFCak1ol50yUbqapCQvKu
XbKpxiE/B+QfCKIQ+lJDxAr/700lnwV07cYwdfGlDm67LII/CN1cPDv1MPiexMxO/nhIUKBeNsfr
RNI1epuEV8CEclKkPbJhPgIBYLadpvgxlvjcsX2wMo4xAqDBFYbAFNqY+c1ny5P+hczku3FHDslc
D7eAaNUoT+deo4vZRtvuHmHD+MgonGlBD0uoV46VfswKftDKOUgMRtRgTpcnQaODonNbLhBtkFNj
41a3TLiH8fKUOvAIJjSGNJ0yv7rcBU3wQHi3v3VoFYcck7/pQJYFJEfhmHBNE/aUQMoA/z9b5m19
bFI0NFileosn7SHUjfTPft69FQx56nHHOEMAqAqzPYJx97VepDwj/jyvhdztOY7HBsnLOpUlKo0v
UPThf8x5/sotSY9CQQGbIAoPGezszu9A4RbQBzahGkD5BNCRFVpy1eLyO/KsOsS2Gr9K9CUFbrgZ
Zmu6s0et54kM+OGuJtDgFC8pUn48cezoAkMbPDmjdOYCpbRiSZW7f+sZAfp96Ytzx9fGH2VvrU/3
uxoClzu4wZ35DmqYqtxxOxFt0kTA91bJlzCMGmHV92W27TlyDzDqKFJN6EeJ/xDGbr03rBmfQrUh
VmlqSUA1OdFiNWJS8tCJlVvGB8GviwHdRT/CjacZxWEjtD6SjD0IIbiZOWF0qHzxlX5Ga3n+U9rb
KPjcD2wooI6EQjIH8fSV91I5lMiXXUvWfmaUPeFwyCnlDWaMdty7e4cyfGJnxjO74fxnXT2nGLiS
mhbT2VPD3/XtwjVRCGavItpal0YV85fSDcqBxn63EtUs2xoZlWOtczStXJOcSbKA2lZ2YAV/78vV
BUuDsVj8CMQJy1rXx5fG50u6QtUzPUjAmoQLkWYW7Qv6Wb8bqMmniS+H8Glzn/xj6OB3CzewjLwC
ej0QsXLHy5f072VQ5BdUKTRG8v5mTxr8NqLzMCwRrHf7IyMyZ/ufefzwFtjlmV2qMxpD6JALqdd9
EUhVtm//booFfKffCjKs88mXJmYVidIJST1rMk9JyHi5cGMF/HqGLlPTD6EkLIHYGRSVBdf3jy7c
67exoGGrosEZAAtto01Rfe2yWRdv2lvBa+v9x0xS23ZnkTl/wvS7kBKhhKY1B8XPIHIbMswasOId
iKWfX7QXhdVNTjHccDLja1H4hO085MlZVoLXVA0xoRgoGwgnS8o7cURxHIn11HstcCTdMdJnP7p6
mv+uHf8WbjWKvDLKJ/qAi0AqUzAG3A5K3kr/X8HW6bH9yYN9HypOUrfddJ3W66Kkh8KabNkLumJN
dHszg13Jz330KoDbiPdZdeo2IIgWatOJ7qIOUuBTVistp+D+cSThF4ShA/gb5IpaG7d6xqn5J1ON
EdhTfQonu9MsNDr+tIYqQIpsir0MiAF/B7oCUXlpjDhL3UtMuCJy+tY9ybITYYII/XR4IclKKbJS
eaPRUP3v4e5LoaqFT4VcFSWhkdq/sy9hancNXKTAHxHhoMfYlfJ7BoXpDy43BT0QCv9Vp2EtPmvr
Od+XKiCJffw65zV1RMD3B3UmpX8/HmYnF/4I1wu2Jg0/d6q/DpPlCnjEpJq+Wv2ox12AsbY2duWZ
3Mo0FpdVXLiU4ilWFDM1HhRyMXry0eI+WR3YDBXDn4fwAZyBvfLfAxTwmQLOd0az0kjLhsTdf0Bm
t2y9cT+ls05X9lmTQ7HahK3JCDFwxRa2PsEM7XzriOg7XkCU2S2svsA03Sg5wOGp8VN+j2gI8/+Q
bvMSMpum5Dwf/VmkisO3toLZqWMixygZXBt/U92GNVzItNHacRbo/uBpzWGORneHEtfTe0mNu1pe
6n/PdYiFd8iVUmtRd0045Kn+komyc6cjW0DKVyEAvvo8r7RZmebHv8Dy8jAMfO06Fg+DLv3lXVVr
W+w9dX3nl4cUW5tieNIcSM4K5phSCTUnzs6zug3KvTQqzw8eJR/PBePBARQD6sHTuqyd+rT/+9oB
SvI60L4GeiykjXlQsTOCikw82BAzZDgNl16VfxfsXpGmDTHdM+YxKtWI2L57Cx+xuwcTLgFXlFfG
P1AgzIRmSjfeRg8Xl20W6ddJIUR3qgp1f75Tim3/lKfGWGDCUho9lkNoavI+xCwiffUadjWPDKSB
C3+9Mofui8X+T8t2TvOlw03T8L9oc8oY0X4czfsfyogVBaECYtWuFFjtvb66V8wrAzFP6Z8x6WVZ
pUo116Nl+ivb3lI3m8gPrwJgvkOGQ1vR48vsn453IwU0Vzb9UwWfgvOEJnuXxNn4TboSN3kUL2aA
0HPSSVpFlPLVpFp7PUePE4zS6xYJDzk+OKb0kijln+9fIMzLmg7mtlQBQOFT2o/U761mG3sRBjzq
PDakESictjpk/g0yVUl/swOzYWUk2ohAEjhPqaNt43RlTWMV2laVhiOdpGGa3Y7AvD9IpLvmUDzz
TIPpIpfDtFYlh0ONAl9cpxi/5oAy0/uZSGpn7FQbbfaUhGB4xTDQg5JMjtt3nA7ZrYIGdyMnp24y
F4zrQlK/j6IpLo5rH8VK2+o0nvF4/p1l1sP2cZrVxRLurvJK/143PLDQRhG42hX4APQqD0M77irI
cKWbXcGjNNk4tdWRJ/GAq8CQW1VAXia0beERVD3tVGL0rcaOD6HvkCuQsQQuDuZTAMgsf3wL0yAb
+GdDmoC08347CbTFVVuc18zcgxe/qs8nQerw74bIoaITXYPxzMNs1Ahr1e/8LhSK1+oGwlHBQ2VB
PQLs0YAXz5QSwPWvUTULTShh51gOBXXo26E5qhruy8tFyAIxxfmP0j9ImnVdHmXoxrqCiT517KwL
p90diQBJyrpeHXVFC1mdS1x3W7lC/0iFukeh9tldORy2Oi6jZjI6g3zE9xLMab9jLb6+IjAv1gWh
L6tGw3zTacApo/iI70iRkELUVlkfp2+b/+2nS7aKyNAd1BsoIjxX3+WP7wNQTG05+/IBjUrsIsKd
BU+TfCNCzKV0v3jcV04wIIaysSZLjAmggi9lyX2MUmrQlrhjb3wfss7F2PS4M7zKJufqOVumuv1t
i0OKlNCp4HJmYF4Va7h3j4vHK3RonhIgnbMJT4u9K4ywtAcocNS8O0cZ7uo6lENVZNSv+H5oGmKo
sb2+/TJ55qF7iwtmxjOQ/8tznr+RK4GcRNi5m9tV6lCxUIB7kwwoWINmwrk8jvOaE7GemuIV8ObE
KyEivDceWRHtb/xLIDVraBt3nnLZxA8OsHQ3BCxm3EuxhBdH5rIWpXFdMOIqOsdO33kVZoGjkhOW
T+U04ZxC8oO6DHLGJYPMvgvzbmIoL1kpidFxQJalX21XEIG7MgOjPPvl3rxBJCajbobdX6003M9U
O7apzwbCTQMgImm7fm6mmxPBibqe4IOc01iLXYQhU315/cedW4ZJCSwh3yPTURAJ1V1ekSbdeqXG
1m8Zn+eHweuZPb17mEbEa21Ks26Zvwd5WCO26e5oEDoqee29LOfeqNUA4GO2jf26DANb90ob0/oj
sQjBUL8ZFrUEG0sywvpH9darJ36u7e/JeEVu+pynpYIOWRYLxZCTYNUIxwo+25hz/1DeOf+dLtMo
SB0oDb3QIxGxiXHVm0PhEnm+bIMb1aXx32HKDuSeCKRYmeG5z8Ddyhm1KFdcNFtHEuK79r4Oqnqa
53uEpgybppl9uuBrdFQCaMxpAkte12eQOm71ylhuIo8CuE5/iFkeTUcgRSdUxySRAlQsWgi48H96
FtMnBN9SPVLmFwTGZ3sJNx+6jsU35g4C0doQnxFV5GQuKeCjqQjEZcoohxxXWBKERjN1Ct9JJWIc
tB+xyVYErX8x+p8P0Tb40Gy2fXejDo6dnHToVlGHnFf5BQTEgAb3k5bzF6xCVSQ4THHXu+Cd+Zbn
Q5VWTRAAQeWdYIjSWGiPirT4eZWE+ALgs1CV1DywhRJ1TQdwL4z2FfWgiks+tG9+Wy+imEI77IIV
gUCNyPwGPQM+5S52P8x1mSqpDkpopPU/aCqZ7jZyoRE8UzL721YIlsPZGzv+YeQ1vVv6SXIRWPG4
auPtlzpxN6vvtvEAcCB+2UyMDKCh3uJMus3tpfnoQutR+sA6sc/0Dsly9npmrmqHkelGPcoJVj8Q
ZiSGUgoWDO1IWwwpLXsjFLRI5YwBhuy2Nzss5PmO7aK0Q4RxpVfOCmh3r+9iteq3O4Shn9DjzmCw
MnGsPnh9m3psN3OH+tdc/JK2KRTbAkfIKL0Rqk5vBMnHHagzu6UDrdgx4wDqzQRXL+LkLmUYlu3A
tB2hRHBzFGYbF/sBAdmmTlJtzcaGyU7AB6xZMtylKntaYE9t7tZ22DACrnbE2NOqLw4Rt4/oL25d
z3GYvd6gBFliCD2yvqZMlP+YsBBozXAzdHsyKapFEfQC1D9HWCBvM9Mlcqf/gEdc50ULr4+CFp08
/3CL5tUkf5N+2QcC0I83zM4LyCfqGcLFadTjELTZ3C+1JnA/XzymAl6RBvWpKKgKkuQq9xImF0me
+7XzXVSlw5WBq0FUYD+8RjFRHWIbzXdt65pHdgdX07XPsLKZ01oeiBQpz2yZObpO40LrjhEyylbQ
EMTgoGoMxzA3+uaYSnXoRd0n76kIZi5e0u1+R0BW16UNWA++Y2Jc5TPezX9+PlADGRoDDt1SkpQk
JzeBJmAEmHYw39LwiJpYfaZKOC+klDWFmQPatoNkqudwMCyDEAc0XGV7FqzVJ9+RapTr7j/7YvyQ
WZXRcPqlPjpL66vuy1Cs4WAUPH74lVhSceXMEuoilO2PLgcgO8xIj0lEVHhR33UZrwB9h1M2Oenh
+t75JnFefMWPYw83rFv8tLXPMGEhz1SHDZYIyG4RHY0SuVS64l2/P4MfhUmvcNLcdSCvHojiahcz
VwqIOv+5ZHsB5di6F2cIw2NJBiMgGqi5Dnnc9xiIGJsZXbr3sGBu1HxP1It0lDqtyDtINNDiHQ6g
CnzrCzs2L+TUk3GbC0yGQxm5Hwv9g11Tfr5zVAyphjmslWGHs6+Fgk6GQ1cFUmLGG5TRTPo6G7v0
EqGt6Sm5+zlP+cTqXyPsOapEFTpGQM3n/gu5l2YcLh1KahuqSZIU4b6L6u7/Yy0ha5+e3alWlctG
yH9Haj+WEMqwkUdCGOUaDXSLPFcDVtFdb3BD4MvhcAS+tXlP2N/jObPLXylF76aFbHuR+bohKvGI
KOx/B2CfM2nvtRDeszd/9KS7xuKKLRqu7GcN117PmyHpYtgAbL2YYE1mLyiJfx99hFYnMveJELFx
/+utIfoRZ7cyqSdRMdkgleNCDqv00jZOYeeX7hFj7pq6rrXK2AZdPeWaTPOUrE+7hAmGUqlHoWtV
95rs3G9wf3CyOB8obmJpnTpChuKPTCAGCseYmPqt5ik3tjqPrciyu+7i93cg/6BciVhz6DVM9Dx2
lL18a9kNPbQw9nf2HCsifGzxjnwdhiLboXlFmqu5I7MLe12DoLfc8OXDuLZuBLhQXbsY8WqloNr0
Je2BikzNDCbWjSx/ibDUOVKchF3vNARRntrA4dRVj+geLKwdvaheZE2GDuYEk8CfZ9c+26lDwJ4K
O/Z67tT1E0AWYEK8SPCul+xPM2zBfEc6pp2hWudv9BcxX7rjb8Sz9+DbilZQ0XlsuFX7ZZmu6Wqe
WvZAIxDHeEjJ4pJWfoKW131UKGjITvZNT6deB9e6r0V9R65dHfCe6LXC04+m3std2GB81bpIj7QS
fKmvABrk+o1as3HyERzzWh9fYTRXKX6JnCrkkoehovmo7IomnTGNlOLgangKimNpRWlhvQ1HMC9+
ZZtCWgkq3OhOFHRYPrilEKF0svOAs4wqDBOA3sX611a3xo8XR78M/Em3DHtZmnbrWdm2zACfDGMp
U/Eak8a8zgauWwZBw1rB3nl0YDpItf06G4JPOkh+a0wA52Hk/rqtS1sKhFDpevZqrg7hgKYxEiZj
+TcuipVrpYWKk3sJXn3zVFVjlbOGYbo9+lyUG67zZwDHiQV2zVjEuKBxU4TASqEgP8iiXqqmu8Dy
wsokeLcz8qQDkyJQK/LUm7bmKOog6X8AUfJBq5I/2BjCCa5fNCOfEe+IEFo1KbxkT1aU2jrEI0aG
4NlD3Ob5PK2D1LUsLMPNtGmG8JXpmXWqf157Lxpt8lI4XDSBvj7v8lkLRdhXZH7KkoHr8XxvbRe/
bnUj7cWbWMg9EN6yC4vkPXcWM5i8pvth9nlzUj41bN5zGk2FpRoa9jRP5Z0/2ppiJkkzpdaAr/iG
jGVcKPK0IMp43Shmz6ArWX9uzxk230ZZgxtQ3AmLnC80d4pvsLTKOPPU3bSmVwEKVAtB387G+RuG
dKQIbGEqhzPWkPAIvGBmH/FQnfcg65DpKOpFuBYDWO40IyvwgMPmiZKA0qd1GuwF87Y4HgFkjrgr
RO6WRfVoNnbi8v7DaXbDqswyqQur48z3hEeKCvv/bgSF1fXLUSg1JPDc64sEX1VnkAE5MuDv6zJK
D0CkbxbL54cIeJPwgeMkAPUEnv38pmantSpIlObl1HMMACRQYNVnjIeq1rjhClGcvwv1rKoYse6Q
59qdjqpz+KwcMJDiuSAVbOvaQnOKrvP1U/JAhNUBr3m/32W6bkA2urCCgm01n0uviF0bB4vl9wSv
qYMlejkemCU+2A7oz4dFrgH8MS44K2kAhofjgjKSZGI8J6zqrP2abGWyNO6x2/wAeYr85NXI4h1+
UBQJSNeH0+abMyMtp0m6BEqTzQcQs2q9rAJfKLcBCLwIZbiD0RaE8EdSoUspxL4Haz+c5TbyQJGe
n7U3uR+Xexxeeh7sKmEHwe0adCEbOrL130b1i/KMlxVL5/oGBX9FhIxrt6v6UlKDbZYVUX79xqmz
A2DeFxIIXqcy6/QrghyhlOC6KhJziZ4a2Tkh1m9k63N8gbhU4OhsPRn687ECmqTXncsvREl3UQjE
kQnOV/li/tipAicFxdAwMDpSX5AyxMQuhmfL7rl02eMwHiQoO6Q2I8soVmko6Dz60Qw/gXgQ2g0h
G3iIDIAloi/w7Q8KjKYtb2JascwZh0ZWJLKhImGT2m7ufpTsnMAaZg3lzgPSZ04751zKP/1/sYHH
g4G3oLH3i64IfvIErw0unt0wY05SUqQaMlvA4GmFvhBp6blebel5JPLzkBImp1uYm/cFQUxghm5c
UjKaBtM78Vh6Mq5BUNBPeN1kZnfv1b2snNLnXV65Fzn068I8Ze2VbEk2BNNoY0M4b/WUmZBgrT+x
PHZMDkQLkZitczT2X4kNmYG13Fcana2ETDlA5WPCsck9Ywzkxnm6F020Ft0rUxKPk+X5TfQlukvo
K0QCLbJIUr1MYEYzrBj4e8EwokCRPr9jYrptzM+BiWNbAas3UsJcSI3Cwf8fXkIJoYh2g+C2aqBQ
zKGOcj253P2GVaeCAt3rlC5sLZH+4rHyuypLAthhBOt01TnBMmk4IS5diC5KlSzJ7uv7bvVsmNR2
0CrV7ScrMqU+WJpJFRlUYQSJ39A7ekUveT5yPAP4IIsc4PDD/+0pASCPkOgeb1vrTPz3yEzwlgbp
57bEIjL+I+L4OXE8NFpNQ+CAUgN3dVh79SagrNQGS/MOIGyV1Er2lnZY8BoMI7oxPOgPkU0ADxse
+pNLur9PU8mC1nebEE0quIr/wJzrxr6Ygtrtl3+o49GDN43N62UihWJ3XrS11x15c6JzuY8vxMtk
I6MiMGIltxzUAL82/WmiaiwUhJKaMqHguH10pAJ/JTfSTlDAeNxb4rUZPKtxYkdtTbfB/tCIAOsS
HfAkm9qMSCH5V6XkDzVfUguxIcynLGN9zY6N6URZCO4O2il0BfwmoaWNT/OsT6yUD9hjDunLO91x
v5ef1kMD07CzHPRlIsicP4yIHZuDclC7DTv/8bewg1LYn+N9s0iaSNoxjgnUbcA/J58/JOfhV6Qe
+FRgcY9kYNDz4/T2FxzF9lLjxS1BU3mLw7CMDKm3ATEbKhSZh7zZIeSdpoqs5IS7GpDq44rXpEFA
Xzz7vD3ZiwjK5HgcS7Q3LqAYOnKfClHqIbf9lO3hOhBqnakckc8Rut43v+bu06SwKXpKsob+iFAY
8XsXx/Gxy1yMU2taKsbIrqs73Qir7qaZ9wUEJFBPIG4j4jVFqBjFkwlEunsNP6PltV0eysMSlwnc
UtiBwlTXy/mxxeKOpFepH/rTGpzJLzM/+pnDaVfX3l51O5ElEcnhxMKaaFO69TueiHFwpEpaPyTi
rf7v29/tdUj9CuoGNXpRM3mp9g/zOb8l6wA+lB0R9oJisZ3gSK2SQOQs3OPZHH70DYQSOxQGtxmg
cbP00wwXOnFmwqt9UoY6RWwZ2zuDXgDcftc1K3Gjxi9jPqpvfZruQLTmpTfPHTQ+Roc7tjTY5WbS
rCtOogqO7kWcVz+BEScrMa+KG04cEoAR7/ONkNUfH6vwheACS66ie9c1zh4VfZi2w4j2QVPrt5U5
xn71bw4N+CGyyZrkzRmHl/7S4/Fbsz4ko78aIO72TWW4tOmBFOvrn1pkefUqC9IPlJmYCWLIpkim
isoDV25eiYHLOJ5gC0IR4kgR1TtXwBHHotMEGwcMGTHRR4slObrx1Wm4l72N+I3dfBj+1QppD7P5
Fwlw0/yM6TwFWuzWuwOkY5Ze/Z26ZLGTWhir59xt1Celw+jkZY92hBuCGPH1+7k1gveBn7JuJPmD
Jo3Wt2aWAxL3z08odXN9HgLOvKMnNs0rMfmxOM7HMZcWnkWbo75UhaNB3Z+mTBuhW1iIBSpTU/0B
qWvBhnBO20ayrgCH9hO1G2r5zKxdlXpgkvAF4/pkl4+6UkTva1KkxBuDRjXmwEVzx/PBERmF3weR
4/ghj6V3x8cNqfi7D060iUUhcX9Wi1OZLl1qAFzTOKKe/gy4P7y8vtyAGD06AIS4ypiA6IcrYkYj
1Ga4NhRhxDb+WxRIH2Zqld0b9QuYXDqPQcFXacWfOdNH3PzLBiRJoFXj3jvC7fJMmswX+SPkzhAL
CeFWdOFWl4TvRubrVDGO5CbEiQqrh8cxvRGtHCedWmzYG4VCe3D7XlFpmt+TaJnisuvdGaRjos4P
tSRRSdLbTCPy85vVaWz9RUGwMVAHsuoywHvYB658VoPr7OBTvsSSaImWdQxayW3xC0fjgKUPOedw
DkTVy6/EoCbg+LwSkKL3+ZdToDCX9OZPl02O0cHBQF91Bnlp6brr6/CAIhMx+0bp741ufcoMrFYp
rYZ48pdEbdKrLi+iuVcfqvb6rhxuVhorruPbsteVAy+jAElki906V4NUBsq8PWa/lT8sHIzWMEE2
o97WA5OGuSR2mgpLEm54bsAvbcEEBHwYST+raUsGaCXYQfPqHkVmcLr/8PSELRZxtlG5/1Z4z1RQ
fUsvl6NCNqcEZPii5sAaECpvWyp4LzNJIfl07g1/ObT3SbY+TfyLlL8M2+m5TzJ4jysIV/sXpOl2
fEfj92t9zYuiwrguJdaJmot1wqUrEMelV7+Zu1rqz6eiKCAZ/EiSTtsz8/Utd78xdyyz1ZtBrnPi
xeA7MhgS9v44s94kdKMYFQCxYNqQgSok6Z69PV1Nwyx7j0qP6gxwaJfDzEIaPv5UMImbhgvwWb2y
KWHb92zbAzStgWj3VYEMRO3gGHH8Rq0maBfnla+Z7aGkIN5qXEEiOrS7R+f7i9aOgin0AfwuFmUZ
VqQB0s6itGADzkTfRaq7E/v+hjLWBBL6ga3Mv8qarVx3MuvX1ZyXRP6E14zJQwvey1E9/EWFX2cl
ZgGOIF7NsBH4lx9kQdNl/bEZlwsZh0JAsR5t8v1Gm26shTRGKOcM7ixYUAXYqmjInUxKqDBsW75I
CqfyVrK43nKkmKJTr8MwFiguJB0i8cKmx9tI/WGhNkAgJVZsu/SEXgbyjLHI6AiFLyONM3mefLqe
tr5N0XyMNmNaft9ShgvauzFY7cC6aeXf0yWY7jpmodyj/G/fjfar7+EWp4TkYAMj6tJ8vwCdImhi
bFftXZj606rUaN8t0+jdMI5IDB2BS14IsRFkwN6wN3yXsAFY7PchJD7mamlZOV8Mi+/Y6r+JuVyM
N3cOKZRBtZ6IJuYBO5aBrrBaFwyjgSVL5elheSqMIqsjv281RrsUJBVTaDt4xBqiEjGjuOJ6BWq2
pUuOi/7OtB6u9t6VHTnfGfUnhm97Bn6mBJrxXdzTsa4C28JnTb8ifeXf+2YPcydRJkkYyE3EdteS
mH875VhhpeCXt82mEpH/WhX+PhKEigB6rsCI12q021vUhK9gbNvLasUTreO6fze5MNFDkSZkiIbK
wvTAmKR+MuglAP30IWHO+wD6N3pcpIIHYvyL5Pz06x86ZqzHimZNAzANRdSSozAhHZF8sg0r/p3q
8OuO0c3YHTxNCkCvDe85cbCuzhBYl8szSZlr6Zm7N0JBibZJ4fJQbGe0fAKEUQ5JEyCwO4l1s1a0
NKfemjnxYsbj20HnlR/zG9zmZo6kngTWpbI0TL4rtgJQxuOw3mx/SLXRKhrrmeKAXCyZMw2dXzWM
cm8Zcnq200Hq1/tjQ7t5Pixgl2pCVy+Adb2zu8gp+5LMO5rJQy3p52TCQuAPjtCbuQN/kTaP29MQ
hbdoYBYYvK2WMezejjvVXD3yFdlrbkXtHu+ny/Ix2F4VSnY4rfmvux3ucONmAc5M1xJ6MlbYmA+L
Sn1gaRSymRv4bpQiDKdkNlwIQnsaOshhvDPh/EMkCQtwP/QmNbhkCbCwy3WvZwxkHC+TqXq1oCeI
l3YPVPkIGcHoFS3m5DgxupMoeYopve0zux4cTpWOSPquINAxQamlpCNXp0TNGovGZtM9q4bj0uCp
DtvpRYs5lFQuzoLkAjqfy69w/ZMy1cJvDwwBicV3k4KLayj6R9QAC1ulDWoMXbOpOVfb3cT5OSPx
wubDftWYo+tHWEdxvVQ1+cIst9FZRoIyvB6dT3Fh2gfU8KjyES9sBIKLFPffjh5678DLVyy8gAct
k7kcMyOpyzrRDhD4t1LLYndwsFd0hEbj7kUJ3mysiZmGDs43NwBUf3he4UWgJOvBPf1xuLNbVgbf
eHJ/6R0uoKDo8qr3fS1fCw2CDz7gtlVLr7Nriqitg4F5mXhW4aKBwpwMegQB9darO8NjfdD7smFs
Heua7BiLDMHWJLzdLXIS7INJhqQZuGljtKbylWk4Wo2qPPEPFY3aMW+yW1iD5XfdY4BxHp8p7FY6
iA2Og/sRVoJTuTRkHrQl0/kjV9tvenN9vKfhFwUYk1nlbvPOLsoRhpvCXxBpUOzLCJqoopWMhL9R
MxV3NUN7sywpwd+WOtuVWRu0mWUakRvX/C+rSVu8Gj3h5jduGkMD5aHM7jjk9foIyISX8ob4YZ2i
u1c5fOJoradaQo/h4N6m42cMUYKjZfskn3ovWPDCIg8taoovfBJ+luZRceDW+MZKxuk6cyKErnqr
ennYbXaYUs68YM0t5LiTCZCSEYYzssdNkXb0YTIkm7g5CtEMCOVtEUYTB3uYgsSA2KbBx3AU92KX
GX2l+p5iYgeLn89uO4qnOfl0we62kLQ/QdNfFP3wwIAV8OCUa59s7nejpWLQQXNB5NPuoufKAyu9
3uFhnXm77pKP/OAIQtTK3cpKo+BN74AHoisjC8DIVHAkZwjp6kl5T6JdDicnqLaMEQUOfyTWTMny
2i61zrpXyoHQUn+L2o3v2zeR182UrG0DsMucFvjELM2di+oHtO/s9JiobhX5WS2/cugwOCe050LL
3V7zEbNP/YnP6S7VZ5kk4TNUFRRpDWj5t431nEdZpYg3BYIKq1hwRSzLsG7RnfOq1qXkaKUREuM3
6241KtJ7qSmQ63LYJvEE+kHt2tYiFjWR3OOMbkDPz8Z/M2U13iGyUxi5EIz5IR8H5djoBWxmcoUh
ZM4lti/UytZROQYGfmkNdDSV6OcgVnsXQZmG8goM6eL3lqUxuG5j/Y7xzO79Ot3Mrvjy1r4T1Pc7
J2TV283V77kAxoeS1NHLZ8AZau8N4CV81tzQV2WijVHDZthTcABJzU9uAIWCnHp4cySOCshOD2/L
9oDolqbzqYP5CVjgyWj/zvdhLnXXrxeBWZKmmX7FhGQach6PHg4Dmhp50SRfXDE9uVVbvnvRWI4A
hqPnicwmO/8mz0OC/jXdQxAjpHhurhKoUzuM4APyg2T3AZ9RRcSdMXuJ05/BdwQvfdI1R0f9nTQg
iP9u92BJEyIkjijyH2o3SxzoXqeiiK/hPYi9UPmXizXNqoMP/mc1xF8OOdOhSioNd65c7GpQHyy+
ABLHN+sRNQ4OiOyMWrjDnqxbb0uJHpKNjI8zjkF1W34cl25yr8mAcLTiKyI3lb4Kvu2da/PdsKHx
tKeFM+mEYby8P+S8VXwhIIv7khRzXonYJBX09MVmawtdZHSssOJCnRWwHmAVW6iQmuAAJniYD3hb
3+n2i05ffCHUm+ZCZ9WQLVAPS7ChXlIG2MRSqZ3q+8qSnOzvezS8V0Orm4fmBG4bX42refDyEM64
uUaUuQD3BSEPQWt7y8mmoZMgwHTx62C2laMT3V56qc83qsYOEkY1dYWf6uiGn5PrZkvDqPwR5547
GK/qMXVpM6fnSsVaBGP015J/YVVmXz4FSr1VoW2Nejn/K1WkJIE6WY8TapSaxQVrxMrZ1MxgVvpw
9rJWF9ZCclApa8PizM/1Tewr2ax/gTUP3kaWpBAbQ+iRYb1hIH4kLoeJoGiQN/k7KAftbsbuIwXJ
Q1NyHBCOEZ4h7kiFpBxlhQRfuX0azqQlU+kM0XSZ5HGksX0v8pM/l0t1oj4kfY1uDwlGCRGhC/7u
W4Uqec/qE6yxUvDdWP3ze1mAedJsFpVIiewxULv5vTO7Ayt+EY4kWOxDYLiEYhdDlbumtA3HQ6Oe
C3JNgbI6eW2RF3SD6gT3hDN1zmK2Q7PH1m4fcSHwvPiLuBpgANVixO9KMt23s8ix1Vogvysl7Zv+
J39q8uKaUWVS+zUpl8sGz88prtOPwFs17VbZJGiRS5IBzQWv+Wam8+R9jJfbl+npv2ir6sstDPvG
pO3Qp+x09rNf8p+4vRc6srPR6uWaMzMCcdSZKg0fsDYmwGxwejWH4eoNZG3gTOxUeNvASS3KTmtq
Bybb+djMN6HiMsgM6CGsHinpR8+cW3R55/DUGSZ74GSDlNYVNIPMEtdUMYkbDjmONXJnBbxjsSIX
UIcnKRq9Bhrmukhf7TpKknft6HDlCopgSAxx6GmJ0oT5jFJVyLRElTvAaUszZAwKKjgGfKTlqVWE
40h5v8F+EJVXCyBpDxXLDy/1dS3lv9au1mZxEk06E25brWvRIlQ//OgLmK7eFZBYkevG/nD/LvdT
ppy+nPyRGshjLmflQBSCeypTRWHhCvTQnDXHR3mdxuzoi6xIt8xAMzYfyVERdb3Qi/pGw5YM+dBU
lPln1JK+m/kEUryBhOfIS6Hy4Pd/fI+Ckw85PI+VBlxwdYxx3gg89AZisgiUfwK1wPC8lT3g2DWa
6OQVXwhM+I13Zlwaz9FbXjVjUTr9b0YqeB3NZtih27XFz0RJ04JJJmdeJFZatU87wvJ8Qrjn7riG
Ekstt4vAlkhV3Adofc5Gp+xR6VvZqeZSEdHpV5VbVUGuqjziJM9sHBopwTjjI9jWY7DA0FRDwyIz
8zfZtzeBCI6pOkh8xCklc59WokWssTXJK9XW/utheIFWTYP143wLFHyOitIJhR4aNATMxmx53hjL
QmecIt61eBAbDeFakxgrKiAYBkKhgQNjIOa7PlTj+HUAzuyuDPPx4vonaI1zvDy11c/wE4BJDq06
agyLh+TJIOZbRo5gVNDJqyjQJcclCBZbttwbM0CGStqw0djzAlfSnwnMJcuTTn0rjKDHx7NBtCUj
39+jDqYYAIyL2egoZVs1KErXEEWmOsKa08dmmMXGTpT/P5MsdkgzqOJ/nNZ6lEWeceaNZ3R90a9S
0CsLLme1ccRyKtjOpLdN46FY0rHsM1FFVYm83dUyPnHi0jQvU7QBEoEuUARa5aTSb7cmRiNfpwfC
SwaoioR8HDVskNTCz1CbWvDLGSDyWTQ4owFp9YRI7vkGgM/WkmhwrwiHIt4/U7RnStmwfB0fY2wT
WweXPiNv9Lu2qQXw4KMpnENSICNHPOMixBMuF0/R9M9e+jF8H1fjo6PwY5VCKEYYiGChUhm7GoJ2
J0utwAjHzoVCl5CTX7yYuu+PYRM0d0dya3ZgFs4AjTCJ7H2obRKyPtvQjI1zKve32nu+IzghmcsI
YKiZJsDQ5Zcd0dek2IcIENd8JPax+zhft1gb7DJSFT2Mwfy8rh2+VCaKQ+7NZvTaEVnVml3KIgAF
RyOE1k5BFFsh/yKX07hV42ttuW383ABTHIG4pI7zIqv5gCir3ZZMtVPFyF87r+oacApDVadic5p2
+Nf02iqJOuLEovT6dt6y59uQzHGY7AgLcgVivSaBJfO8KrlqYQB+A8CfGJ+KZys1pjV1qA3O8R9Z
ZgkesZlTBkMROC9aMSQ5fyxQ1BV9VgA45VaE1C5ksHlGEoADqUP1V4CpLOortbYECDcs6jpT42Fp
I703dlpdibJwkhYNrRFkpJbZ/7Kf2LbyYOAvvitEIlMdnOEND64Wr4jnnGFbOLZnV0LKliLpGxOx
jpJ5mqlnhqfKPhEQrWBLoB0+TqJngN2cm4iFLaxOuoKKunJYICdC2RSNLySkP3Y1u20DtFGChgvp
xKa+XjHlBeks6t++KVzQ5WWEa0SPH3jKr/OMLr1QdSwcbhqp49Mm21O/qYpaNAA/EBSxyC2BmjQT
x/sOrolG/aewT/Lc9PdK+vBxNpMZNPvkWDO2CVkhUVWz/Ypu7Vlt/8viVTsaWLVRPN3CxEODBNaJ
ug5LCiWI+RZlK+Lr7+HXEn4jP/lhJzHwT7K352MdnDPAyHaoBMnip1JyFfJW5fZLJO9MlJ7C7Evk
wnxqjEqd9AByK+9VDZuKHiG5IcgRuXsn41tob9oEfs/LxEZkKeoQ8QX+MWlBuOfTNnEkJTPd+OiX
3Y/0h0TjCuz1yc2V+U/zSWSNz7xuTvZKsN5PHrEzn1CzLgTbgBYpvxmqjscrWOwtRwx6ZVNBZHrC
z9xVSkzjL+UmMfLvUKWYf+dbAyFElmOL8FR2QUa3yo5UP8uaZ23oC2gR/VjkYi1CsxopidhftUMq
t8QMerZFoMfCMx/CbadDNA3bHxrichoqxj7Yza8oy8ebWF48GQ3u1T2LziGv7dE8pxSrTnhmzK2H
39Ph8oTGH6B+iRDuN6amURtqF3R0xE8xJrxJrAsFyYQ+8TaE2b2m3DnOOJnhq7v86xo2tB/eDXsR
1yTZ9e7D+cTepSi2yVTyMdWzaCDeAgjRh6HQaR7vpRbru4gc1V86bpZ2GaqoYEB2Yx8CkIaKbEpV
GLm5ZNFZvFZyh39x63SdUmu1GFgqtC3I0cY4PM8jDy826CRjpqmbQ+wqb7N37xVxs2r7NJLcT6fP
ICgwRh6uNQk1aXWILkddeNRd54PfCC10Xlsvaaety03aUluNdASKq2f9H2vRsXfbvTZ0UhE1kfTS
qwIBRL+wxXIfHdAeIPQMflufWdeKTvAZ1MlBGftepDIPhuxuxuwEMDW93ARaHt6clunTJyRLWMQ/
mwpTMas80DBLuEzoC3ojF8Jn2p+gGnRn8JHUfzcXkbP47TVcCl6kCYLhwD9BvWkuj4gTBXBJWaf+
asFUOi0AgkVkv/TnjufS8gvjmAQh594SW2UVHbjPABQU2Vv3pag2hVjxDwquLAqORJzYSggcYG7n
vALxNvNQhRkkvzm2Pz4UISeXjePkr1pELQ2uo1ra2de5oA8MzpAytw/GLpPKHpz8DCBs7k6TTFrZ
vpspCt4uF1wRa3mn93bhzCdgdr7OISKoxvlDipLAYhNHBz59MRjfpvKHV5jLz4fSw8b+MKVZsIai
EzNPSLMLZ34G+jZwpGMHp781fboh9L2Gfs5BWIxZ7+IBYqJU0zHu0hIXR2qokOFoBp7wbY1UM+Nn
Mak6zlb0H+ZUCJnBl3w7gIcIqbH2tJU+e9IFTs1CatlMQNyD/VY6Jm+/KoL+/ud+fqxIAa89s8xP
WGjVJDSDluzv1d9KA5XRvN7PQCuOFRBxFtVfSgS8cxi+ZhAkBk/LyxZyiABcChyUG/nGHKFH6OQg
1eE4SGSdTevn4sw8CdHNzW6OSxwftHLhNWYxzxmcGukG+Nlo9rk97HXjrdWcTa+2aasTa6dkxIet
ki5BihbqwRwTGgQfVyA9DeeoqhDlpqGQZVN4/f4QkIUmsYKrPJSwSJx1LO5LLUHvi7NVbKDIEWFm
X3aoV/Y6KrnJEWgTjhYLLqfmgdhQ8wpG9esxsu3tdUmPo9+QmjBWmHUGx81SaRW2sbLuIc1dYZh0
B+gSFVDP7HkJykbjpYjGqPO7fDPZ5QIbX+wi2PwKolbZdMaVif/WET0oSAtxhiZEvfXyj0MyD6f3
/Qfb+YJ+CKjiLRZxAb0gDJj1XyZpg1JcF05jKMztmCMDJoQkj2lG2PK1bq6Vrsj26CyAS9YtnYsr
5vBlH0n6pneeiLqYlVRmmWQEAuPzPJP4ddfv56GawEJCIW0cmsw5Wh2YJ72ghhJMhH3v+jMHWfKq
hwF9vLjfOTQ19LA5nCR/4HUA9icoCSdV6XG8mFGbCusmFngS/xzD248QSa8Dhfs0w7Kst1p0eGHf
8pfOiZXZVfhy9fuTKbDoch1ZauvirHckdn4MR2rTLYJYBUbagVogAjA1GsMmI6NCF9kXGDtk0OWQ
HYkVZf/tw4rnlZ9DQRfu21xDah7ocHXH4E50U/zvpqwj21/5LZdzhz+zx1UB/OmZLIcrdgV8zWPf
70kcI2ozTXneC61mnxhN7l+2KlwZrM70DvhbhRzv3YjbYHoKL4rgrvPNGNqrIeMXdhXsKGuK12wQ
dn5hWko+xTfyxEuhY/qNzqeKOMKQZh8K+Bee+tMPyeikfiqTmJZ5tGQ8ukLKtdVu49vsltr1K9Te
TpMRaZxfaY0ZCxnOBnF0V/36QJvtSEl2t3AyfUGr0XEFEWCKg+4FV2Kc4+9cztN5Fn80CC86JU6C
0VuEIxOUpldbLNFFGr29yGccqMIxivoAZCH4MCggVgtOWBhkemfB4zg6+MyPkSvkOqC/fUvRWPeO
ck52bhzZddfpBAcKR/PN27/bQH240GYyYCcVWRD9BddlsY3kaJ44agTRLU6D3PkJ+X+UJfuVOZZZ
Mkk1ztjmDZ0QrahdGqXxYfqnCvs+hIcp1TI7ohfnS5caA0M3zp8UvzJ0xrmyNiuF62Y8WlbgNOtS
TxIKOexRwIWLKdH/Jp/eXy/4hFeTgG/G2iTBi9fPBEbpxF0dlpZSC3wxPmmeL1tvz4ki0Lj/QB3G
GzyuCHjkmIyCmF7w62D0SYguyCHTO6ly5VBZZc3ICDZHKEJRpWjYl1IqGONEXCx+MdMnOP9S67/o
cvSvNXeRHE+ZAIDWecWF72eakZv03zVw4kY6yikejE13J4jySO63VBXXaN+CycoSQtOBSba9uYfQ
xxpm6jqMlKiLodd4ll7CW/P+pEcB37HKbBmunf59NDr5y8aAXnUY8VVApYkZb8WCd0JnDZ0ArFQB
zxuwu7YdOeywPCxG8ZY3lbFgL1BCCJwSgWTFWncAmh9E+5spluyjocJAJdM40PYCczXZQ7v+vfZD
RgKPsW0y65fCLyypC1E8SwxnrAHUgWX8u9/VOqgjNC17r+CM+pgEPn1dhnQ62dN0ildMkq5Yofu5
wMZfdTzo0QZE7DBzFL8ma7tnFVCy85MjJw5OON+6wjcy592S0mME4T/aX78rQElSyqGw/Oe0DnyX
DTfjnO/pwFurH90cIfQESHEYz60kGYiQ3vY0/9FKJuZHr9NaIgWjMaAkcL9cKuEFpnCwGBLpO8RK
D4FLMEdwcLsxYG6hCRg4/ufCMS+mv1g36D+qD+xttFr5M7Aks3KG05qf1hAdkrXDGZDiU8myQYdg
XZl5gq/qGs35YYCcYl8NtkCQWpH7fSwCNBpiz4hYz6iLEF8f9oFlBF88XgUjiodMO8VeasqH8kWL
YJVR92CqFOhUizzg9g5bM+cJqRtM5geSqGriuXw6lgIpEAO3QX2dXvR26qUcYh5X/PvO8xpf/v0W
+am//lC2tqdbuZlTn6WLw4m5X6IER/uqygPUQyARuWA2gdP40zq5/apgY1ABAv9smFwxtNXuU8p8
w+xmmCAjQSnkkro2QkqNv7eR7ISqG185Tm99yjJGO1gKpgaJ5uig9TokBKEK9VM49T12S49AiTi8
bW4ZkurqiZrylUSYcdDOjHQsfXSQm8oN/EX2YkMqTZRFNWoNlZaq6cuYu7hbngVhOzKTheJY2YBa
W8ZTBgN1iRWQd4w6oPWWf2F5gZ0up5ICkYdZ0Bv4nftABc7mAmgaIEb8efVHq/FH6QAICNrEp0tZ
Z1ZNO5Wh29ROXLmTc1RgpzXluCgbY1xo/yyIoORtrpZvyyeyKy6656y6N5D8Vt/c0WvmLULaCx/E
bg6zJjwlSyexvJ8KwjMhuWGpfN5NFLaLS4fOZbBWAlVrnZN+XvF+Ju40sm0eD1zq2ZH7WPMiIQns
rJ9s2jTEGsmrbiSJLkII4X7plRMtVgrLmrtAscIBfoYwVuTFX8/9DqIgzgz10HKQ4m1oKmDN92/r
Mx8su0dTtGpExN/QjS3Vt/mkKNUisX94ybIiylirYEQlF9mv8d9fFFein3hUREM2fvsiKPoq/BFK
fJrzV6lbWe80obyk6QD2lRMBgwNx+9RE+uu86a6ef+s7gZSJxFjMDZVjfCY9KnIh9UhPgwjNGezm
9gJwRy16VPnZ82bkqvxjVvCCJcNV4Fkw8tUskeU6Cd0mFJnbq9xmqLOlWXQf1UOkyuwrj64QEvLQ
EetfrJ/ZvVIWhlkTbgEpjR1IksrvPRMYKBExp7uxH9vGkKtMzsL6ff/zBYH+GrQc5xcnDyJBqmje
ekk/u8M2zuUEaF8Yw2FgFdp0WPiV33PchirOunyidViKk/XJcX8jIjY2ekRHKScIUOfZLQlJWkz3
k+PkzjGEX9X/QxJKmHR/eusCrq3Isug2ueoGFV0mljJSpZz0+PJcKk+lhP7wVEyHKvCpEkeAVUM/
Dzt1IlmEvHNYAh3fIURSRBJByw70xS4fIqip//fEmQS/1t8ayOZFr4+r7kPMAAlQnd1qyhCxLHuh
/1+378JpMyBjKBVq3YSWZRc0dzx+QUBj9ReH14wGQfjYrNd2gZqiTproIibtg+M6eSZ2BaHKF82j
ZRu27AlQIpUkvaq7xqeqIAMN0HGiuZZwNnAU76JngwW0Sont6HOsqhj2IS7w6I0HxiqKi+BXHkqC
ag2xYb3M4W4hTZA2kxFvhzQObUoKzTCnOr9D3UUuV7qnJnKiFG2ptCmTSYSZyFxcpPsZWZIkxoY9
5SSbyCJ51++h0vDnfl07oqUDLSHVafr53JKhyc9UrOa8NSNMRAZ/u79e0wQXfByHiuCcfkK+CJYf
l2+ko9ThfEhSB9l/Juuh8iZClbrfehvS+wkWLm1/SRRzMKyoF89SB4r5H4+5NX9RMtSzKeOqcZQm
dnmoVfFRLQu8dx5FhHr+dyECfUbZVTrTlpb4lZ5BrS4ZUQOMtOTKYnmfh67qlXW35Mq4b0u5Nqys
cReAczeSopiF9KMiLCLqpRMRGPfyuhB70L4/RQfXe4uFtut7ZZ9roEDm5o06ziow4y6GI21LBF8+
mGYymSsPtqF979RVamuAwXUpSVqVSg+SRxa96w4FhKG3zyl3pAthDczAYGDHIIMWp5uQZ+8gYKhH
1J+Sl7WadJFd3SiAadOfNxl20ABsbj3HDe9Xr4G9sR7S7O5Is31PBf21D4kPBSXzM/GOaqNyxQD4
6k0RPisrgyN8S6iWnefTdkqkU/AbduJcdn/TETtUbFl7JnTUp40DSKgr/0G1QGU4XmkGS52xteZs
5tRQRM/nqZJ66/s7OUK1C8BBtUWbfvLXO2asqx1dDFTcZimN7i1deno=
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
