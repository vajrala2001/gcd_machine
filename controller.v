module controller (clk, rst, go, a_gt_b, a_eq_b, a_lt_b,  a_ld, a_sel, b_ld,  b_sel, output_en, done);
input clk, rst;
input go;
input a_gt_b, a_eq_b, a_lt_b;
output reg a_sel, b_sel, a_ld, b_ld, done, output_en;
reg [2:0] cState, nState;

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter S6 = 3'b110;
parameter S7 = 3'b111;

always@(rst or posedge clk)
begin 
if(rst ==1)
cState <=S0;
else
cState <= nState;
end

always@(go or a_gt_b or a_lt_b or a_eq_b or cState)

begin 
 case (cState)

S0: begin 
if (go == 0) nState = S0;
else nState = S1;
end

S1: nState = S2;
S2: nState = S3;
S3 :begin 
if (a_gt_b == 1)
nState = S4;
else if (a_lt_b == 1)
nState = S5 ;
else nState = S7;
end
S4: nState =S6;
S5 : nState =S6;
S6 : nState = S3;
S7 : nState = S0;
default : nState =S0;
endcase
end

always @ (go or a_gt_b or a_lt_b or a_eq_b or cState)

begin
case (cState)

S0:
begin
a_sel = 0;
b_sel = 0;
a_ld = 0;
b_ld = 0;
done = 1;
output_en =0;
end
S1:
begin
a_sel = 1;
b_sel = 1;
a_ld = 1;
b_ld = 1;
done = 0;
output_en =0;
end

S2:
begin
a_sel = 0;
b_sel = 0;
a_ld = 0;
b_ld = 0;
done = 0;
output_en =0;
end

S3:
begin
a_sel = 0;
b_sel = 0;
a_ld = 0;
b_ld = 0;
done = 0;
output_en =0;
end

S4:

begin
a_sel = 0;
b_sel = 0;
a_ld = 1;
b_ld = 0;
done = 0;
output_en =0;
end

S5:

begin
a_sel = 0;
b_sel = 0;
a_ld = 0;
b_ld = 1;
done = 0;
output_en =0;
end

S6:
begin
a_sel = 0;
b_sel = 0;
a_ld = 0;
b_ld = 0;
done = 0;
output_en =0;
end

S7:

begin
a_sel = 0;
b_sel = 0;
a_ld = 0;
b_ld = 0;
done = 1;
output_en =1;
end

default:

begin
a_sel = 0;
b_sel = 0;
a_ld = 0;
b_ld = 0;
done = 0;
output_en =0;
end

endcase
end

endmodule
