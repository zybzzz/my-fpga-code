
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 14:20:07
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
    output reg[7:0] led
    );

// `define SIMULATION_AT7

`ifdef SIMULATION_AT7
    parameter  MAX_CNT = 24'd10;
`else 
    parameter  MAX_CNT = 24'd9_999_999;
`endif

reg[23:0] cnt;

always @(posedge sys_clk_i or negedge ext_rst_n ) begin
    if(!ext_rst_n)  cnt <= 24'd0;
    else if(cnt < MAX_CNT)  cnt <= cnt + 1'b1;
    else cnt <= 24'b0;
end

always @(posedge sys_clk_i or negedge ext_rst_n ) begin
    if(!ext_rst_n)  led <= 8'b1111_1110;
    else if(cnt == MAX_CNT)  led <= {led[6:0], led[7]};
    else;
end




endmodule
