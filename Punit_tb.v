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
	$monitor($time,"clk= %b,a = %b, b = %b, c = %b,\n Ans = %b, B_propogate =  %b, A_propogate = %b\n",clk,a,b,c,ans,prop,testmult.dormant);
	end
endmodule
