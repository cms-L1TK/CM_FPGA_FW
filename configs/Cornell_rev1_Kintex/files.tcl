set bd_path proj/

array set bd_files [list {c2cSlave} {configs/Cornell_rev1_Kintex/src/createC2CSlaveInterconnect.tcl} \
			]

set vhdl_files "\
     configs/Cornell_rev1_Kintex/src/top.vhd \
     src/misc/pass_time_domain.vhd \
     src/misc/pacd.vhd \
     src/misc/types.vhd \
     src/misc/capture_CDC.vhd \
     src/misc/counter.vhd \
     src/misc/counter_clock.vhd \
     src/axiReg/axiRegWidthPkg_32.vhd \
     src/axiReg/axiRegPkg.vhd \
     src/axiReg/axiReg.vhd \
     src/CM_IO/K_IO_PKG.vhd \
     src/CM_IO/K_IO_map.vhd \
     src/misc/RGB_PWM.vhd \
     src/misc/LED_PWM.vhd \
     src/CM_FW_info/CM_K_info.vhd \
     src/CM_FW_info/CM_K_INFO_PKG.vhd \
     src/CM_FW_info/CM_K_INFO_map.vhd \
     "
set xdc_files "\
    configs/Cornell_rev1_Kintex/src/top_pins.xdc \
    configs/Cornell_rev1_Kintex/src/top_timing.xdc	\
    "	    

set xci_files "\
    	      cores/Local_Clocking/Local_Clocking.xci \
	      cores/AXI_BRAM/AXI_BRAM.xci \
	      cores/DP_BRAM/DP_BRAM.xci \
    	      "

