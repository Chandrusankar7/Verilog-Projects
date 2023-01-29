module memory (clk, rst, rd_en, wr_en, addrreg_en, datareg_en, addrbuff_en, databuff_en, data_in, data_reg, data_buff, addr_in, addr_reg, addr_buff, data_out, addr_out);
input clk, rst, rd_en, wr_en, addrreg_en, datareg_en, addrbuff_en, databuff_en;
input [7:0]data_in;
input [7:0]data_reg;
input [7:0]data_buff;
input [7:0]addr_in;
input [7:0]addr_reg;
input [7:0]addr_buff;
output [7:0]data_out;
output [7:0]addr_out;
reg [7:0]data_out1;
reg [7:0]addr_out1;
reg [7:0]data_in1;
reg [7:0]data_reg1;
reg [7:0]data_buff1;
reg [7:0]addr_in1;
reg [7:0]addr_reg1;
reg [7:0]addr_buff1;


always@(posedge clk or posedge rst)
begin
	assign addr_reg1=addr_reg;
	assign data_reg1=data_reg;
	assign addr_buff1=addr_buff;
	assign data_buff1=data_buff;
	assign data_in1=data_in;
	assign addr_in1=addr_in;
	if ((rst==1'b0) && (clk==1'b1)) 
	begin
		if ((rd_en==1'b1) && (addrreg_en==1'b1)) // Address register read		
			addr_out1<=8'b10101010;
		else if ((rd_en==1'b1) && (datareg_en==1'b1)) // Data register read		
			data_out1<=8'b01010101;
		else if ((wr_en==1'b1) && (addrreg_en==1'b1)) // Address register write		
			addr_reg1<=addr_in1;
		else if ((wr_en==1'b1) && (datareg_en==1'b1)) // Dara register write
			data_reg1<=data_in1;
		else if ((rd_en==1'b1) && (addrbuff_en==1'b1)) // Address buffer read		
			addr_out1<=8'b11110000;
		else if ((rd_en==1'b1) && (databuff_en==1'b1)) // Data buffer read
			data_out1<=8'b00001111;
		else if ((wr_en==1'b1) && (addrbuff_en==1'b1)) // Address buffer write
			addr_buff1<=addr_in1;
		else if ((wr_en==1'b1) && (datareg_en==1'b1)) // Dara buffer write
			data_buff1<=data_in1;
	end
end

assign data_out=8'b10101010;
#50;
assign addr_out=8'b01010101;
#50;
assign data_out=8'b11110000;
#50;
assign addr_out=8'b01010101;
#50;
assign data_reg=8'b00001111;
assign data_buff=data_buff1;
assign addr_reg=addr_reg1;
assign addr_buff=addr_buff1;

endmodule