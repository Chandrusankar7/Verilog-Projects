module Tb_fsm();
reg clk, rst, data_in;
wire reg data_out;

always 
	begin
	clk<=1'b1;
	#10;
	clk<=1'b0;
	end

initial begin
	data_in=$random;
	#10;
	end

fsm_11011 inst0(.clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out));
endmodule