module tb_count;
reg [15:0] A;
wire [4:0] ones;
initial
begin
repeat (50)
begin
A=$random;
#50;
end
end
count_of_zeroone abc (.A(A), .ones(ones));
endmodule