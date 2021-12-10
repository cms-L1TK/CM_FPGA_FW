set name Local_Clocking

set output_path ${apollo_root_path}/cores

file mkdir ${output_path}

if { [file exists ${output_path}/${name}/${name}.xci] && ([file mtime ${output_path}/${name}/${name}.xci] > [file mtime ${output_path}/${name}/${name}.tcl])} {
    set filename "${output_path}/${name}/${name}.xci"
    set ip_name [file rootname [file tail $filename]]
    #normal xci file
    read_ip $filename
    set isLocked [get_property IS_LOCKED [get_ips $ip_name]]
    puts "IP $ip_name : locked = $isLocked"
    set upgrade  [get_property UPGRADE_VERSIONS [get_ips $ip_name]]
    if {$isLocked && $upgrade != ""} {
	puts "Upgrading IP"
	upgrade_ip [get_ips $ip_name]
    }    
} else {
    file delete -force ${apollo_root_path}/cores/${name}/${name}.xci

    #create IP
    create_ip -vlnv [get_ipdefs -filter {NAME == clk_wiz}] -module_name ${name} -dir ${output_path}/${name}
    set_property -dict [list \
			    CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
			    CONFIG.PRIM_IN_FREQ {200} \
			    CONFIG.CLKOUT2_USED {true} \
			    CONFIG.CLKOUT3_USED {true} \
			    CONFIG.CLKOUT4_USED {true} \
			    CONFIG.CLKOUT5_USED {true} \
			    CONFIG.CLKOUT6_USED {true} \
			    CONFIG.CLK_OUT1_PORT {clk_200} \
			    CONFIG.CLK_OUT2_PORT {clk_50} \
			    CONFIG.CLK_OUT3_PORT {clk_axi} \
			    CONFIG.CLK_OUT4_PORT {clk_250} \
			    CONFIG.CLK_OUT5_PORT {clk_150} \
			    CONFIG.CLK_OUT6_PORT {clk_300} \
			    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200} \
			    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {50} \
			    CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50} \
			    CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {250} \
			    CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {150} \
			    CONFIG.CLKOUT6_REQUESTED_OUT_FREQ {300} \
			    CONFIG.CLKOUT1_MATCHED_ROUTING {false} \
			    CONFIG.CLKOUT2_MATCHED_ROUTING {false} \
			    CONFIG.CLKOUT3_MATCHED_ROUTING {false} \
			    CONFIG.CLKOUT4_MATCHED_ROUTING {false} \
			    CONFIG.CLKOUT5_MATCHED_ROUTING {false} \
			    CONFIG.CLKOUT6_MATCHED_ROUTING {false} \
			    CONFIG.CLKIN1_JITTER_PS {50.0} \
			    CONFIG.MMCM_CLKFBOUT_MULT_F {7.500} \
			    CONFIG.MMCM_CLKIN1_PERIOD {5.000} \
			    CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
			    CONFIG.MMCM_CLKOUT0_DIVIDE_F {7.500} \
			    CONFIG.MMCM_CLKOUT1_DIVIDE {30} \
			    CONFIG.MMCM_CLKOUT2_DIVIDE {30} \
			    CONFIG.MMCM_CLKOUT3_DIVIDE {6} \
			    CONFIG.MMCM_CLKOUT4_DIVIDE {10} \
			    CONFIG.MMCM_CLKOUT5_DIVIDE {5} \
			    CONFIG.NUM_OUT_CLKS {6} \
			    CONFIG.CLKOUT1_JITTER {83.559} \
			    CONFIG.CLKOUT1_PHASE_ERROR {73.186} \
			    CONFIG.CLKOUT2_JITTER {108.931} \
			    CONFIG.CLKOUT2_PHASE_ERROR {73.186} \
			    CONFIG.CLKOUT3_JITTER {108.931} \
			    CONFIG.CLKOUT3_PHASE_ERROR {73.186} \
			    CONFIG.CLKOUT4_JITTER {80.079} \
			    CONFIG.CLKOUT4_PHASE_ERROR {73.186} \
			    CONFIG.CLKOUT5_JITTER {88.276} \
			    CONFIG.CLKOUT5_PHASE_ERROR {73.186} \
			    CONFIG.CLKOUT6_JITTER {77.345} \
			    CONFIG.CLKOUT6_PHASE_ERROR {73.186}
		       ] [ get_ips ${name} ]


}


