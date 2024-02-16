`timescale 1ns / 1ps
module setup(clk, rst, uff0_i, uff4_o, i1, i2);
input clk, rst, uff0_i, i1, i2;
output uff4_o;
wire q0, q1, q2, q3;

dff uff0(clk, rst, uff0_i, q0);
not uff1(q1, q0);
nand uff2(q2, i1, q1);
and uff3(q3, q1, i2);
or uff4(q4, q2, q3);
dff uff5(clk, rst, q4, uff4_o);

endmodule


module dff(clk,rst,D,Q);
input D; // Data input 
input clk, rst; // clock input 
output reg Q; // output Q 
always @(posedge clk) 
begin
if (rst)
 Q <=0;
else
 Q <= D; 
end 
endmodule 