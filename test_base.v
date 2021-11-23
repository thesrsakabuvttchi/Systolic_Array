`include "MAC.v"

module top;

reg [31:0]a, b, c;
reg cin,j;
wire [31:0]ans;
wire ovl;
reg clk;

MAC testmult(a,b,c,clk,ans);

initial
begin
    //    sxxxxyyyyxxxxyyyyxxxxyyyyxxxxyyy 
	a=32'b0_10000100_11000000000000000000000;//56
    b=32'b0_10000010_01000000000000000000000;//10
    c=32'b0_10000100_11000000000000000000000;//10
    cin=1'b0;
end

initial
begin
    #0 clk =1;
    for(j=0;j<100;j++)
        #5 clk=~clk;        
end

initial begin
	$monitor($time,"a = %b, b = %b, c = %b,\n Ans = %b\n",a,b,c,ans);
	end

endmodule

//0_10100000_00000100100001101001001--real
//0_10001110_11110111101000011110111
//0_10010000_00001000110110101010011