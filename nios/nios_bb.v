
module nios (
	clk_clk,
	hex_display_0_outputs_hex0,
	hex_display_0_outputs_hex1,
	hex_display_0_outputs_hex2,
	hex_display_0_outputs_hex3,
	hex_display_0_outputs_hex4,
	hex_display_0_outputs_hex5,
	leds_export,
	reset_reset_n,
	vgacomponent_0_outputs_greenoutput,
	vgacomponent_0_outputs_redoutput,
	vgacomponent_0_outputs_blueoutput,
	vgacomponent_0_outputs_hsoutput,
	vgacomponent_0_outputs_vsoutput,
	vgacomponent_0_vgaclock_clk);	

	input		clk_clk;
	output	[6:0]	hex_display_0_outputs_hex0;
	output	[6:0]	hex_display_0_outputs_hex1;
	output	[6:0]	hex_display_0_outputs_hex2;
	output	[6:0]	hex_display_0_outputs_hex3;
	output	[6:0]	hex_display_0_outputs_hex4;
	output	[6:0]	hex_display_0_outputs_hex5;
	output	[9:0]	leds_export;
	input		reset_reset_n;
	output	[7:0]	vgacomponent_0_outputs_greenoutput;
	output	[7:0]	vgacomponent_0_outputs_redoutput;
	output	[7:0]	vgacomponent_0_outputs_blueoutput;
	output		vgacomponent_0_outputs_hsoutput;
	output		vgacomponent_0_outputs_vsoutput;
	input		vgacomponent_0_vgaclock_clk;
endmodule
