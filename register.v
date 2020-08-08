module register (clk, rst, in, lden, out);
input clk, rst;
input [31:0] in ;
input lden;
output reg [31:0] out;

always@ (posedge clk)
begin 
if (rst ==1)
out<= 31'b0000000;
else if (lden ==1)
out <= in ;
end
endmodule
