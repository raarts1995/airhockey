set_global_assignment -entity "pll65mhz" -library "lib_pll65mhz" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll65mhz" -library "lib_pll65mhz" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "pll65mhz" -library "lib_pll65mhz" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll65mhz" -name SPD_FILE [file join $::quartus(sip_path) "pll65mhz.spd"]

set_global_assignment -library "lib_pll65mhz" -name MISC_FILE [file join $::quartus(sip_path) "pll65mhz_sim/pll65mhz.vo"]
