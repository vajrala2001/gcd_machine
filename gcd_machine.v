module gcd_machine (clk, rst, go, in1, in2, out, done);
input clk, rst, go;
input [31:0] in1, in2;
output [31:0] out;
output done;

wire a_gt_b, a_eq_b, a_lt_b;
wire a_ld, b_ld, a_sel, b_sel;
wire output_en;

controller C1 (.clk(clk), .rst(rst), .go(go), .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b), .a_ld(a_ld), .a_sel(a_sel), .b_ld(b_ld),  .b_sel(b_sel), .output_en(output_en), .done(done));
datapath D1 (.clk(clk), .rst(rst), .in1(in1), .in2(in2), .a_sel(a_sel), .b_sel(b_sel), .a_ld(a_ld), .b_ld(b_ld), .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b), .output_en(output_en), .out(out));
endmodule
