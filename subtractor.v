module subtractor(in1, in2, out);
input [31:0] in1, in2;
output reg [31:0] out;
wire [31:0] cout;

genvar i;
generate for (i=0; i< 32; i=i+1) 
    begin: sub_loop
        if (i == 0)  subtractor_unit as_i(in1[i],in2[i],1'b0,out[i],cout[i]);
        else subtractor_unit as_i(in1[i],in2[i],cout[i-1],out[i],cout[i]);
    end
endgenerate 

endmodule

