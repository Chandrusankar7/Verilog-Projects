// Code your testbench here
// or browse Examples
module tb_fifo;
reg clk, rst, rd_en, wr_en;
wire FULL, EMPTY;
parameter W=4; //Width size
parameter D=4; //Depth size
reg [W-1:0]data_in;
wire [W-1:0]data_out;
  
always 
  begin
    clk<=1'b1;
    #10;
    clk<=1'b0;
    #10;
  end
  
initial 
  begin
    rd_en=1'b1;//Checking EMPTY condition
    repeat(16)
      begin
        wr_en=1'b1;//Filling all the address
        data_in=$random;
        #10;
      end
    wr_en=1'b1;//Checking FULL condition
    data_in=$random;
    #10;
    
    repeat(10)
      begin
        rd_en=$random;//Random operations check
        wr_en=$random;
        data_in=$random;
        #10;
      end
  end

  myfifo inst0(.clk(clk), .rst(rst), .rd_en(rd_en), .wr_en(wr_en), .data_in(data_in), .data_out(data_out), .FULL(FULL), .EMPTY(EMPTY));
endmodule
