module series_mux(In,Sel,y_out);
input [99:0]In;
input [99:0]Sel;
output y_out;
reg [99:0]temp ;
integer i;
always@(i or Sel)
begin
if(Sel[99]==1)
begin
temp[99] = In[99];
end
else if ((Sel[99]==0))
begin
temp[99] = 0;
end
for (i=99 ; i > 0 ; i=i-1)
begin
if(Sel[i-1]==1)
temp[i-1] = In[i-1];
else if ((Sel[i-1]==0))
temp[i-1] = temp[i];
end
end
assign y_out = temp[0];
endmodule