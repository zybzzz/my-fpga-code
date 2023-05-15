`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 12:46:16
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
reg [7:0] switch;
wire [7:0] led;

at7 uut_at7 (
    .sys_clk_i(sys_clk_i),
    .ext_rst_n(ext_rst_n),
    .switch(switch),
    .led(led)
    );

initial begin
    sys_clk_i = 0;
    ext_rst_n = 0;
    switch = 8'hfe;
    #1000;
    @(posedge sys_clk_i);   #2;
    ext_rst_n = 1;
    repeat(10) begin
        @(posedge sys_clk_i);   #2;
        switch <= {switch[6:0], switch[7]}; 
    end
    #1000;
    $finish;

end

always #10 sys_clk_i = ~sys_clk_i;

endmodule
