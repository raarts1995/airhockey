module LFSR(
	clk,
	clken,
	rst,
	out
	);
	
	input clk;
	input clken;
	input rst;
	output reg [15:0] out;
	
	wire feedback = ((out[15] ^ out[13]) ^ out[12]) ^ out[10];
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			out = 1;
		else
		if (clken)
			begin
				out = {out[14:0], feedback};
			end
	end
endmodule
	