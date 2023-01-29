module Test_Bench_Data_Flow_Ripple_Adder();
reg [31:0]a;
reg [31:0]b;
reg c1;
wire [31:0]sum;
wire carry;
Data_Flow_Ripple_Adder df(.a(a),.b(b),.c1(c1),.sum(sum),.carry(carry));
defparam df.n=32;
initial
begin
repeat(10)
begin
a = $random;
b = $random;
c1 = $random;
#50;
end
end
Endmodule