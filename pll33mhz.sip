set_global_assignment -entity "pll33mhz" -library "lib_pll33mhz" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll33mhz" -library "lib_pll33mhz" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "pll33mhz" -library "lib_pll33mhz" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll33mhz" -name SPD_FILE [file join $::quartus(sip_path) "pll33mhz.spd"]

set_global_assignment -library "lib_pll33mhz" -name MISC_FILE [file join $::quartus(sip_path) "pll33mhz_sim/pll33mhz.vo"]
