module count_of_zeroone(A,ones);
input [15:0] A;
output [4:0] ones;
reg [4:0] ones1;
integer i;
always@(A)
begin
ones1 = 0;
for(i=0;i<16;i=i+1)
if((A[i] == 1'b0) && (A[i+1] == 1'b1))
ones1 = ones1 + 1;
end
assign ones=ones1;
endmodule