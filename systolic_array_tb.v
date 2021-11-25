`include "systolic_array.v"

module top;

reg [3:0][31:0]a, b;
reg clk;
reg switch;
wire [3:0][31:0]ans;

Systolic_array sys_arr(a,b,clk,switch,ans);

initial
begin
    #0 b<=128'b1111111111;//10
end

initial
begin
    #0 clk <=0;
    #5 clk <=1;
    #5 clk <=0;
    #5 clk <=1;
    #5 clk <=0;
    #5 clk <=1;
    #5 clk <=0;
    #5 clk <=1;
    #5 clk <=0;
    #5 clk <=1;
    #5 clk <=0;
    #5 clk <=1;
end

initial begin
	$monitor($time," %b,%b,%b,%b\n",clk,sys_arr.row[3].column[0].out_ans,ans);
	end
endmodule

