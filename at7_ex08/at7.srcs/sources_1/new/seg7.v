//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/17 14:00:48
// Design Name: 
// Module Name: seg7
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


module seg7(
        input clk,
        input rst_n,
        input[15:0] display_num,
        output reg[3:0] dtube_cs_n,
        output reg[7:0] dtube_data
    );

parameter NUM0 = 8'h3f,
          NUM1 = 8'h06,
          NUM2 = 8'h5b,
          NUM3 = 8'h4f,
          NUM4 = 8'h66,
          NUM5 = 8'h6d,
          NUM6 = 8'h7d,
          NUM7 = 8'h07,
          NUM8 = 8'h7f,
          NUM9 = 8'h6f,
          NUMA = 8'h77,
          NUMB = 8'h7c,
          NUMC = 8'h39,
          NUMD = 8'h5e,
          NUME = 8'h79,
          NUMF = 8'h71,
          NDOT = 8'h80;

parameter CSN = 4'b1111,
          CS0 = 4'b1110,
          CS1 = 4'b1101,
          CS2 = 4'b1011,
          CS3 = 4'b0111;

reg[3:0] current_display_num;
reg[7:0] div_cnt;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)  div_cnt <= 8'd0;
    else div_cnt <= div_cnt + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)  current_display_num <= 4'h0;
    else begin
        case(div_cnt[7:6])
            2'b00: current_display_num <= display_num[3:0];//display cs0
            2'b01: current_display_num <= display_num[7:4];//display cs1
            2'b10: current_display_num <= display_num[11:8];//display cs2
            2'b11: current_display_num <= display_num[15:12];//display cs3
            // ff only appear once so this way maybe good
            // 8'hff: current_display_num <= display_num[3:0];
			// 8'h3f: current_display_num <= display_num[7:4];
			// 8'h7f: current_display_num <= display_num[11:8];
			// 8'hbf: current_display_num <= display_num[15:12];
            default: ;
        endcase
    end 
end

always @(posedge clk or negedge rst_n)
	if(!rst_n) dtube_data <= NUM0;
	else begin
		case(current_display_num) 
			4'h0: dtube_data <= NUM0;
			4'h1: dtube_data <= NUM1;
			4'h2: dtube_data <= NUM2;
			4'h3: dtube_data <= NUM3;
			4'h4: dtube_data <= NUM4;
			4'h5: dtube_data <= NUM5;
			4'h6: dtube_data <= NUM6;
			4'h7: dtube_data <= NUM7;
			4'h8: dtube_data <= NUM8;
			4'h9: dtube_data <= NUM9;
			4'ha: dtube_data <= NUMA;
			4'hb: dtube_data <= NUMB;
			4'hc: dtube_data <= NUMC;
			4'hd: dtube_data <= NUMD;
			4'he: dtube_data <= NUME;
			4'hf: dtube_data <= NUMF;
			default: ;
		endcase
	end

always @(posedge clk or negedge rst_n)
	if(!rst_n) dtube_cs_n <= CSN;
	else begin
		case(div_cnt[7:6])
			2'b00: dtube_cs_n <= CS0;
			2'b01: dtube_cs_n <= CS1;
			2'b10: dtube_cs_n <= CS2;
			2'b11: dtube_cs_n <= CS3;
			default:  dtube_cs_n <= CSN;
		endcase
	end


endmodule
