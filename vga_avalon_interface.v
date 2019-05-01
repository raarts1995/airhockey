module vga_avalon_interface(
	clock,
	resetn,
	chipselect,
	vgaclock,
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
	input clock, resetn, vgaclock, chipselect, write;
	input [16:0] address;
	input [15:0] writedata;
	output [7:0] redout;
	output [7:0] greenout;
	output [7:0] blueout;
	output hsout, vsout;
	
	wire [16:0] addr;
	wire [15:0] data;
	
	assign addr = (chipselect & write) ? address : 17'd0;
	assign data = (chipselect & write) ? writedata : 16'd0;
	
	vgaComponent vgaC(
		.vgaClock(vgaClock),
		.dataClock(clock),
		.reset(!reset),
		.data(data),
		.addr(add),
		.rOut(redout),
		.gOut(greenout),
		.bOut(blueout),
		.hsOut(hsout),
		.vsOut(vsout)
	);
endmodule
