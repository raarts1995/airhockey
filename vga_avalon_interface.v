module vga_avalon_interface(
	dataClock,
	vgaClock,
	resetn,
	chipselect,
	address,
	write,
	writedata,
	read,
	readdata,
	redout,
	greenout,
	blueout,
	hsout,
	vsout
);
	
	// signals for connecting to the Avalon fabric
	input dataClock, vgaClock, resetn, chipselect, write, read;
	input [15:0] address;
	input [31:0] writedata;
	output [31:0] readdata;
	output [7:0] redout;
	output [7:0] greenout;
	output [7:0] blueout;
	output hsout, vsout;
	
	vgaComponent vgaC(
		.dataclock(dataClock),
		.vgaclock(vgaClock),
		.reset(!resetn),
		.addr(address),
		.data(writedata),
		.dataout(readdata),
		.wren(write),
		.rden(read),
		.rOut(redout),
		.gOut(greenout),
		.bOut(blueout),
		.hsOut(hsout),
		.vsOut(vsout)
	);
endmodule
