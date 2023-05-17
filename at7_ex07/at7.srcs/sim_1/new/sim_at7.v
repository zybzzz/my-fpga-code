`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/17 09:42:16
// Design Name: 
// Module Name: sim_at7
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


module sim_at7();
reg sys_clk_i;
reg ext_rst_n;
reg [3:0] key_h;
wire [7:0] led;

at7 uut_at7(
        .sys_clk_i(sys_clk_i),
        .ext_rst_n(ext_rst_n),
        .key_h(key_h),
        .led(led)
    );


initial begin
    sys_clk_i = 0;
    ext_rst_n = 0;
    key_h = 4'b1111;
    #1000;
    @(posedge sys_clk_i); #2;
    ext_rst_n = 1;
    @(posedge sys_clk_i); #2;
    key_h[0] = 1'b0;
    #1_000_000; //1ms
    key_h[0] = 1'b1;
    #5_000_000;
    key_h[0] = 1'b0;
    #3_000_000;
    key_h[0] = 1'b1;

    key_h[0] = 1'b0;
    #1_000_000; //1ms
    key_h[0] = 1'b1;
    #5_000_000;
    key_h[0] = 1'b0;
    #3_000_000;
    key_h[0] = 1'b1;
    #3_000_000;
    key_h[0] = 1'b0;
    #500_000_000;
    key_h[0] = 1'b1;
    #3_000_000;
    key_h[0] = 1'b0;
    #3_000_000;
    key_h[0] = 1'b1;
    
    #150_000_000;
    $finish;
end

always #10 sys_clk_i = ~sys_clk_i;

endmodule
