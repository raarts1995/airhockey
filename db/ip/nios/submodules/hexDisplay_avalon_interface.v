module hexDisplay_avalon_interface(
	clock,
	resetn,
	address,
	write,
	writedata,
	read,
	readdata,
	
	hex0out,
	hex1out,
	hex2out,
	hex3out,
	hex4out,
	hex5out
);

	input clock, resetn, write, read;
	input [2:0] address; //hexNr
	input [7:0] writedata;
	output [7:0] readdata;
	output [6:0] hex0out;
	output [6:0] hex1out;
	output [6:0] hex2out;
	output [6:0] hex3out;
	output [6:0] hex4out;
	output [6:0] hex5out;
	
	assign readdata = {1'b0, (read ? ((address == 3'h0) ? hex0out : ((address == 3'h1) ? hex1out : ((address == 3'h2) ? hex2out : ((address == 3'h3) ? hex3out : ((address == 3'h4) ? hex4out : ((address == 3'h5) ? hex5out : 7'h0)))))) : 7'h0)};

	hexDisplay disp(
		.clock(clock),
		.resetn(resetn),
		.writeEnable(write),
		.hexNr(address),
		.value(writedata),
		.hex0(hex0out),
		.hex1(hex1out),
		.hex2(hex2out),
		.hex3(hex3out),
		.hex4(hex4out),
		.hex5(hex5out)
	);
endmodule
