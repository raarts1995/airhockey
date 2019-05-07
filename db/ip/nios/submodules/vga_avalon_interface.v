module vga_avalon_interface(
	clock,
	resetn,
	chipselect,
	write,
	address,
	writedata,
	redout,
	greenout,
	blueout,
	hsout,
	vsout
);
	
	// signals for connecting to the Avalon fabric
	input clock, resetn, chipselect, write;
	input [16:0] address;
	input [15:0] writedata;
	output [7:0] redout;
	output [7:0] greenout;
	output [7:0] blueout;
	output hsout, vsout;
	
	vgaComponent vgaC(
		.clock(clock),
		.reset(!resetn),
		.data(writedata),
		.addr(address),
		.wren(write),
		.rOut(redout),
		.gOut(greenout),
		.bOut(blueout),
		.hsOut(hsout),
		.vsOut(vsout)
	);
endmodule
