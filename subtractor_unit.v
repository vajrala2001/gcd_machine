module subtractor_unit(input in1,in2,cin, output out,cout);
wire one,two,three;
XOR x1(out,in1,in2,cin); //out= (in1 ^ in2)^cin
OR  r1(one,in1,in2);
AND a1(two,cin,one);
AND a2(three,in1,in2);
OR  r2(cout,two,three); // cout= (A+B)cin + AB
endmodule
