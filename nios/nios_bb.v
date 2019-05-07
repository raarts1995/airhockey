
module nios (
	clk_clk,
	i2c_0_i2c_serial_sda_in,
	i2c_0_i2c_serial_scl_in,
	i2c_0_i2c_serial_sda_oe,
	i2c_0_i2c_serial_scl_oe,
	reset_reset_n,
	vgacomponent_0_outputs_greenoutput,
	vgacomponent_0_outputs_redoutput,
	vgacomponent_0_outputs_blueoutput,
	vgacomponent_0_outputs_hsoutput,
	vgacomponent_0_outputs_vsoutput);	

	input		clk_clk;
	input		i2c_0_i2c_serial_sda_in;
	input		i2c_0_i2c_serial_scl_in;
	output		i2c_0_i2c_serial_sda_oe;
	output		i2c_0_i2c_serial_scl_oe;
	input		reset_reset_n;
	output	[7:0]	vgacomponent_0_outputs_greenoutput;
	output	[7:0]	vgacomponent_0_outputs_redoutput;
	output	[7:0]	vgacomponent_0_outputs_blueoutput;
	output		vgacomponent_0_outputs_hsoutput;
	output		vgacomponent_0_outputs_vsoutput;
endmodule
