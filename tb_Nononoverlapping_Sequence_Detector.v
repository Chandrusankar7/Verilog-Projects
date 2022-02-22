module seqtb;
reg sin,clk,reset;
wire y;
det d1(sin,clk,reset,y);
initial
begin
clk = 1'b0;
repeat (401)
#5 clk = ~clk;
end
initial
begin
$monitor($time,"sin=%b,clk=%b,reset=%b,y=%b",sin,clk,reset,y);
reset = 1;sin=0;
#10 reset =0;
#10 sin = 1;
#10 sin = 0;
#10 sin = 1;
#10 sin = 1;
#10 sin = 0;
#10 sin = 0;
#10 sin = 1;
#10 sin = 1;
#10 sin = 1;
#10 sin = 1;
end
initial
begin
   $dumpfile ("seqtb.vcd");
   $dumpvars (0,seqtb);
end
endmodule
