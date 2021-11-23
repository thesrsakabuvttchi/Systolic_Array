`include "Punit.v"

module top;

reg [31:0]a, b, c;
reg switch;
wire [31:0]ans,prop,a_prop;
reg clk;

Punit testmult(a,b,c,clk,switch,ans,prop,a_prop);

initial
begin
    #0 b<=32'b0_10000010_01000000000000000000000;//10
    #0 switch<=1'b1;

	#20 a<=32'b0_10000100_11000000000000000000000;//56
     c<=32'b0_10000100_11000000000000000000000;//10    
      b<=32'b0_00000000_00000000000000000000000;
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
end

initial begin
	$monitor($time,"clk= %b,a = %b, b = %b, c = %b,\n Ans = %b, B_propogate =  %b, A_propogate = %b\n",clk,a,b,c,ans,prop,a_prop);
	end
endmodule
