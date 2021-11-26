`include "systolic_array.v"

module top;

reg [3:0][31:0]a, b;
reg clk;
reg switch;
wire [3:0][31:0]ans;

Systolic_array sys_arr(a,b,clk,switch,ans);

initial
begin
    #0 b[3]<='b0;b[2]<='b0;b[1]<='b0;b[0]<='b1;
    #10 b[3]<='b0;b[2]<='b0;b[1]<='b1;b[0]<='b0;
    #10 b[3]<='b0;b[2]<='b1;b[1]<='b0;b[0]<='b0;
    #10 b[3]<='b1;b[2]<='b0;b[1]<='b0;b[0]<='b0;
    switch <= 1'b1;
    #10 switch <= 1'b1;
    #10 a[3]<='b1;a[2]<='b0;a[1]<='b0;a[0]<='b1;
    #10 a[3]<='b1;a[2]<='b1;a[1]<='b1;a[0]<='b0;
    #10 a[3]<='b0;a[2]<='b1;a[1]<='b1;a[0]<='b0;
    #10 a[3]<='b1;a[2]<='b0;a[1]<='b1;a[0]<='b0;
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
	$monitor($time," %b,%b\n",clk,ans);
	end
endmodule

