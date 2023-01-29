module Tb_series_mux();
reg [99:0] In;
wire y_out;
reg [99:0]Sel;
integer i;
initial
begin
In = $random;
#200;
end
initial
begin
Sel =1;
#2;
for(i=0 ; i<100 ;i = i+1) begin
Sel = Sel << 1;
#2;
end
end
series_mux abc(.In(In),.Sel(Sel),.y_out(y_out));
endmodule