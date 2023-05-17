`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/17 15:51:50
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
module sim_at7();

reg sys_clk_i;	
reg ext_rst_n;	
wire[3:0] dtube_cs_n;	
wire[7:0] dtube_data;	
	
at7		uut_at7(
			.sys_clk_i(sys_clk_i),	
			.ext_rst_n(ext_rst_n),	
			.dtube_cs_n(dtube_cs_n),
			.dtube_data(dtube_data)
		);		

initial begin
	sys_clk_i = 0;
	ext_rst_n = 0;	
	#1000;
	@(posedge sys_clk_i); #2;
	ext_rst_n = 1;	
	#100_000_000;	
	$finish;
end	
	
always #10 sys_clk_i = ~sys_clk_i;	//50MHzʱ�Ӳ���

endmodule
