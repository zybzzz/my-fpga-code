`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/14 17:38:33
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
    input sys_clk_i,    //50MHZ 20ns
    input ext_rst_n,
    output reg beep
);

reg [27:0] cnt;

always @(posedge sys_clk_i or negedge ext_rst_n) begin
    if(!ext_rst_n)  cnt <= 28'd0;
    else if(cnt < 28'd49_999_999) cnt <= cnt + 1'b1;
    else cnt <= 28'd0;
end

always @(posedge sys_clk_i or negedge ext_rst_n) begin
    if(!ext_rst_n)  beep <= 1'b0;
    else if(cnt < 28'd24_999_999) beep <= 1'b1;
    else beep <= 1'b0;
end

endmodule
