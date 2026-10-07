`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/24 11:49:52
// Design Name: 
// Module Name: ip_clk_wiz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ip_clk_wiz(
    input sys_clk,
    input sys_rst_n,
    output clk_100m,
    output clk_100m_180deg,
    output clk_50m,
    output clk_25m,
    output locked
    );
    
    
    wire locked;
    
  
    
    clk_wiz_1 clk_wiz_1
   (
    // Clock out ports
    .clk_out1(clk_100m),     // output clk_out1
    .clk_out2(clk_100m_180deg),     // output clk_out2
    .clk_out3(clk_50m),     // output clk_out3
    .clk_out4(clk_25m),     // output clk_out4
    // Status and control signals
    .reset(~sys_rst_n), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk)      // input clk_in1
);
endmodule
