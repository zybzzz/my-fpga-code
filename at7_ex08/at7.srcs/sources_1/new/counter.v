// add 1 per secomd
module counter(
            input clk,
            input rst_n,
            output reg[15:0] display_num
        );

// `define SIMULATION_AT7
`ifdef SIMULATION_AT7
    `define MAX_CNT 25'd9999
`else
    `define MAX_CNT 25'd24_999_999
`endif

reg[24:0] timer_cnt;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)  timer_cnt <= 25'd0;
    else if(timer_cnt < `MAX_CNT) timer_cnt <= timer_cnt + 1'b1;
    else timer_cnt <= 25'd0;
end

wire timer_1s_flag = (timer_cnt == `MAX_CNT);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) display_num <= 16'd0;
    else if(timer_1s_flag) display_num <= display_num + 1'b1;
    else;
end

endmodule

