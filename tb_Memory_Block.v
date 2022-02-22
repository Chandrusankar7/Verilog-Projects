module tb_memory();

reg clk, rst, rd_en, wr_en, addrreg_en, datareg_en, addrbuff_en, databuff_en;
reg [7:0]data_in;
reg [7:0]data_reg;
reg [7:0]data_buff;
reg [7:0]addr_in;
reg [7:0]addr_reg;
reg [7:0]addr_buff;
wire [7:0]data_out;
wire [7:0]addr_out;


initial
begin

rst<=1'b1;
#50;

clk<=1'b1;
rst<=1'b0;
addr_reg<=8'b10101010;
data_reg<=8'b01010101;
addr_buff<=8'b11110000;
data_buff<=8'b00001111;
#50;

clk<=1'b1;
rst<=1'b0;
rd_en<=1'b1;
wr_en<=1'b0;
addrreg_en<=1'b1;
addrbuff_en<=1'b0;
#50;

clk<=1'b1;
rst<=1'b0;
rd_en<=1'b1;
wr_en<=1'b0;
datareg_en<=1'b1;
databuff_en<=1'b0;
#50;

clk<=1'b1;
rst<=1'b0;
wr_en<=1'b1;
rd_en<=1'b0;
addr_in<=8'b01010101;
addrreg_en<=1'b1;
addrbuff_en<=1'b0;
#50;

clk<=1'b1;
rst<=1'b0;
wr_en<=1'b1;
rd_en<=1'b0;
data_in<=8'b10101010;
datareg_en<=1'b1;
databuff_en<=1'b0;
#50;

clk<=1'b1;
rst<=1'b0;
rd_en<=1'b1;
wr_en<=1'b0;
addrbuff_en<=1'b1;
addrreg_en<=1'b0;
#50;

clk<=1'b1;
rst<=1'b0;
rd_en<=1'b1;
wr_en<=1'b0;
databuff_en<=1'b1;
datareg_en<=1'b0;
#50;

clk<=1'b1;
rst<=1'b0;
wr_en<=1'b1;
rd_en<=1'b0;
addr_in<=8'b01010101;
addrbuff_en<=1'b1;
addrreg_en<=1'b0;
#50;

clk<=1'b1;
rst<=1'b0;
wr_en<=1'b1;
rd_en<=1'b0;
data_in<=8'b10101010;
databuff_en<=1'b1;
datareg_en<=1'b0;
#50;

end

memory abc(.clk(clk), .rst(rst), .rd_en(rd_en), .wr_en(wr_en), .addrreg_en(addrreg_en), .datareg_en(datareg_en), .addrbuff_en(addrbuff_en), .databuff_en(databuff_en), .data_in(data_in), .data_reg(data_reg), .data_buff(data_buff), .addr_in(addr_in), .addr_reg(addr_reg), .addr_buff(addr_buff), .data_out(data_out), .addr_out(addr_out));

endmodule
