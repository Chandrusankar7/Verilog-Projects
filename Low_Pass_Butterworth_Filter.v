`timescale 1ns / 1ps

module FIR_Filter(clk, reset, data_in, data_out);

parameter N = 16;

input clk, reset;
input [N-1:0] data_in;
output reg [N-1:0] data_out; 


wire [4:0] n0 =  5'b01000; 
wire [4:0] n1 =  5'b10100; 
wire [4:0] n2 =  5'b10001; 
wire [4:0] n3 =  5'b00101;
wire [4:0] d0 =  5'b00001; 
wire [4:0] d1 =  5'b00001; 
wire [4:0] d2 =  5'b00001; 
wire [4:0] d3 =  5'b00001;
wire [N-1:0] x1, x2, x3; 

// Create delays i.e x[n-1], x[n-2], .. x[n-N]
// Instantiate D Flip Flops
DFF DFF0(clk, 0, data_in, x1); // x[n-1]
DFF DFF1(clk, 0, x1, x2);      // x[n-2]
DFF DFF2(clk, 0, x2, x3);      // x[n-3] 

//  Multiplication
wire [N-1:0] Mul0, Mul1, Mul2, Mul3;  
assign Mul0 = data_in * n0; 
assign Mul1 = x1 * n1;  
assign Mul2 = x2 * n2;  
assign Mul3 = x3 * n3;
assign Mul4 = data_in * d0; 
assign Mul5 = x1 * d1;  
assign Mul6 = x2 * d2;  
assign Mul7 = x3 * d3;
 
// Addition operation
wire [N-1:0] Add_final; 
assign Add_num = Mul0 + Mul1 + Mul2 + Mul3;
assign Add_den = Mul4 + Mul5 + Mul6 + Mul7; 
assign Add_final = Add_num;

// Final calculation to output 
always@(posedge clk)
data_out <= Add_final; 

endmodule


module DFF(clk, reset, data_in, data_delayed);
parameter N = 16;
input clk, reset;
input [N-1:0] data_in;
output reg [N-1:0] data_delayed; 

always@(posedge clk, posedge reset)
begin
    if (reset)
    data_delayed <= 0;
    else
    data_delayed <= data_in; 
    
end

endmodule
