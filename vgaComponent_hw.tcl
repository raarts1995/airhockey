# TCL File Generated by Component Editor 16.1
# Tue May 07 18:49:30 CEST 2019
# DO NOT MODIFY


# 
# vgaComponent "vgaComponent" v1.0
#  2019.05.07.18:49:30
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module vgaComponent
# 
set_module_property DESCRIPTION ""
set_module_property NAME vgaComponent
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Own blocks"
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME vgaComponent
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL vga_avalon_interface
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file vgaComponent.v VERILOG PATH vgaComponent.v
add_fileset_file vga_avalon_interface.v VERILOG PATH vga_avalon_interface.v TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL vga_avalon_interface
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file vgaComponent.v VERILOG PATH vgaComponent.v
add_fileset_file vga_avalon_interface.v VERILOG PATH vga_avalon_interface.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point avalon_slave_0
# 
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressUnits WORDS
set_interface_property avalon_slave_0 associatedClock clock
set_interface_property avalon_slave_0 associatedReset reset_n
set_interface_property avalon_slave_0 bitsPerSymbol 8
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 burstcountUnits WORDS
set_interface_property avalon_slave_0 explicitAddressSpan 0
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0 maximumPendingWriteTransactions 0
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitTime 1
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0
set_interface_property avalon_slave_0 ENABLED true
set_interface_property avalon_slave_0 EXPORT_OF ""
set_interface_property avalon_slave_0 PORT_NAME_MAP ""
set_interface_property avalon_slave_0 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0 address address Input 16
add_interface_port avalon_slave_0 chipselect chipselect Input 1
add_interface_port avalon_slave_0 write write Input 1
add_interface_port avalon_slave_0 writedata writedata Input 32
add_interface_port avalon_slave_0 read read Input 1
add_interface_port avalon_slave_0 readdata readdata Output 32
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point Outputs
# 
add_interface Outputs conduit end
set_interface_property Outputs associatedClock vgaclock
set_interface_property Outputs associatedReset reset_n
set_interface_property Outputs ENABLED true
set_interface_property Outputs EXPORT_OF ""
set_interface_property Outputs PORT_NAME_MAP ""
set_interface_property Outputs CMSIS_SVD_VARIABLES ""
set_interface_property Outputs SVD_ADDRESS_GROUP ""

add_interface_port Outputs greenout greenoutput Output 8
add_interface_port Outputs redout redoutput Output 8
add_interface_port Outputs blueout blueoutput Output 8
add_interface_port Outputs hsout hsoutput Output 1
add_interface_port Outputs vsout vsoutput Output 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock dataClock clk Input 1


# 
# connection point reset_n
# 
add_interface reset_n reset end
set_interface_property reset_n associatedClock clock
set_interface_property reset_n synchronousEdges DEASSERT
set_interface_property reset_n ENABLED true
set_interface_property reset_n EXPORT_OF ""
set_interface_property reset_n PORT_NAME_MAP ""
set_interface_property reset_n CMSIS_SVD_VARIABLES ""
set_interface_property reset_n SVD_ADDRESS_GROUP ""

add_interface_port reset_n resetn reset_n Input 1


# 
# connection point vgaclock
# 
add_interface vgaclock clock end
set_interface_property vgaclock clockRate 0
set_interface_property vgaclock ENABLED true
set_interface_property vgaclock EXPORT_OF ""
set_interface_property vgaclock PORT_NAME_MAP ""
set_interface_property vgaclock CMSIS_SVD_VARIABLES ""
set_interface_property vgaclock SVD_ADDRESS_GROUP ""

add_interface_port vgaclock vgaClock clk Input 1

