	component nios is
		port (
			clk_clk                            : in  std_logic                    := 'X'; -- clk
			hex_display_0_outputs_hex0         : out std_logic_vector(6 downto 0);        -- hex0
			hex_display_0_outputs_hex1         : out std_logic_vector(6 downto 0);        -- hex1
			hex_display_0_outputs_hex2         : out std_logic_vector(6 downto 0);        -- hex2
			hex_display_0_outputs_hex3         : out std_logic_vector(6 downto 0);        -- hex3
			hex_display_0_outputs_hex4         : out std_logic_vector(6 downto 0);        -- hex4
			hex_display_0_outputs_hex5         : out std_logic_vector(6 downto 0);        -- hex5
			leds_export                        : out std_logic_vector(9 downto 0);        -- export
			reset_reset_n                      : in  std_logic                    := 'X'; -- reset_n
			vgacomponent_0_outputs_greenoutput : out std_logic_vector(7 downto 0);        -- greenoutput
			vgacomponent_0_outputs_redoutput   : out std_logic_vector(7 downto 0);        -- redoutput
			vgacomponent_0_outputs_blueoutput  : out std_logic_vector(7 downto 0);        -- blueoutput
			vgacomponent_0_outputs_hsoutput    : out std_logic;                           -- hsoutput
			vgacomponent_0_outputs_vsoutput    : out std_logic;                           -- vsoutput
			vgacomponent_0_vgaclock_clk        : in  std_logic                    := 'X'  -- clk
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                     clk.clk
			hex_display_0_outputs_hex0         => CONNECTED_TO_hex_display_0_outputs_hex0,         --   hex_display_0_outputs.hex0
			hex_display_0_outputs_hex1         => CONNECTED_TO_hex_display_0_outputs_hex1,         --                        .hex1
			hex_display_0_outputs_hex2         => CONNECTED_TO_hex_display_0_outputs_hex2,         --                        .hex2
			hex_display_0_outputs_hex3         => CONNECTED_TO_hex_display_0_outputs_hex3,         --                        .hex3
			hex_display_0_outputs_hex4         => CONNECTED_TO_hex_display_0_outputs_hex4,         --                        .hex4
			hex_display_0_outputs_hex5         => CONNECTED_TO_hex_display_0_outputs_hex5,         --                        .hex5
			leds_export                        => CONNECTED_TO_leds_export,                        --                    leds.export
			reset_reset_n                      => CONNECTED_TO_reset_reset_n,                      --                   reset.reset_n
			vgacomponent_0_outputs_greenoutput => CONNECTED_TO_vgacomponent_0_outputs_greenoutput, --  vgacomponent_0_outputs.greenoutput
			vgacomponent_0_outputs_redoutput   => CONNECTED_TO_vgacomponent_0_outputs_redoutput,   --                        .redoutput
			vgacomponent_0_outputs_blueoutput  => CONNECTED_TO_vgacomponent_0_outputs_blueoutput,  --                        .blueoutput
			vgacomponent_0_outputs_hsoutput    => CONNECTED_TO_vgacomponent_0_outputs_hsoutput,    --                        .hsoutput
			vgacomponent_0_outputs_vsoutput    => CONNECTED_TO_vgacomponent_0_outputs_vsoutput,    --                        .vsoutput
			vgacomponent_0_vgaclock_clk        => CONNECTED_TO_vgacomponent_0_vgaclock_clk         -- vgacomponent_0_vgaclock.clk
		);

