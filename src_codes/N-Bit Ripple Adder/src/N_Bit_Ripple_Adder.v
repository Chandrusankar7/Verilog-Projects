module Data_Flow_Ripple_Adder(a,b,c1,sum,carry);
parameter n=8;
input [n-1 : 0]a;
input [n-1 : 0]b;
input c1;
wire [n-1 : 0]c;
output [n-1 : 0]sum;
output carry;
genvar i;
assign sum[0] = a[0]^b[0]^c1;
assign c[0] = (a[0]*b[0]) + (b[0]*c1) + (c1*a[0]) ;
generate
for (i=1 ; i < n ; i=i+1) begin : r1
assign sum[i] = a[i] ^ b[i] ^ c[i-1];
assign c[i] = ((a[i]*b[i]) + (b[i]*c[i-1]) + (c[i-1]*a[i]));
end
endgenerate
assign carry=c[n-1];
endmodule