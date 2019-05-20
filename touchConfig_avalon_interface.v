module touchConfig_avalon_interface(
	clock,
	resetn,
	address,
	read,
	readdata,
	
	sda,
	scl,
	intn
);

	input clock, resetn, read;

	input [2:0] address;
	output reg [31:0] readdata;
	inout sda, scl;
	input intn;

	wire [9:0] x1, x2, x3, x4, x5;
	wire [8:0] y1, y2, y3, y4, y5;
	wire [7:0] gestCode;
	wire [3:0] touchCount;

	i2c_touch_config touch(
		//Host Side
		.iCLK(clock),
		.iRSTN(resetn),
		.oREADY(),
		.INT_n(intn),
		.oREG_X1(x1),
		.oREG_Y1(y1),
		.oREG_X2(x2),
		.oREG_Y2(y2),
		.oREG_X3(x3),
		.oREG_Y3(y3),
		.oREG_X4(x4),
		.oREG_Y4(y4),
		.oREG_X5(x5),
		.oREG_Y5(y5),
		.oREG_GESTURE(gestCode),
		.oREG_TOUCH_COUNT(touchCount),
		//I2C Side
		.I2C_SDAT(sda),
		.I2C_SCLK(scl)

	);

	always @(posedge clock or negedge resetn)
	begin
		if (!resetn)
		begin
			readdata = 32'h0;
		end
		else
		begin
			if (read)
			begin
				case (address)
					3'h0:    readdata = {28'h0, touchCount};
					3'h1:    readdata = {15'h0, y1, x1};
					3'h2:    readdata = {15'h0, y2, x2};
					3'h3:    readdata = {15'h0, y3, x3};
					3'h4:    readdata = {15'h0, y4, x4};
					3'h5:    readdata = {15'h0, y5, x5};
					3'h6:    readdata = {24'h0, gestCode};
					default: readdata = 32'h0;
				endcase
			end
		end
	end
endmodule
