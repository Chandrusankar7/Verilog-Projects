module Bill_Calculator(set_drink, cash_in, cash_low, cash_bal, coffee_en, tea_en);
input set_drink;
input [6:0]cash_in;
output coffee_en;
output tea_en;
output cash_low;
output [6:0] cash_bal;
reg [6:0] cash_bal1;
reg coffee_en1;
reg tea_en1;
reg cash_low1;
always@(set_drink, cash_in)
begin
coffee_en1 = 1'b0;
tea_en1 = 1'b0;
cash_low1 = 1'b0;
cash_bal1 = 7'b0000000;
if (set_drink == 1'b0)
begin
coffee_en1=1'b1;
tea_en1=1'b0;
if (cash_in>7'b0110010)
cash_bal1= (cash_in - 7'b0110010);
else if (cash_in<7'b0110010)
cash_low1=1'b1;
end
else if (set_drink == 1'b1)
begin
coffee_en1=1'b0;
tea_en1=1'b1;
if (cash_in>7'b0100011)
cash_bal1= (cash_in - 7'b0100011);
else if (cash_in<7'b0100011)
cash_low1=1'b1;
end
end
assign cash_bal = cash_bal1;
assign coffee_en = coffee_en1;
assign tea_en = tea_en1;
assign cash_low = cash_low1;
endmodule