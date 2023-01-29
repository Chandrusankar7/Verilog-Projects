module circuit1(sel0,sel1,sel2,y_out,i1,i2,i3,i4);
input sel0,sel1,sel2,i1,i2,i3,i4;
output y_out;
assign y_out = sel0? (sel1? i1 : i2 ) : (sel2? i3 : i4);
endmodule

module circuit2(sel0,sel1,y_out,i1,i2,i3,i4);
input sel0,sel1,i1,i2,i3,i4;
output y_out;
assign y_out = sel0?i1:(sel1?i2:(i3|i4));
endmodule

module circuit3(sel0,sel1,y_out,i1,i2,i3,i4);
input sel0,sel1,i1,i2,i3,i4;
output y_out;

always @(sel0 or sel1 or i1 or i2 or i3 or i4)
begin

case ([sel0,sel1]):
begin
00: y_out = i1;
01: y_out = i2;
10: y_out = i3;
11: y_out = i4;
end

end
endmdule
