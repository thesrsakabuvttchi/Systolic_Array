`include "MAC.v"

module Punit(
input [31:0]a,b,c,
input clk,
input switch,
output reg [31:0]out_ans,
output reg [31:0]out_prop,
output reg [31:0]out_a
);

reg [31:0] dormant,active;
wire [31:0] out_ans_buff;
MAC main(a,active,c,clk,out_ans_buff);

always @(posedge clk)
begin
    out_prop <= b;
    dormant <= b;
    out_a <= a;
    out_ans <= out_ans_buff;
    if(switch==1'b1)
        active <= dormant;
end
endmodule


