module fsm_11011 (clk, rst, data_in, data_out);
input clk, rst, data_in;
output reg data_out;

parameter IDLE=3'b000, GOT1=3'b001, GOT11=3'b010, GOT110=3'b011, GOT1101=3'b100, GOT11011=3'b101;
reg [2:1] ps, ns;

always @(posedge clk)
    begin
    if (rst)
        begin
        ps<=IDLE;
        data_out<=1'b0;
        end
        
    else
        ps<=ns;
    end
    
 always @(ps, data_in)
    begin
    case (ps)
        IDLE: begin
              if (data_in==1'b0)
                ns<=IDLE;
              
              else
                ns<=GOT1;
              end  
              
        GOT1: begin
              if (data_in==1'b0)
                ns<=IDLE;
              
              else
                ns<=GOT11;
              end      
              
        GOT11: begin
              if (data_in==1'b0)
                ns<=GOT110;
              
              else
                ns<=GOT11;
              end    
              
        GOT110: begin
              if (data_in==1'b0)
                ns<=IDLE;
              
              else
                ns<=GOT1101;
              end    
              
        GOT1101: begin
              if (data_in==1'b0)
                begin
                data_out<=1'b0;
                ns<=IDLE;
                end
              
              else
                begin
                data_out<=1'b1;
                ns<=GOT11011;
                end
              end   
              
        GOT11011: begin
              if (data_in==1'b0)
                ns<=GOT110;
              
              else
                ns<=GOT11;
              end                                                               
    endcase
    end
endmodule