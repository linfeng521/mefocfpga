-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Wed Oct  7 17:03:43 2026
-- Host        : DESKTOP-NP6HTQ7 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/MeData/foccode/mefpgafoc/fpga_foc_motorcontrol/MeFocFPGA/prj/vio_7020/vio_7020_stub.vhdl
-- Design      : vio_7020
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_7020 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out8 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out9 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out11 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out12 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out13 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out14 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out15 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out16 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out17 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out18 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out19 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end vio_7020;

architecture stub of vio_7020 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[15:0],probe_in1[15:0],probe_in2[15:0],probe_in3[0:0],probe_in4[0:0],probe_out0[0:0],probe_out1[15:0],probe_out2[15:0],probe_out3[31:0],probe_out4[31:0],probe_out5[31:0],probe_out6[0:0],probe_out7[15:0],probe_out8[0:0],probe_out9[15:0],probe_out10[31:0],probe_out11[31:0],probe_out12[31:0],probe_out13[0:0],probe_out14[31:0],probe_out15[31:0],probe_out16[31:0],probe_out17[0:0],probe_out18[0:0],probe_out19[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2020.2";
begin
end;
