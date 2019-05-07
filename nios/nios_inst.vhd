	component nios is
		port (
			clk_clk                            : in  std_logic                    := 'X'; -- clk
			i2c_0_i2c_serial_sda_in            : in  std_logic                    := 'X'; -- sda_in
			i2c_0_i2c_serial_scl_in            : in  std_logic                    := 'X'; -- scl_in
			i2c_0_i2c_serial_sda_oe            : out std_logic;                           -- sda_oe
			i2c_0_i2c_serial_scl_oe            : out std_logic;                           -- scl_oe
			reset_reset_n                      : in  std_logic                    := 'X'; -- reset_n
			vgacomponent_0_outputs_greenoutput : out std_logic_vector(7 downto 0);        -- greenoutput
			vgacomponent_0_outputs_redoutput   : out std_logic_vector(7 downto 0);        -- redoutput
			vgacomponent_0_outputs_blueoutput  : out std_logic_vector(7 downto 0);        -- blueoutput
			vgacomponent_0_outputs_hsoutput    : out std_logic;                           -- hsoutput
			vgacomponent_0_outputs_vsoutput    : out std_logic                            -- vsoutput
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                    clk.clk
			i2c_0_i2c_serial_sda_in            => CONNECTED_TO_i2c_0_i2c_serial_sda_in,            --       i2c_0_i2c_serial.sda_in
			i2c_0_i2c_serial_scl_in            => CONNECTED_TO_i2c_0_i2c_serial_scl_in,            --                       .scl_in
			i2c_0_i2c_serial_sda_oe            => CONNECTED_TO_i2c_0_i2c_serial_sda_oe,            --                       .sda_oe
			i2c_0_i2c_serial_scl_oe            => CONNECTED_TO_i2c_0_i2c_serial_scl_oe,            --                       .scl_oe
			reset_reset_n                      => CONNECTED_TO_reset_reset_n,                      --                  reset.reset_n
			vgacomponent_0_outputs_greenoutput => CONNECTED_TO_vgacomponent_0_outputs_greenoutput, -- vgacomponent_0_outputs.greenoutput
			vgacomponent_0_outputs_redoutput   => CONNECTED_TO_vgacomponent_0_outputs_redoutput,   --                       .redoutput
			vgacomponent_0_outputs_blueoutput  => CONNECTED_TO_vgacomponent_0_outputs_blueoutput,  --                       .blueoutput
			vgacomponent_0_outputs_hsoutput    => CONNECTED_TO_vgacomponent_0_outputs_hsoutput,    --                       .hsoutput
			vgacomponent_0_outputs_vsoutput    => CONNECTED_TO_vgacomponent_0_outputs_vsoutput     --                       .vsoutput
		);

