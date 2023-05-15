`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 16:30:05
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
    output [7:0] led
    );

wire clk_12m5;
wire clk_25m;
wire clk_50m;
wire clk_100m;
wire sys_rst_n;

// `define SIMULATION_AT7
`ifdef SIMULATION_AT7
    `define PARAMETER_COUNTER 9
`else
    `define PARAMETER_COUNTER 23
`endif

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

led_controller #(.CNT_HIGH(`PARAMETER_COUNTER))
                    u2_led_controller(
                .clk(clk_12m5),
                .rst_n(sys_rst_n),
                .sled(led[0])
);
led_controller #(.CNT_HIGH(`PARAMETER_COUNTER + 1))
                    u3_led_controller(
                .clk(clk_25m),
                .rst_n(sys_rst_n),
                .sled(led[1])
);
led_controller #(.CNT_HIGH(`PARAMETER_COUNTER + 2))
                    u4_led_controller(
                .clk(clk_50m),
                .rst_n(sys_rst_n),
                .sled(led[2])
);
led_controller #(.CNT_HIGH(`PARAMETER_COUNTER + 3))
                    u5_led_controller(
                .clk(clk_100m),
                .rst_n(sys_rst_n),
                .sled(led[3])
);

assign led[7:4] = 4'b1111;	

endmodule
