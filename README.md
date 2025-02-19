# APOLLO Command Module firmware

## Github branching policy:
We are going to try to follow: https://nvie.com/posts/a-successful-git-branching-model/
The default branch is develop and you should branch off of that.

## Building
There are several Apollo CMs so this build system is setup to make any of them.
The differences between these configurations are located in the "configs" directory.
The build process uses Vivado but is directed by makefiles. 

### configs
The configs directory contains directories for each different configuraiton and the name of this directory should match the make rule.
In these folders you will need to have atleast the following three files:
 - files.tcl  
   A tcl file that lists the files to be included
   There are
   - bd_files   : the list of BD names and tcl files to be built
   - vhdl_files : the list of VHDL files this project uses
   - xdc_files  : the list of xdc files for the project
   - xci_files  : the list of IP core xci files used
 - settings.tcl  
   This file primarily lists the FPGA part number
 - config.yaml 
   Lists AXI slaves that exist or should be made, their AXI address info, uHAL address/tables, and if they should auto generate AXI slave decoding logic from the uHAL address tables
   This can also list certain IP cores that will be generated and the parameters used for them (Currently clocking, some MGT, and ILA cores.)

#### Additional files

     This is where files that can't be generic should be put, but that is not a requirement. 
     I would suggest that all non-shared cores be saved as: configs/CM_FPGA_NAME/cores/name/name.xci
     I would also suggest that non-shared HDL be put in configs/CM_FPGA_NAME/src, but you are free to do what you like. 
     Common files used in multiple builds are normally put in src/your_dir_name, but this isn't strictly enforced, so be reasonable. 
     These files used are always taken from the files.tcl (with the exception of the autogenerated FW info hdl file)


### Building
As mentioned above, make is used to drive the build.
 - If you just checked this out, do a "make init" to pull all the included submodules. 
 - FPGA FW build 
   Located in the main directory (with this file)
   Builds the CM FPGA FW   


#### Make
Buildable Groups:
  > make list

    - Apollo CM config:
      Different FWs to make (you probably just want one of these)
    - Vivado:
      Drive interactive vivado sessions
    - Clean:
      Clean different parts of the builds
    - Tests:
      Test benches run and compared against golden outputs
    - Test-benches:
      Start interactive test-benches

#### FW
To Build FPGA FW:
  `make group_revN_FPGA`, e.g., for Cornell CM Rev1 with 7 series SM zynq, VU7P FPGA: `make Cornell_rev1_p2_VU7p-1-SM_7s`


  Ouput:
   - ./group_revN_FPGA.tar.gz which includes

     - bit/top_group_revN_FPGA.bit
  
     - kernel/hw/*.dtsi_chunk,*.dtsi_post_chunk,hwdef

### Organization:
  Build scripts are in ./build-scripts and are called by the Makefile
  
  HDL & constraint files are in ./configs/group_revN_FPGA/src.
  config.yaml in ./config lists the slaves to be built and the tcl needed to build them
  Output HDL _map.vhd and _PKG.vhd, and AddSlaves.tcl are autogenerated, but commited to git so UHAL isn't required to do simple builds 


### Dependencies:
  - Vivado 2018.2 installed in ${BUILD_VIVADO_BASE}
  - python2
  - python-yaml
  - python-jinja2
  - uHAL (set CACTUS_ROOT and LD_LIBARARY_PATH accordingly)
  - device tree compiler (rpm name "dtc")
  - make

### Environment variables
To override the version and/or location of the Xilinx tools, set the BUILD_VIVADO_VERSION and BUILD_VIVADO_BASE variables. A custom CACTUS location can be set by setting CACTUS_ROOT (you might also need to set PYTHON_ROOT).
