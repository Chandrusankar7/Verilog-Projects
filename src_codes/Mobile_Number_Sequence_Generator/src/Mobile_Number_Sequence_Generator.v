module jkff(clk, rst, j, k, q);
input clk, rst, j, k;
output reg q;
always @(negedge clk)
begin
if (rst==1'b1)
q=0;
else
begin
case({j,k})
2'b00: q<=q;
2'b01: q<=1'b0;
2'b10: q<=1'b1;
2'b11: q<=~q;
endcase
end
end
endmodule
module mobile(clk, rst, yout);
input clk, rst;
wire [3:0]j,k;
wire [3:0] q;
output [3:0] yout;
assign j[3]=(~q[2] | (q[1]&~q[0]));
assign k[3]=(~q[2]&~q[1]);
assign j[2]=(q[3] & ~q[1] & ~q[0] );
assign k[2]=(q[3] | ~q[0]);
assign j[1]=(q[3] & ~q[2]);
assign k[1]=(1'b1);
assign j[0]=((~q[3]&q[2]&~q[1]) | (q[3]&~q[2]&~q[1]));
assign k[0]=((q[2]&~q[1]) | (q[3]&q[1]) | (~q[2]&q[1]));
jkff jka(clk, rst, j[0], k[0], q[0]);
jkff jkb(clk, rst, j[1], k[1], q[1]);
jkff jkc(clk, rst, j[2], k[2], q[2]);
jkff jkd(clk, rst, j[3], k[3], q[3]);
assign yout[3]=q[3];
assign yout[2]=q[2];
assign yout[1]=q[1];
assign yout[0]=q[0];
endmodule
