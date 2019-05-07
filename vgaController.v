module vgaController(
	clock,
	reset,
	dispCol,
	dispRow,
	visible,
	hs,
	vs);
	
	input clock;
	input reset;
	output reg [11:0] dispCol;
	output reg [10:0] dispRow;
	output visible;
	output reg hs;
	output reg vs;
	
	
	// 72 Hz 800 x 600 VGA - 50MHz clock 
	/*parameter HOR_FIELD = 799; 
	parameter HOR_STR_SYNC = 855; 
	parameter HOR_STP_SYNC = 978; 
	parameter HOR_TOTAL = 1042; 
	parameter VER_FIELD = 599; 
	parameter VER_STR_SYNC = 636; 
	parameter VER_STP_SYNC = 642; 
	parameter VER_TOTAL = 665;*/
	
	//56 Hz 1280 x 1024 VGA - 100MHz clock
	/*parameter HOR_FIELD = 1279; 
	parameter HOR_STR_SYNC = 1327; 
	parameter HOR_STP_SYNC = 1439; 
	parameter HOR_TOTAL = 1687; 
	parameter VER_FIELD = 1023; 
	parameter VER_STR_SYNC = 1024; 
	parameter VER_STP_SYNC = 1027; 
	parameter VER_TOTAL = 1065;*/
	
	//60 Hz 1024 x 768 VGA - 65MHz clock
	/*parameter HOR_FIELD = 1023; 
	parameter HOR_STR_SYNC = 1047; 
	parameter HOR_STP_SYNC = 1183; 
	parameter HOR_TOTAL = 1343; 
	parameter VER_FIELD = 767; 
	parameter VER_STR_SYNC = 770; 
	parameter VER_STP_SYNC = 776; 
	parameter VER_TOTAL = 805;*/
	
	//.. Hz 800 x 480 LCD - 33MHz clock
	parameter HOR_FIELD = 799; 
	parameter HOR_STR_SYNC = 1009;
	parameter HOR_STP_SYNC = 1049; 
	parameter HOR_TOTAL = 1055; 
	parameter VER_FIELD = 479; 
	parameter VER_STR_SYNC = 501; 
	parameter VER_STP_SYNC = 521; 
	parameter VER_TOTAL = 524;
	
	reg horVisible;
	reg verVisible;
	assign visible = horVisible & verVisible;
	
	always @ (posedge clock or posedge reset)
	begin
		if (reset)
		begin
			dispCol = 0;
			dispRow = 0;
			hs = 0;
			vs = 0;
			horVisible = 0;
			verVisible = 0;
		end
		else
		begin
			if (dispCol <= HOR_TOTAL)
			begin
				horVisible = ((dispCol <= HOR_FIELD) ? 1 : 0);
				hs = ((dispCol > HOR_STR_SYNC && dispCol <= HOR_STP_SYNC) ? 0 : 1);
				
				dispCol = dispCol + 1;
			end
			else //einde van regel. reset horizontale counter en tel vertical counter op
			begin
				dispCol = 0;
				horVisible = 1;
				
				if (dispRow <= VER_TOTAL)
				begin
					verVisible = ((dispRow <= VER_FIELD) ? 1 : 0);
					vs = ((dispRow > VER_STR_SYNC && dispRow <= VER_STP_SYNC) ? 0 : 1);
					
					dispRow = dispRow + 1;
				end
				else
				begin
					dispRow = 0;
					verVisible = 1;
				end
			end
		end
	end
endmodule
