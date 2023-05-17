`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/17 14:00:02
// Design Name: 
// Module Name: at7
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


module at7(
    input sys_clk_i,
    input ext_rst_n,
    output[3:0] dtube_cs_n,
    output[7:0] dtube_data
    );


wire clk_12m5;
wire clk_25m;
wire clk_50m;
wire clk_100m;
wire sys_rst_n;

  clk_wiz_0 	u1_clk_wiz_0
   (
   // Clock in ports
    .clk_in1(sys_clk_i),      // input clk_in1
    // Clock out ports
    .clk_out1(clk_12m5),     // output clk_out1
    .clk_out2(clk_25m),     // output clk_out2
    .clk_out3(clk_50m),     // output clk_out3
    .clk_out4(clk_100m),     // output clk_out4
    // Status and control signals
    .reset(!ext_rst_n), // input reset
    .locked(sys_rst_n));      // output locked


wire[15:0]  display_num;
counter     uut_counter(
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .display_num(display_num)
);

seg7        uut_seg7(
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .display_num(display_num),
    .dtube_cs_n(dtube_cs_n),
    .dtube_data(dtube_data)
);

endmodule