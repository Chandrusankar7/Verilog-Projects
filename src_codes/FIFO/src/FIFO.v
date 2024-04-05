module myfifo(clk, rst, rd_en, wr_en, data_in, data_out, FULL, EMPTY);
input clk, rst, rd_en, wr_en;
output FULL, EMPTY;
parameter W=4; //Width size
parameter D=4; //Depth size
input [W-1:0]data_in;
output reg [W-1:0]data_out;
reg [D-1:0] rd_ptr, wr_ptr;
reg [W-1:0]fifo[2^D-1:0]; //4-bit length and 16 locations for 4-bit address depth
integer i;

assign EMPTY = (rd_ptr == wr_ptr)?1:0; //Empty condition
assign FULL = ((rd_ptr == wr_ptr+1) || (rd_ptr==4'b0000 && wr_ptr==4'b1111)) ? 1:0; //Full with rollover

always@(posedge clk)
    begin
    if (rst)
        begin
        for (i=0; i<(2^D); i=i+1)
            fifo[i]<=4'b0000;
        rd_ptr<=4'b0000;
        wr_ptr<=4'b0000;
        data_out<=4'b0000;                
        end
    
    else
        begin
        if (rd_en==1'b1 && !EMPTY) //FIFO Read
            begin
            data_out<=fifo[rd_ptr];
            rd_ptr = rd_ptr+1;
            end
            
        if (wr_en==1'b1 && !FULL) //FIFO Write
            begin
            fifo[rd_ptr]<=data_in;
            wr_ptr = wr_ptr+1;
            end            
        end
    end


endmodule