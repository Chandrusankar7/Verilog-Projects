module alu (a, b, ALU_OUT, choice);
input [2:0]choice;
input [7:0] a, b;
output reg [7:0] ALU_OUT;
parameter add=3'b000, ls=3'b001, and_8_bit=3'b010, exor=3'b011, comp=3'b100;
always@ (choice)
begin
case (choice)
add: ALU_OUT = a+b; //Addition
ls: ALU_OUT = a<<1; //Left shift
and_8_bit: ALU_OUT = a & b; //AND operation
exor: ALU_OUT = a ^ b; // EXOR operation
comp: //Comparator
begin
if (a>b)
ALU_OUT = 1'b1;
else
ALU_OUT=1'b0;
end
default: ALU_OUT = 0;
endcase
end
endmodule
