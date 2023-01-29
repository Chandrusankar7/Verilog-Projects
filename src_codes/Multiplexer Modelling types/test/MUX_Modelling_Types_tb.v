module testbench_MUX();
reg sel0,sel1,i1,i2,i3,i4;
wire y_out;
initial
begin
sel0 = 1'b1;
sel1 = 1'b1;
i1 = 1'b1;
i2 = 1'b1;
i3 = 1'b0;
i4 = 1'b1;
end
initial
begin
sel0 = 1'b0 ;sel1 = 1'b0;
#10
sel0 = 1'b0 ;sel1 = 1'b1;
#10
sel0 = 1'b1 ;sel1 = 1'b0;
#10
sel0 = 1'b1 ;sel1 = 1'b1;
#10;
end
circuit1 bh(.sel0(sel0),.sel1(sel1),.y_out(y_out),.i1(i1),.i2(i2),.i3(i3),.i4(i4));
circuit2 bh(.sel0(sel0),.sel1(sel1),.y_out(y_out),.i1(i1),.i2(i2),.i3(i3),.i4(i4));
circuit3 bh(.sel0(sel0),.sel1(sel1),.y_out(y_out),.i1(i1),.i2(i2),.i3(i3),.i4(i4));
Endmodule