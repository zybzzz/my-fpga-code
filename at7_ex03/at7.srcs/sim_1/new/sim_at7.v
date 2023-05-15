`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 15:05:57
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

reg sys_clk_i;
reg ext_rst_n;
wire [7:0] led;

at7     uut_at7(
            .sys_clk_i(sys_clk_i),
            .ext_rst_n(ext_rst_n),
            .led(led)
        );


initial begin
    sys_clk_i = 0;
    ext_rst_n = 0;
    #1000;
    @(posedge sys_clk_i); #2;
    ext_rst_n = 1;
    #5000;
    $finish;
end

always #10 sys_clk_i = ~sys_clk_i;

endmodule
