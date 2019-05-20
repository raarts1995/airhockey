module hexDisplay (
	clock,
	resetn,
	writeEnable,
	hexNr,
	value,
	hex0,
	hex1,
	hex2,
	hex3,
	hex4,
	hex5
);
	input clock, resetn, writeEnable;
	input [2:0] hexNr;
	input [6:0] value;
	output reg [6:0] hex0;
	output reg [6:0] hex1;
	output reg [6:0] hex2;
	output reg [6:0] hex3;
	output reg [6:0] hex4;
	output reg [6:0] hex5;
	
	always @(posedge clock or negedge resetn)
	begin
		if (!resetn)
		begin
			hex0 = 7'h0;
         hex1 = 7'h0;
         hex2 = 7'h0;
         hex3 = 7'h0;
         hex4 = 7'h0;
         hex5 = 7'h0;
		end
		else
		begin
			if (writeEnable)
			begin
				case (hexNr)
					3'h0: hex0 = value;
					3'h1: hex1 = value;
					3'h2: hex2 = value;
					3'h3: hex3 = value;
					3'h4: hex4 = value;
					3'h5: hex5 = value;
				endcase
			end
		end
	end
endmodule
