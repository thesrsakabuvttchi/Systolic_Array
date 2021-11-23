`include "Punit.v"

module Systolic_array(
input [3:0][31:0]a,
input [3:0][31:0]b,
input clk,
output [15:0][31:0]out
);

genvar i,j;
generate 
    for(i=0;i<8;i=i+1)
    begin
        for(j=0;j<8;j=j+1)
        begin
            wire [31:0]out_ans,out_prop,out_a;
            Punit pu(32'b0,32'b0,32'b0,1'b0,1'b0,out_ans,out_prop,out_a);
        end
    end
endgenerate 

endmodule

