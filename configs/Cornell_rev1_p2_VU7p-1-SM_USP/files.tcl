set bd_path proj

array set bd_files [list {c2cSlave} {src/c2cBD/createC2CSlaveInterconnect.tcl} \
			]

set vhdl_files "\
     configs/Cornell_rev1_p2_VU7p-1-SM_USP/src/top.vhd \
     src/misc/pass_time_domain.vhd \
     src/misc/pacd.vhd \
     src/misc/types.vhd \
     src/misc/capture_CDC.vhd \
     src/misc/counter.vhd \
     src/misc/counter_clock.vhd \
     src/misc/asym_dualport_ram.vhd \
     regmap_helper/axiReg/axiRegWidthPkg_32.vhd \
     regmap_helper/axiReg/axiRegPkg_d64.vhd \
     regmap_helper/axiReg/axiRegPkg.vhd \
     regmap_helper/axiReg/axiReg.vhd \
     configs/Cornell_rev1_p2_VU7p-1-SM_USP/autogen/CM_IO/V_IO_PKG.vhd \
     configs/Cornell_rev1_p2_VU7p-1-SM_USP/autogen/CM_IO/V_IO_map_custom.vhd \
     src/misc/RGB_PWM.vhd \
     src/misc/LED_PWM.vhd \
     src/misc/rate_counter.vhd \
     src/CM_FW_info/CM_V_info.vhd \
     configs/Cornell_rev1_p2_VU7p-1-SM_USP/autogen/CM_FW_info/CM_V_INFO_PKG.vhd \
     configs/Cornell_rev1_p2_VU7p-1-SM_USP/autogen/CM_FW_info/CM_V_INFO_map.vhd \          
     src/misc/axi_bram_ctrl_v4_1_rfs.vhd \
     src/misc/axi_bram_controller.vhd \
     src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/hdl/memUtil_pkg.vhd \
     src/tracktrigger/IntegrationTests/common/hdl/tf_pkg.vhd \
"
#     src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/hdl/SectorProcessor_debug.vhd \
#     src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/hdl/memUtil_pkg.vhd \
#     src/tracktrigger/IntegrationTests/common/hdl/tf_lut.vhd \
#     src/tracktrigger/IntegrationTests/common/hdl/tf_mem.vhd \
#     src/tracktrigger/IntegrationTests/common/hdl/tf_mem_bin.vhd \
#     src/tracktrigger/IntegrationTests/common/hdl/tf_pkg.vhd \
#     "
set xdc_files "\
    configs/Cornell_rev1_p2_VU7p-1-SM_USP/src/top_pins.xdc \
    configs/Cornell_rev1_p2_VU7p-1-SM_USP/src/top_timing.xdc	\
    "	    

#set xci_files "\
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_2S_1_A/IR_2S_1_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_2S_1_B/IR_2S_1_B.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_2S_2_A/IR_2S_2_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_2S_2_B/IR_2S_2_B.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_2S_3_A/IR_2S_3_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_2S_3_B/IR_2S_3_B.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_2S_4_A/IR_2S_4_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_2S_4_B/IR_2S_4_B.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS10G_1_A/IR_PS10G_1_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS10G_2_A/IR_PS10G_2_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS10G_2_B/IR_PS10G_2_B.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS10G_3_A/IR_PS10G_3_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS10G_3_B/IR_PS10G_3_B.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS_1_A/IR_PS_1_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS_1_B/IR_PS_1_B.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS_2_A/IR_PS_2_A.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/IR_PS_2_B/IR_PS_2_B.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/VMR_L1PHID/VMR_L1PHID.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/VMR_L2PHIB/VMR_L2PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/VMR_L3PHIB/VMR_L3PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/VMR_L4PHIB/VMR_L4PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/VMR_L5PHIB/VMR_L5PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/VMR_L6PHIB/VMR_L6PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/TE_L1L2/TE_L1L2.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/TC_L1L2F/TC_L1L2F.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/PR_L3PHIB/PR_L3PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/PR_L4PHIB/PR_L4PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/PR_L5PHIB/PR_L5PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/PR_L6PHIB/PR_L6PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/ME_L3PHIB/ME_L3PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/ME_L4PHIB/ME_L4PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/ME_L5PHIB/ME_L5PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/ME_L6PHIB/ME_L6PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/MC_L3PHIB/MC_L3PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/MC_L4PHIB/MC_L4PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/MC_L5PHIB/MC_L5PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/MC_L6PHIB/MC_L6PHIB.xci \
#              src/tracktrigger/IntegrationTests/ReducedConfig/IRtoTB/script/Work/Work.srcs/sources_1/ip/FT_L1L2/FT_L1L2.xci \
#              "
set xci_files "\
    	      cores/Local_Clocking/Local_Clocking.tcl \
    	      cores/TC_BRAM/Test_Chain_Mem_1/Test_Chain_Mem_1.xci \
    	      cores/TC_BRAM/SummerChain_vio/SummerChain_vio.xci \
    	      cores/TC_BRAM/SummerChain_debug/SummerChain_debug.xci \
    	      cores/TC_BRAM/ROM_DL_2S_1_A_04/ROM_DL_2S_1_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_2S_1_B_04/ROM_DL_2S_1_B_04.xci \
    	      cores/TC_BRAM/ROM_DL_2S_2_A_04/ROM_DL_2S_2_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_2S_2_B_04/ROM_DL_2S_2_B_04.xci \
    	      cores/TC_BRAM/ROM_DL_2S_3_A_04/ROM_DL_2S_3_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_2S_3_B_04/ROM_DL_2S_3_B_04.xci \
    	      cores/TC_BRAM/ROM_DL_2S_4_A_04/ROM_DL_2S_4_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_2S_4_B_04/ROM_DL_2S_4_B_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS10G_1_A_04/ROM_DL_PS10G_1_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS10G_2_A_04/ROM_DL_PS10G_2_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS10G_2_B_04/ROM_DL_PS10G_2_B_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS10G_3_A_04/ROM_DL_PS10G_3_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS10G_3_B_04/ROM_DL_PS10G_3_B_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS_1_A_04/ROM_DL_PS_1_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS_1_B_04/ROM_DL_PS_1_B_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS_2_A_04/ROM_DL_PS_2_A_04.xci \
    	      cores/TC_BRAM/ROM_DL_PS_2_B_04/ROM_DL_PS_2_B_04.xci \
              " 
