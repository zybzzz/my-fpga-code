module led_controller (
    input clk,
    input rst_n,
    output sled
);

parameter CNT_HIGH = 24;

reg [(CNT_HIGH - 1):0] cnt;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)  cnt <= 0;
    else cnt <= cnt + 1'b1;
end

assign sled = cnt[CNT_HIGH - 1];
    
endmodule