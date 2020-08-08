module datapath (clk, rst, in1, in2, a_sel, b_sel, a_ld, b_ld, a_gt_b, a_eq_b, a_lt_b, output_en, out);
input clk, rst;
input a_sel, b_sel, a_ld, b_ld;
output a_gt_b, a_eq_b, a_lt_b;
input output_en;
output [31:0] out;
input [31:0] in1, in2;

wire [31:0] tain, tbin, taout, tbout, t1,t2;

subtractor S1(.in1(taout), .in2(tbout), .out(t1));
subtractor S2(.in1(tbout), .in2(taout), .out(t2));
mux M1(.out(tain),.sel(a_sel), .in0(t1),.in1(in1));
mux M2(.out(tbin), .sel(b_sel), .in0(t2), .in1(in2));
register R1(.clk(clk),.rst(rst), .in(tain), .lden(a_ld), .out(taout));
register R2 (.clk(clk), .rst(rst), .in(tbin), .lden(b_ld), .out(tbout));
register Rout (.clk(clk), .rst(rst), .in(taout), .lden(output_en), .out(out));
comparator C1 (.a(taout), .b(tbout), .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b));
endmodule
