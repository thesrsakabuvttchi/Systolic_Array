`include "Punit.v"

module Systolic_array(
input [3:0][31:0]a,
input [3:0][31:0]b,
input clk,
input switch,
output [3:0][31:0]out
);

genvar i,j;
generate 
    for(i=0;i<4;i=i+1)
    begin:row
        for(j=0;j<4;j=j+1)
        begin:column
            wire [31:0]out_ans,out_prop,out_a;
            //First PUNIT (0,0)
            if(i==0 && j==0)
                Punit pu(a[0],b[0],32'b0,clk,1'b0,out_ans,out_prop,out_a);

            //First ROW (except 0,0)
            else if(i==0)
                Punit pu(
                    row[0].column[j-1].out_a,
                    b[j],
                    32'b0,
                    clk,switch,out_ans,out_prop,out_a);
                
            else if(j==0)
                Punit pu(
                    a[i],
                    row[i-1].column[j].out_prop,
                    row[i-1].column[j].out_ans,
                    clk,switch,out_ans,out_prop,out_a);

            else
                Punit pu(
                    row[i].column[j-1].out_a,
                    row[i-1].column[j].out_prop,
                    row[i-1].column[j].out_ans,
                    clk,switch,out_ans,out_prop,out_a);
        end
    end
endgenerate 

generate
    for(i=0;i<4;i=i+1)
    begin
        assign out[i] = row[3].column[i].out_ans;
    end
endgenerate

endmodule

