`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/17 09:17:51
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
    input [3:0] key_h,
    output reg[7:0] led
    );


wire key;
reg[3:0] keyr;

assign key = key_h[0] & key_h[1] & key_h[2] & key_h[3];
always @(posedge sys_clk_i or negedge ext_rst_n) begin
    if(!ext_rst_n)  keyr <= 4'b1111;
    else keyr <= {keyr[2:0], key};
end

wire key_neg = ~keyr[2] & keyr[3];
wire key_pos = keyr[2] & ~keyr[3];

reg[19:0] cnt;

// to judge whether status is stable
always @(posedge sys_clk_i or negedge ext_rst_n) begin
    if(!ext_rst_n) cnt <= 20'd0;
    else if(key_pos || key_neg) cnt <= 20'd0;
    else if(cnt < 20'd999_999) cnt <= cnt + 1'b1;
    else cnt <= 20'd0;
end

reg[3:0] key_halue[1:0];
// when status is stable, to anquire the signal
always @(posedge sys_clk_i or negedge ext_rst_n) begin
    if(!ext_rst_n) begin
        key_halue[0] <= 4'b1111;
        key_halue[1] <= 4'b1111;
    end
    else begin
        key_halue[1] <= key_halue[0];
        if(cnt == 20'd999_999) key_halue[0] <= key_h;
        else ;
    end
end

wire[3:0] key_press = key_halue[1] & ~key_halue[0];
always @(posedge sys_clk_i or negedge ext_rst_n) begin
    if(!ext_rst_n) begin
        led <= 8'hff;
    end
    else if(key_press[0]) led[0] <= ~led[0];
    else if(key_press[1]) led[1] <= ~led[1];
    else if(key_press[2]) led[2] <= ~led[2];
    else if(key_press[3]) led[3] <= ~led[3];
    else;
end

endmodule




