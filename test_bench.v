`timescale 1ns/1ps
module Testbench;
reg clk_t, rst_t, go_t;
reg [31:0] in1_t;
reg [31:0] in2_t;
wire [31:0] out_t;
wire done_t;
gcd_machine GCD( .clk(clk_t), .rst(rst_t), .go(go_t), .in1(in1_t), .in2(in2_t), .out(out_t), .done(done_t));
always 
begin 
clk_t <=0;
#25;
clk_t <=1;
#25;
end
initial
begin
$dumpfile ("dump.vcd");
$dumpvars;
$dumpon;
#4000 $dumpoff;
end

initial
begin

rst_t <=1;
go_t <=0;
#100
rst_t <=0;

in1_t <=16;
in2_t <=42;
#100;
go_t <=1;
while (done_t ==1)
begin
#50; end
go_t <= 0;
while (done_t !==1)
begin #50; end
$monitor ("done =%b out =%b", done_t, out_t);

#2000; $finish;
end

endmodule

