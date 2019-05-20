module vgaComponent(
	dataclock,
	vgaclock,
	reset,
	addr,
	data,
	dataout,
	wren,
	rden,
	rOut,
	gOut,
	bOut,
	hsOut,
	vsOut
);
	input dataclock;
	input vgaclock;
	input reset;
	input [15:0] addr;
	input [31:0] data;
	output [31:0] dataout;
	input wren;
	input rden;
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
	
	vgaController vga(.clock(vgaclock), .reset(reset), .dispCol(col), .dispRow(row), .visible(visible), .hs(hsOut), .vs(vsOut));
	//videoRAM vRam(.rdaddress(ramAddress), .rdclock(vgaclock), .data(data), .wraddress(addr), .wrclock(dataclock), .wren(wren), .q(ramOutput));
	
	videoRAMv2 vRAM(
		.address_a(addr),
		.clock_a(dataclock),
		.data_a(data),
		.rden_a(rden),
		.wren_a(wren),
		.q_a(dataout),
		
		.address_b(ramAddress),
		.clock_b(vgaclock),
		.data_b(),
		.rden_b(1),
		.wren_b(0),
		.q_b(ramOutput)
	);
	
	always @(posedge vgaclock or posedge reset)
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
