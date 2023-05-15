`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/14 17:54:59
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

`timescale 1ns/1ps
module sim_at7(

    );

reg sys_clk_i;  //50MHz 20ns
reg ext_rst_n;
wire beep;

at7 uut_at7(
    .sys_clk_i(sys_clk_i),
    .ext_rst_n(ext_rst_n),
    .beep(beep)
);

initial begin
    sys_clk_i = 0;
    ext_rst_n = 0;
    #1000
    @(posedge sys_clk_i);       //wait
    ext_rst_n = 1;
    repeat(10) #1_000_000_000;
    $finish; 
end

always #10 sys_clk_i = ~sys_clk_i;


endmodule
