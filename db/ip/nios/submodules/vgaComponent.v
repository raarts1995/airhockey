module vgaComponent(
	clock,
	reset,
	data,
	addr,
	wren,
	rOut,
	gOut,
	bOut,
	hsOut,
	vsOut
);
	input clock;
	input reset;
	input [15:0] data;
	input [16:0] addr;
	input wren;
	output reg [7:0] rOut;
	output reg [7:0] gOut;
	output reg [7:0] bOut;
	output hsOut;
	output vsOut;
	
	wire visible;
	
	wire [11:0] col;
	wire [10:0] row;
	
	wire [16:0] ramAddress;
	wire [15:0] ramOutput;
	
	assign ramAddress = col[11:1] + (row[10:1] * 400);
	
	vgaController vga(.clock(clock), .reset(reset), .dispCol(col), .dispRow(row), .visible(visible), .hs(hsOut), .vs(vsOut));
	videoRAM vRam(.rdaddress(ramAddress), .rdclock(clock), .data(data), .wraddress(addr), .wrclock(clock), .wren(wren), .q(ramOutput));
	
	always @(posedge clock or posedge reset)
	begin
		if (reset)
		begin
			rOut = 0;
			gOut = 0;
			bOut = 0;
		end
		else
		begin
			if (visible)
			begin
				rOut = {ramOutput[15:11], 3'b0};
				gOut = {ramOutput[10:5], 2'b0};
				bOut = {ramOutput[4:0], 3'b0};
				/*if ((col <= 1) || (col >= 798) || (row <= 1) || (row >= 478))
				begin
					rOut = 8'hFF;
					gOut = 8'hFF;
					bOut = 8'hFF;
				end
				else
				begin
					rOut = 0;
					gOut = 0;
					bOut = 0;
				end*/
			end
			else
			begin
				rOut = 0;
				gOut = 0;
				bOut = 0;
			end
		end
	end
endmodule
