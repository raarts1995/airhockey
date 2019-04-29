module vga_avalon_interface(
	clock,
	resetn,
	writedata,
	readdata,
	write,
	read
	
	// signals for connecting to the Avalon fabric
	input clock, resetn, read, write, chipselect;
	input [3:0] byteenable;
	input [31:0] writedata;
	output [31:0] readdata;
