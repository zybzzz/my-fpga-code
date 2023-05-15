`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 12:35:45
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
    input [7:0] switch,
    output reg[7:0] led
    );

always @(posedge sys_clk_i or negedge ext_rst_n) begin
    if(!ext_rst_n)  led <= 8'hff;
    else led <= switch;
end
endmodule
