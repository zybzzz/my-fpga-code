`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/16 09:21:56
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

always @(posedge sys_clk_i or negedge ext_rst_n ) begin
    if(!ext_rst_n)  led <= 8'hff;
    else begin
        case (switch[2:0])
            3'b 111: led <= 8'b1111_1110;
            3'b 110: led <= 8'b1111_1101;
            3'b 101: led <= 8'b1111_1011;
            3'b 100: led <= 8'b1111_0111;
            3'b 011: led <= 8'b1110_1111;
            3'b 010: led <= 8'b1101_1111;
            3'b 001: led <= 8'b1011_1111;
            3'b 000: led <= 8'b0111_1111;
            default: ;
        endcase
    end
end
endmodule
