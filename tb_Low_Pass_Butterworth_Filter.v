`timescale 1ns / 1ps

module FIR_TB; 

parameter N = 16;

reg clk, reset;
reg [N-1:0] data_in;
reg [4:0] Address; 
reg [N-1:0] RAMM [31:0]; 
wire [N-1:0] data_out; 

FIR_Filter inst0(clk, reset, data_in, data_out);

// input sine wave data
//RAMM=$fopenr("E:\AVV\Sem 1\DCS\music.data");
//RAMM = $readmemb ("E:\AVV\Sem 1\DCS\music.data", "r");

initial
begin
RAMM [0] <= 16'b0000000000000011; 
RAMM [1] <= 16'b0000000000011111;
RAMM [2] <= 16'b0000000000111111;
RAMM [3] <= 16'b0000000001111111;
RAMM [4] <= 16'b0000000001111111;
RAMM [5] <= 16'b0000000001111111;
RAMM [6] <= 16'b0000000001111111; 
RAMM [7] <= 16'b0000000011111111;
RAMM [8] <= 16'b0000000011111111;
RAMM [9] <= 16'b0000000001111111;
RAMM [10] <= 16'b0000000011111111;
RAMM [11] <= 16'b0000000001111111;
RAMM [12] <= 16'b0000000001111111; 
RAMM [13] <= 16'b0000000001111111;
RAMM [14] <= 16'b0000000000111111;
RAMM [15] <= 16'b0000000000011111;
RAMM [16] <= 16'b0000000000000110;
RAMM [17] <= 16'b1111111111100000;
RAMM [18] <= 16'b1111111111000000; 
RAMM [19] <= 16'b1111111110000000;
RAMM [20] <= 16'b1111111110000000;
RAMM [21] <= 16'b1111111110000000;
RAMM [22] <= 16'b1111111110000000;
RAMM [23] <= 16'b1111111110000000;
RAMM [24] <= 16'b1111111110000000; 
RAMM [25] <= 16'b1111111110000000;
RAMM [26] <= 16'b1111111110000000;
RAMM [27] <= 16'b1111111111100000;
RAMM [28] <= 16'b1111111111110000;
RAMM [29] <= 16'b1111111111111000;
RAMM [30] <= 16'b1111111111111111;
RAMM [31] <= 16'b1111111111111111;
end
// Create the RAM


// create a clock
initial 
clk = 0;
always 
#10 clk = ~ clk;  

// Read RAMM data and give to design
always@(posedge clk)
    data_in <= RAMM[Address]; 
    
// Address counter
initial
Address = 1; 
always@(posedge clk)
begin
    if (Address == 31)
        Address = 0; 
    else
        Address = Address + 1; 
end     

endmodule