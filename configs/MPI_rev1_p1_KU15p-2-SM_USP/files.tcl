set bd_path proj/

array set bd_files [list {c2cSlave} {src/c2cBD/createC2CSlaveInterconnect.tcl} \
			]

set vhdl_files "\
     configs/${build_name}/src/top.vhd \
     src/misc/DC_data_CDC.vhd \
     src/misc/pacd.vhd \
     src/misc/types.vhd \
     src/misc/capture_CDC.vhd \
     src/misc/counter.vhd \
     src/misc/counter_CDC.vhd \
     src/misc/rate_counter.vhd \
     regmap_helper/axiReg/axiRegWidthPkg_32.vhd \
     regmap_helper/axiReg/axiRegPkg_d64.vhd \
     regmap_helper/axiReg/axiRegPkg.vhd \
     regmap_helper/axiReg/axiReg.vhd \
     regmap_helper/axiReg/axiReg.vhd \
     regmap_helper/axiReg/bramPortPkg.vhd \
     regmap_helper/axiReg/axiRegBlocking.vhd \
     src/C2C_INTF/C2C_Intf.vhd \
     ${autogen_path}/IO/IO_PKG.vhd \
     ${autogen_path}/IO/IO_map.vhd \
     src/RGB_PWM.vhd \
     src/LED_PWM.vhd \
     src/CM_FW_info/CM_FW_info.vhd \
     ${autogen_path}/CM_FW_INFO/CM_FW_INFO_PKG.vhd \
     ${autogen_path}/CM_FW_INFO/CM_FW_INFO_map.vhd \
     ${autogen_path}/C2C_INTF/C2C_INTF_map.vhd \
     ${autogen_path}/C2C_INTF/C2C_INTF_PKG.vhd \
     src/C2C_INTF/picoblaze/picoblaze/kcpsm6.vhd \
     src/C2C_INTF/picoblaze/uart_rx6.vhd \
     src/C2C_INTF/picoblaze/uart_tx6.vhd \
     src/C2C_INTF/picoblaze/uC.vhd \
     src/C2C_INTF/picoblaze/picoblaze/cli.vhd \
     "
set xdc_files "\
    configs/MPI_rev1_p1_KU15p-2-SM_USP/src/top_pins.xdc \
    configs/MPI_rev1_p1_KU15p-2-SM_USP/src/top_timing.xdc	\
    "	    

set xci_files "\
	      cores/AXI_BRAM/AXI_BRAM.xci \
	      cores/DP_BRAM/DP_BRAM.xci \
    	      "

