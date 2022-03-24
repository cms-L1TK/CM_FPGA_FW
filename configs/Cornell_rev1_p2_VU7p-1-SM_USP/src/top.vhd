library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

use work.axiRegPkg.all;
use work.axiRegPkg_d64.all;
use work.types.all;
use work.V_IO_Ctrl.all;

use work.tf_pkg.all;
use work.memUtil_pkg.all;


Library UNISIM;
use UNISIM.vcomponents.all;

entity top is
  port (
    -- clocks
    p_clk_200a : in  std_logic;
    n_clk_200a : in  std_logic;                -- 200 MHz system clock

    -- Zynq AXI Chip2Chip
    n_util_clk_chan0 : in std_logic;
    p_util_clk_chan0 : in std_logic;
    n_mgt_z2v        : in  std_logic_vector(1 downto 1);
    p_mgt_z2v        : in  std_logic_vector(1 downto 1);
    n_mgt_v2z        : out std_logic_vector(1 downto 1);
    p_mgt_v2z        : out std_logic_vector(1 downto 1);

    v_fpga_i2c_scl   : inout std_logic;
    v_fpga_i2c_sda   : inout std_logic;

    --TCDS
    p_clk0_chan0     : in std_logic; -- 200 MHz system clock
    n_clk0_chan0     : in std_logic; 
    p_clk1_chan0     : in std_logic; -- 312.195122 MHz synth clock
    n_clk1_chan0     : in std_logic;
--    p_atca_tts_out   : out std_logic;
--    n_atca_tts_out   : out std_logic;
--    p_atca_ttc_in    : in  std_logic;
--    n_atca_ttc_in    : in  std_logic;

    -- tri-color LED
    led_red : out std_logic;
    led_green : out std_logic;
    led_blue : out std_logic       -- assert to turn on
    );    
end entity top;

architecture structure of top is


COMPONENT ROM_DL_PS10G_1_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_PS10G_2_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_PS10G_2_B_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_PS10G_3_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_PS10G_3_B_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_PS_1_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_PS_1_B_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_PS_2_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_PS_2_B_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_2S_1_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_2S_1_B_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_2S_2_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_2S_2_B_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_2S_3_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_2S_3_B_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_2S_4_A_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ROM_DL_2S_4_B_04
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(38 DOWNTO 0)
  );
END COMPONENT;

COMPONENT ROM_TF_L1L2
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Test_Chain_Mem_1
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT Test_Chain_512_Mem
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;


  signal clk_200_raw     : std_logic;
  signal clk_300         : std_logic;
  signal clk_250         : std_logic;
  signal clk_200         : std_logic;
  signal clk_150         : std_logic;
  signal clk_50          : std_logic;
  signal clk_a           : std_logic;
  signal clk_b           : std_logic;
  signal sc_clk          : std_logic;
  signal reset           : std_logic;
  signal locked_clk200   : std_logic;

  signal led_blue_local  : slv_8_t;
  signal led_red_local   : slv_8_t;
  signal led_green_local : slv_8_t;

  constant localAXISlaves    : integer := 4;
  signal local_AXI_ReadMOSI  :  AXIReadMOSI_array_t(0 to localAXISlaves-1) := (others => DefaultAXIReadMOSI);
  signal local_AXI_ReadMISO  :  AXIReadMISO_array_t(0 to localAXISlaves-1) := (others => DefaultAXIReadMISO);
  signal local_AXI_WriteMOSI : AXIWriteMOSI_array_t(0 to localAXISlaves-1) := (others => DefaultAXIWriteMOSI);
  signal local_AXI_WriteMISO : AXIWriteMISO_array_t(0 to localAXISlaves-1) := (others => DefaultAXIWriteMISO);

  signal local_AXI_RdAck     : std_logic;
  signal incr_addr           : std_logic;
  
  signal AXI_CLK             : std_logic;
  signal AXI_RST_N           : std_logic;
  signal AXI_RESET           : std_logic;

  signal ext_AXI_ReadMOSI  :  AXIReadMOSI_d64 := DefaultAXIReadMOSI_d64;
  signal ext_AXI_ReadMISO  :  AXIReadMISO_d64 := DefaultAXIReadMISO_d64;
  signal ext_AXI_WriteMOSI : AXIWriteMOSI_d64 := DefaultAXIWriteMOSI_d64;
  signal ext_AXI_WriteMISO : AXIWriteMISO_d64 := DefaultAXIWriteMISO_d64;

  

  signal C2C_Mon  : V_IO_C2C_MON_t;
  signal C2C_Ctrl : V_IO_C2C_Ctrl_t;

  signal clk_V_C2C_PHY_user                  : STD_logic;


  signal BRAM_write : std_logic;
  signal BRAM_addr  : std_logic_vector(9 downto 0);
  signal BRAM_WR_data : std_logic_vector(31 downto 0);
  signal BRAM_RD_data : std_logic_vector(31 downto 0);


  signal bram_rst_a    : std_logic;
  signal bram_clk_a    : std_logic;
  signal bram_en_a     : std_logic;
  signal bram_we_a     : std_logic_vector(7 downto 0);
  signal bram_addr_a   : std_logic_vector(8 downto 0);
  signal bram_wrdata_a : std_logic_vector(63 downto 0);
  signal bram_rddata_a : std_logic_vector(63 downto 0);

-- Summer Chain signals

COMPONENT SummerChain_vio
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in2 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    probe_in3 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    probe_in4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_in6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    probe_out4 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;

signal probe_in0  : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal probe_in1  : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal probe_in2  : STD_LOGIC_VECTOR(5 DOWNTO 0);
signal probe_in3  : STD_LOGIC_VECTOR(5 DOWNTO 0);
signal probe_in4  : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal probe_in5  : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal probe_in6  : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal probe_out0 : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal probe_out1 : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal probe_out2 : STD_LOGIC_VECTOR(5 DOWNTO 0);
signal probe_out3 : STD_LOGIC_VECTOR(5 DOWNTO 0);
signal probe_out4 : STD_LOGIC_VECTOR(1 DOWNTO 0);

signal vio_sc_rst   : std_logic := '0';
signal vio_sc_start : std_logic := '0';
signal vio_sc_ena   : std_logic_vector(5 downto 0) := "000000";
signal vio_sc_enb   : std_logic_vector(5 downto 0) := "000000";
signal vio_clk_sel  : std_logic_vector(1 downto 0) := "00";


COMPONENT SummerChain_debug
PORT (
	clk : IN STD_LOGIC;
	probe0 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe4 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe5 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe6 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe7 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe8 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe9 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe10 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe11 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe12 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe13 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe14 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe15 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe16 : IN STD_LOGIC_VECTOR(38 DOWNTO 0); 
	probe17 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe18 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe19 : IN STD_LOGIC_VECTOR(16 DOWNTO 0); 
	probe20 : IN STD_LOGIC_VECTOR(16 DOWNTO 0); 
	probe21 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe22 : IN STD_LOGIC_VECTOR(2 DOWNTO 0); 
	probe23 : IN STD_LOGIC_VECTOR(2 DOWNTO 0); 
	probe24 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe25 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe26 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe27 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe28 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
	probe29 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
	probe30 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe31 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe32 : IN STD_LOGIC_VECTOR(9 DOWNTO 0); 
	probe33 : IN STD_LOGIC_VECTOR(83 DOWNTO 0); 
	probe34 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe35 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe36 : IN STD_LOGIC_VECTOR(9 DOWNTO 0); 
	probe37 : IN STD_LOGIC_VECTOR(45 DOWNTO 0); 
	probe38 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe39 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe40 : IN STD_LOGIC_VECTOR(9 DOWNTO 0); 
	probe41 : IN STD_LOGIC_VECTOR(45 DOWNTO 0); 
	probe42 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe43 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe44 : IN STD_LOGIC_VECTOR(9 DOWNTO 0); 
	probe45 : IN STD_LOGIC_VECTOR(45 DOWNTO 0); 
	probe46 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe47 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe48 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	probe49 : IN STD_LOGIC_VECTOR(45 DOWNTO 0);
	probe50 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe51 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
	probe52 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe53 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe54 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe55 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe56 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe57 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe58 : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
	probe59 : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
	probe60 : IN STD_LOGIC_VECTOR(511 DOWNTO 0);
	probe61 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	probe62 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	probe63 : IN STD_LOGIC_VECTOR(511 DOWNTO 0)
);
END COMPONENT  ;

signal probe0       : std_logic_vector(38 downto 0);
signal probe1       : std_logic_vector(38 downto 0);
signal probe2       : std_logic_vector(38 downto 0);
signal probe3       : std_logic_vector(38 downto 0);
signal probe4       : std_logic_vector(38 downto 0);
signal probe5       : std_logic_vector(38 downto 0);
signal probe6       : std_logic_vector(38 downto 0);
signal probe7       : std_logic_vector(38 downto 0);
signal probe8       : std_logic_vector(38 downto 0);
signal probe9       : std_logic_vector(38 downto 0);
signal probe10      : std_logic_vector(38 downto 0);
signal probe11      : std_logic_vector(38 downto 0);
signal probe12      : std_logic_vector(38 downto 0);
signal probe13      : std_logic_vector(38 downto 0);
signal probe14      : std_logic_vector(38 downto 0);
signal probe15      : std_logic_vector(38 downto 0);
signal probe16      : std_logic_vector(38 downto 0);
signal probe17      : std_logic_vector(0 downto 0);
signal probe18      : std_logic_vector(0 downto 0);
signal probe19      : std_logic_vector(16 downto 0);
signal probe20      : std_logic_vector(16 downto 0);
signal probe21      : std_logic_vector(0 downto 0);
signal probe22      : std_logic_vector(2 downto 0);
signal probe23      : std_logic_vector(2 downto 0);
signal probe24      : std_logic_vector(0 downto 0);
signal probe25      : std_logic_vector(0 downto 0);
signal probe26      : std_logic_vector(0 downto 0);
signal probe27      : std_logic_vector(0 downto 0);
signal probe28      : std_logic_vector(3 downto 0);
signal probe29      : std_logic_vector(3 downto 0);
signal probe30      : std_logic_vector(0 downto 0);
signal probe31      : std_logic_vector(0 downto 0);
signal probe32      : std_logic_vector(9 downto 0);
signal probe33      : std_logic_vector(83 downto 0);
signal probe34      : std_logic_vector(0 downto 0);
signal probe35      : std_logic_vector(0 downto 0);
signal probe36      : std_logic_vector(9 downto 0);
signal probe37      : std_logic_vector(45 downto 0);
signal probe38      : std_logic_vector(0 downto 0);
signal probe39      : std_logic_vector(0 downto 0);
signal probe40      : std_logic_vector(9 downto 0);
signal probe41      : std_logic_vector(45 downto 0);
signal probe42      : std_logic_vector(0 downto 0);
signal probe43      : std_logic_vector(0 downto 0);
signal probe44      : std_logic_vector(9 downto 0);
signal probe45      : std_logic_vector(45 downto 0);
signal probe46      : std_logic_vector(0 downto 0);
signal probe47      : std_logic_vector(0 downto 0);
signal probe48      : std_logic_vector(9 downto 0);
signal probe49      : std_logic_vector(45 downto 0);
signal probe50      : std_logic_vector(0 downto 0);
signal probe51      : std_logic_vector(13 downto 0);
signal probe52      : std_logic_vector(0 downto 0);
signal probe53      : std_logic_vector(0 downto 0);
signal probe54      : std_logic_vector(0 downto 0);
signal probe55      : std_logic_vector(0 downto 0);
signal probe56      : std_logic_vector(0 downto 0);
signal probe57      : std_logic_vector(0 downto 0);
signal probe58      : std_logic_vector(511 downto 0);
signal probe59      : std_logic_vector(511 downto 0);
signal probe60      : std_logic_vector(511 downto 0);
signal probe61      : std_logic_vector(31 downto 0);
signal probe62      : std_logic_vector(7 downto 0);
signal probe63      : std_logic_vector(511 downto 0);

  signal TCRAM_write   : std_logic;
  signal TCRAM_WR_BASE : std_logic;
  signal TCRAM_BASE_ADDR    : std_logic_vector(14 downto 0);
  signal local_addr    : std_logic_vector(14 downto 0);
  signal porta_addrcnt : unsigned(14 downto 0);
  signal TCRAM_WR_data : std_logic_vector(31 downto 0);
  signal TCRAM_RD_data : std_logic_vector(31 downto 0);
  signal TCRAM_FF_MODE : std_logic;
  signal TCRAM_ENA     : std_logic_vector(5 downto 0);
  signal TCRAM_ENB     : std_logic_vector(5 downto 0);
  signal TCRAM_RST     : std_logic;
  signal TCRAM_START   : std_logic;
  signal adra_rst      : std_logic;

  type t_arr_TW_ena      is array(enum_TW_84) of std_logic;
  type t_arr_TW_addrcnt  is array(enum_TW_84) of unsigned(9 downto 0);
  type t_arr_TW_addr     is array(enum_TW_84) of std_logic_vector(9 downto 0);
  type t_arr_TW_dout_FF  is array(enum_TW_84) of std_logic_vector(127 downto 0);
  type t_arr_TW_AXI_Rd   is array(enum_TW_84) of std_logic_vector(31 downto 0);
  
  signal tw_ena          : t_arr_TW_ena;
  signal tw_enb          : t_arr_TW_ena;
  signal tw_wrena        : t_arr_TW_ena;
  signal tw_not_full     : t_arr_TW_ena := (others => '1');
  signal tw_addrcnt      : t_arr_TW_addrcnt;
  signal tw_addr         : t_arr_TW_addr;
  signal tw_wrdata       : t_arr_TW_dout_FF;
  
  signal axiwrdata       : std_logic_vector(127 downto 0) := x"00000000000000000000000000000000";
  signal axiwrdata2      : std_logic_vector(511 downto 0) := x"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  signal tw_rddata       : t_arr_TW_AXI_Rd;

  type t_arr_BW_ena      is array(enum_BW_46) of std_logic;
  type t_arr_BW_addrcnt  is array(enum_BW_46) of unsigned(9 downto 0);
  type t_arr_BW_addr     is array(enum_BW_46) of std_logic_vector(9 downto 0);
  type t_arr_BW_dout_FF  is array(enum_BW_46) of std_logic_vector(127 downto 0);
  type t_arr_BW_AXI_Rd   is array(enum_BW_46) of std_logic_vector(31 downto 0);
  
  signal bw_ena          : t_arr_BW_ena;
  signal bw_enb          : t_arr_BW_ena;
  signal bw_wrena        : t_arr_BW_ena;
  signal bw_not_full     : t_arr_BW_ena := (others => '1');
  signal bw_addrcnt      : t_arr_BW_addrcnt;
  signal bw_addr         : t_arr_BW_addr;
  signal bw_wrdata       : t_arr_BW_dout_FF;

  signal bw_rddata       : t_arr_BW_AXI_Rd;

  type t_arr_TF_ena      is array(enum_TW_84) of std_logic;
  type t_arr_TF_addrcnt  is array(enum_TW_84) of unsigned(13 downto 0);
  type t_arr_TF_addr     is array(enum_TW_84) of std_logic_vector(13 downto 0);
  type t_arr_TF_errcnt   is array(enum_TW_84) of unsigned(31 downto 0);
  type t_arr_TF_errors   is array(enum_TW_84) of std_logic_vector(31 downto 0);
  type t_arr_TF_dout_FF  is array(enum_TW_84) of std_logic_vector(511 downto 0);

  signal tf_ena          : t_arr_TW_ena;
  signal tf_enb          : t_arr_TW_ena;
  signal tf_wrena        : t_arr_TW_ena;
  signal tf_not_full     : t_arr_TW_ena := (others => '1');
  signal tf_addrcnt      : t_arr_TF_addrcnt;
  signal tf_addr         : t_arr_TF_addr;
  signal sim_wrd_cnt     : t_arr_TW_addrcnt;
  signal sim_wrd         : t_arr_TW_addr;
  signal tf_wrdata       : t_arr_TF_dout_FF;
  signal tf_wrdata_1     : t_arr_TF_dout_FF;
  signal tf_wrdata_2     : t_arr_TF_dout_FF;
  --  signal tf_rddata       : t_arr_TF_dout_FF;
  signal tf_rd_AXI_data  : t_arr_TW_AXI_Rd;
  -- Empty field in the output from FT_L1L2 corresponding to disk matches
  constant emptyDiskStub : std_logic_vector(48 downto 0) := (others => '0');

-- TF Simulatator signals
  constant N_SIM_WORDS  : natural := 9;  --! Number of words in TF simulator memory

  type t_arr_TF_sim_addrcnt  is array(enum_TW_84) of unsigned(7 downto 0);
  type t_arr_TF_sim_addr     is array(enum_TW_84) of std_logic_vector(7 downto 0);

  signal tf_sim_addrcnt    : t_arr_TF_sim_addrcnt;
  signal tf_sim_addr       : t_arr_TF_sim_addr;
  signal tf_sim_rddata     : t_arr_TF_dout_FF;
  signal comp_sim_reg      : t_arr_TF_dout_FF;
  signal comp_tf_reg       : t_arr_TF_dout_FF;
  signal comp_err_reg      : t_arr_TF_dout_FF;
  signal comp_valid        : t_arr_TF_ena := (others => '0');
  signal pre_comp_valid_1  : t_arr_TF_ena := (others => '0');
  signal pre_comp_valid_2  : t_arr_TF_ena := (others => '0');
  signal comp_valid_1      : t_arr_TF_ena := (others => '0');
  signal comp_valid_2      : t_arr_TF_ena := (others => '0');
  signal error_flag        : t_arr_TF_ena := (others => '0');
  signal err_count         : t_arr_TF_errcnt := (others => (others => '0'));
  signal errors            : t_arr_TF_errors := (others => (others => '0'));
 
  
  signal sc_rst          : std_logic;
  signal SC_RESET        : std_logic := '1';
  signal START_FIRST_LINK : std_logic := '0';

-- track trigger
    
 -- ########################### Signals ###########################
  -- ### UUT signals ###
  signal IR_start                   : std_logic := '0';
  signal IR_bx_in                   : std_logic_vector(2 downto 0) := (others => '1');
  signal IR_bx_out                  : std_logic_vector(2 downto 0) := (others => '1');
  signal IR_bx_out_vld              : std_logic := '0';
  signal FT_bx_out                  : std_logic_vector(2 downto 0) := (others => '1');
  signal FT_bx_out_vld              : std_logic := '0';
  signal FT_done                    : std_logic := '0';

  -- Signals matching ports of top-level VHDL
  signal DL_39_link_read            : t_arr_DL_39_1b       := (others => '0');
  signal DL_39_link_empty_neg       : t_arr_DL_39_1b       := (others => '0');
  signal DL_39_link_AV_dout         : t_arr_DL_39_DATA     := (others => (others => '0'));
  signal BW_46_stream_AV_din        : t_arr_BW_46_DATA     := (others => (others => '0'));
  signal BW_46_stream_A_full_neg    : t_arr_BW_46_1b       := (others => '1');
  signal BW_46_stream_A_write       : t_arr_BW_46_1b       := (others => '0');
  signal TW_84_stream_AV_din        : t_arr_TW_84_DATA     := (others => (others => '0'));
  signal TW_84_stream_A_full_neg    : t_arr_TW_84_1b       := (others => '1');
  signal TW_84_stream_A_write       : t_arr_TW_84_1b       := (others => '0');
    
  -- input memory address registers
  type t_arr_DL_addrcnt  is array(enum_DL_39) of unsigned(11 downto 0);
  type t_arr_DL_addr     is array(enum_DL_39) of std_logic_vector(11 downto 0);
  
  signal dl_addrcnt      : t_arr_DL_addrcnt;
  signal dl_addr         : t_arr_DL_addr;
  
begin  -- architecture structure

  --Clocking
  Local_Clocking_1: entity work.Local_Clocking
    port map (
      clk_200   => clk_200,
      clk_50    => clk_50,
      clk_axi   => AXI_CLK,
      clk_250   => clk_250,
      clk_150   => clk_150,
      clk_300   => clk_300,
      reset     => '0',
      locked    => locked_clk200,
      clk_in1_p => p_clk_200a,
      clk_in1_n => n_clk_200a);

--   BUFGMUX_A : BUFGMUX
--   port map (
--      O => clk_a,   -- 1-bit output: Clock output
--      I0 => clk_50, -- 1-bit input: Clock input (S=0)
--      I1 => clk_150, -- 1-bit input: Clock input (S=1)
--      S => vio_clk_sel(0)    -- 1-bit input: Clock select
--   );
--   BUFGMUX_B : BUFGMUX
--   port map (
--      O => clk_b,   -- 1-bit output: Clock output
--      I0 => clk_200, -- 1-bit input: Clock input (S=0)
--      I1 => clk_250, -- 1-bit input: Clock input (S=1)
--      S => vio_clk_sel(0)    -- 1-bit input: Clock select
--   );
--   BUFGMUX_C : BUFGMUX
--   port map (
--      O => sc_clk,   -- 1-bit output: Clock output
--      I0 => clk_a, -- 1-bit input: Clock input (S=0)
--      I1 => clk_b, -- 1-bit input: Clock input (S=1)
--      S => vio_clk_sel(1)    -- 1-bit input: Clock select
--   );
  

  c2csslave_wrapper_1: entity work.c2cslave_wrapper
    port map (
      AXI_CLK                               => AXI_CLK,
      AXI_RST_N(0)                          => AXI_RST_N,
      V_C2C_phy_Rx_rxn                  => n_mgt_z2v,
      V_C2C_phy_Rx_rxp                  => p_mgt_z2v,
      V_C2C_phy_Tx_txn                  => n_mgt_v2z,
      V_C2C_phy_Tx_txp                  => p_mgt_v2z,
      V_C2C_phy_refclk_clk_n            => n_util_clk_chan0,
      V_C2C_phy_refclk_clk_p            => p_util_clk_chan0,
      clk50Mhz                              => clk_50,
      
      V_IO_araddr                           => local_AXI_ReadMOSI(0).address,              
      V_IO_arprot                           => local_AXI_ReadMOSI(0).protection_type,      
      V_IO_arready                          => local_AXI_ReadMISO(0).ready_for_address,    
      V_IO_arvalid                          => local_AXI_ReadMOSI(0).address_valid,        
      V_IO_awaddr                           => local_AXI_WriteMOSI(0).address,             
      V_IO_awprot                           => local_AXI_WriteMOSI(0).protection_type,     
      V_IO_awready                          => local_AXI_WriteMISO(0).ready_for_address,   
      V_IO_awvalid                          => local_AXI_WriteMOSI(0).address_valid,       
      V_IO_bready                           => local_AXI_WriteMOSI(0).ready_for_response,  
      V_IO_bresp                            => local_AXI_WriteMISO(0).response,            
      V_IO_bvalid                           => local_AXI_WriteMISO(0).response_valid,      
      V_IO_rdata                            => local_AXI_ReadMISO(0).data,                 
      V_IO_rready                           => local_AXI_ReadMOSI(0).ready_for_data,       
      V_IO_rresp                            => local_AXI_ReadMISO(0).response,             
      V_IO_rvalid                           => local_AXI_ReadMISO(0).data_valid,           
      V_IO_wdata                            => local_AXI_WriteMOSI(0).data,                
      V_IO_wready                           => local_AXI_WriteMISO(0).ready_for_data,       
      V_IO_wstrb                            => local_AXI_WriteMOSI(0).data_write_strobe,   
      V_IO_wvalid                           => local_AXI_WriteMOSI(0).data_valid,
                                            
      CM_V_INFO_araddr                      => local_AXI_ReadMOSI(1).address,              
      CM_V_INFO_arprot                      => local_AXI_ReadMOSI(1).protection_type,      
      CM_V_INFO_arready                     => local_AXI_ReadMISO(1).ready_for_address,    
      CM_V_INFO_arvalid                     => local_AXI_ReadMOSI(1).address_valid,        
      CM_V_INFO_awaddr                      => local_AXI_WriteMOSI(1).address,             
      CM_V_INFO_awprot                      => local_AXI_WriteMOSI(1).protection_type,     
      CM_V_INFO_awready                     => local_AXI_WriteMISO(1).ready_for_address,   
      CM_V_INFO_awvalid                     => local_AXI_WriteMOSI(1).address_valid,       
      CM_V_INFO_bready                      => local_AXI_WriteMOSI(1).ready_for_response,  
      CM_V_INFO_bresp                       => local_AXI_WriteMISO(1).response,            
      CM_V_INFO_bvalid                      => local_AXI_WriteMISO(1).response_valid,      
      CM_V_INFO_rdata                       => local_AXI_ReadMISO(1).data,                 
      CM_V_INFO_rready                      => local_AXI_ReadMOSI(1).ready_for_data,       
      CM_V_INFO_rresp                       => local_AXI_ReadMISO(1).response,             
      CM_V_INFO_rvalid                      => local_AXI_ReadMISO(1).data_valid,           
      CM_V_INFO_wdata                       => local_AXI_WriteMOSI(1).data,                
      CM_V_INFO_wready                      => local_AXI_WriteMISO(1).ready_for_data,       
      CM_V_INFO_wstrb                       => local_AXI_WriteMOSI(1).data_write_strobe,   
      CM_V_INFO_wvalid                      => local_AXI_WriteMOSI(1).data_valid,
      

      VIRTEX_IPBUS_araddr                   => ext_AXI_ReadMOSI.address,              
      VIRTEX_IPBUS_arburst                  => ext_AXI_ReadMOSI.burst_type,
      VIRTEX_IPBUS_arcache                  => ext_AXI_ReadMOSI.cache_type,
      VIRTEX_IPBUS_arlen                    => ext_AXI_ReadMOSI.burst_length,
      VIRTEX_IPBUS_arlock(0)                => ext_AXI_ReadMOSI.lock_type,
      VIRTEX_IPBUS_arprot                   => ext_AXI_ReadMOSI.protection_type,      
      VIRTEX_IPBUS_arqos                    => ext_AXI_ReadMOSI.qos,
      VIRTEX_IPBUS_arready(0)               => ext_AXI_ReadMISO.ready_for_address,
      VIRTEX_IPBUS_arregion                 => ext_AXI_ReadMOSI.region,
      VIRTEX_IPBUS_arsize                   => ext_AXI_ReadMOSI.burst_size,
      VIRTEX_IPBUS_arvalid(0)               => ext_AXI_ReadMOSI.address_valid,        
      VIRTEX_IPBUS_awaddr                   => ext_AXI_WriteMOSI.address,             
      VIRTEX_IPBUS_awburst                  => ext_AXI_WriteMOSI.burst_type,
      VIRTEX_IPBUS_awcache                  => ext_AXI_WriteMOSI.cache_type,
      VIRTEX_IPBUS_awlen                    => ext_AXI_WriteMOSI.burst_length,
      VIRTEX_IPBUS_awlock(0)                => ext_AXI_WriteMOSI.lock_type,
      VIRTEX_IPBUS_awprot                   => ext_AXI_WriteMOSI.protection_type,
      VIRTEX_IPBUS_awqos                    => ext_AXI_WriteMOSI.qos,
      VIRTEX_IPBUS_awready(0)               => ext_AXI_WriteMISO.ready_for_address,   
      VIRTEX_IPBUS_awregion                 => ext_AXI_WriteMOSI.region,
      VIRTEX_IPBUS_awsize                   => ext_AXI_WriteMOSI.burst_size,
      VIRTEX_IPBUS_awvalid(0)               => ext_AXI_WriteMOSI.address_valid,       
      VIRTEX_IPBUS_bready(0)                => ext_AXI_WriteMOSI.ready_for_response,  
      VIRTEX_IPBUS_bresp                    => ext_AXI_WriteMISO.response,            
      VIRTEX_IPBUS_bvalid(0)                => ext_AXI_WriteMISO.response_valid,      
      VIRTEX_IPBUS_rdata                    => ext_AXI_ReadMISO.data,
      VIRTEX_IPBUS_rlast(0)                 => ext_AXI_ReadMISO.last,
      VIRTEX_IPBUS_rready(0)                => ext_AXI_ReadMOSI.ready_for_data,       
      VIRTEX_IPBUS_rresp                    => ext_AXI_ReadMISO.response,             
      VIRTEX_IPBUS_rvalid(0)                => ext_AXI_ReadMISO.data_valid,           
      VIRTEX_IPBUS_wdata                    => ext_AXI_WriteMOSI.data,
      VIRTEX_IPBUS_wlast(0)                 => ext_AXI_WriteMOSI.last,
      VIRTEX_IPBUS_wready(0)                => ext_AXI_WriteMISO.ready_for_data,       
      VIRTEX_IPBUS_wstrb                    => ext_AXI_WriteMOSI.data_write_strobe,   
      VIRTEX_IPBUS_wvalid(0)                => ext_AXI_WriteMOSI.data_valid,          
      reset_n                               => locked_clk200,--reset,

      V_C2C_PHY_DEBUG_cplllock(0)         => C2C_Mon.DEBUG.CPLL_LOCK,
      V_C2C_PHY_DEBUG_dmonitorout         => C2C_Mon.DEBUG.DMONITOR,
      V_C2C_PHY_DEBUG_eyescandataerror(0) => C2C_Mon.DEBUG.EYESCAN_DATA_ERROR,
      
      V_C2C_PHY_DEBUG_eyescanreset(0)     => C2C_Ctrl.DEBUG.EYESCAN_RESET,
      V_C2C_PHY_DEBUG_eyescantrigger(0)   => C2C_Ctrl.DEBUG.EYESCAN_TRIGGER,
      V_C2C_PHY_DEBUG_pcsrsvdin           => C2C_Ctrl.DEBUG.PCS_RSV_DIN,
      V_C2C_PHY_DEBUG_qplllock(0)         => C2C_Mon.DEBUG.QPLL_LOCK,
      V_C2C_PHY_DEBUG_rxbufreset(0)       => C2C_Ctrl.DEBUG.RX.BUF_RESET,
      V_C2C_PHY_DEBUG_rxbufstatus         => C2C_Mon.DEBUG.RX.BUF_STATUS,
      V_C2C_PHY_DEBUG_rxcdrhold(0)        => C2C_Ctrl.DEBUG.RX.CDR_HOLD,
      V_C2C_PHY_DEBUG_rxdfelpmreset(0)    => C2C_Ctrl.DEBUG.RX.DFE_LPM_RESET,
      V_C2C_PHY_DEBUG_rxlpmen(0)          => C2C_Ctrl.DEBUG.RX.LPM_EN,
      V_C2C_PHY_DEBUG_rxpcsreset(0)       => C2C_Ctrl.DEBUG.RX.PCS_RESET,
      V_C2C_PHY_DEBUG_rxpmareset(0)       => C2C_Ctrl.DEBUG.RX.PMA_RESET,
      V_C2C_PHY_DEBUG_rxpmaresetdone      => open,--C2C_Mon.DEBUG.RX.RESET_DONE,
      V_C2C_PHY_DEBUG_rxprbscntreset(0)   => C2C_Ctrl.DEBUG.RX.PRBS_CNT_RST,
      V_C2C_PHY_DEBUG_rxprbserr(0)        => C2C_Mon.DEBUG.RX.PRBS_ERR,
      V_C2C_PHY_DEBUG_rxprbssel           => C2C_Ctrl.DEBUG.RX.PRBS_SEL,
      V_C2C_PHY_DEBUG_rxrate              => C2C_Ctrl.DEBUG.RX.RATE,
      V_C2C_PHY_DEBUG_rxresetdone(0)      => C2C_Mon.DEBUG.RX.RESET_DONE,
      V_C2C_PHY_DEBUG_txbufstatus         => C2C_Mon.DEBUG.TX.BUF_STATUS,
      V_C2C_PHY_DEBUG_txdiffctrl          => C2C_Ctrl.DEBUG.TX.DIFF_CTRL,
      V_C2C_PHY_DEBUG_txinhibit(0)        => C2C_Ctrl.DEBUG.TX.INHIBIT,
      V_C2C_PHY_DEBUG_txpcsreset(0)       => C2C_Ctrl.DEBUG.TX.PCS_RESET,
      V_C2C_PHY_DEBUG_txpmareset(0)       => C2C_Ctrl.DEBUG.TX.PMA_RESET,
      V_C2C_PHY_DEBUG_txpolarity(0)       => C2C_Ctrl.DEBUG.TX.POLARITY,
      V_C2C_PHY_DEBUG_txpostcursor        => C2C_Ctrl.DEBUG.TX.POST_CURSOR,
      V_C2C_PHY_DEBUG_txprbsforceerr(0)   => C2C_Ctrl.DEBUG.TX.PRBS_FORCE_ERR,
      V_C2C_PHY_DEBUG_txprbssel           => C2C_Ctrl.DEBUG.TX.PRBS_SEL,
      V_C2C_PHY_DEBUG_txprecursor         => C2C_Ctrl.DEBUG.TX.PRE_CURSOR,
      V_C2C_PHY_DEBUG_txresetdone(0)      => C2C_MON.DEBUG.TX.RESET_DONE,

      V_C2C_PHY_STATUS_channel_up         => C2C_Mon.STATUS.CHANNEL_UP,      
      V_C2C_PHY_STATUS_gt_pll_lock        => C2C_MON.STATUS.PHY_GT_PLL_LOCK,
      V_C2C_PHY_STATUS_hard_err           => C2C_Mon.STATUS.PHY_HARD_ERR,
      V_C2C_PHY_STATUS_lane_up            => C2C_Mon.STATUS.PHY_LANE_UP(0 downto 0),
      V_C2C_PHY_STATUS_mmcm_not_locked    => C2C_Mon.STATUS.PHY_MMCM_LOL,
      V_C2C_PHY_STATUS_soft_err           => C2C_Mon.STATUS.PHY_SOFT_ERR,

      V_C2C_aurora_do_cc                => C2C_Mon.STATUS.DO_CC,
      V_C2C_axi_c2c_config_error_out    => C2C_Mon.STATUS.CONFIG_ERROR,
      V_C2C_axi_c2c_link_status_out     => C2C_MON.STATUS.LINK_GOOD,
      V_C2C_axi_c2c_multi_bit_error_out => C2C_MON.STATUS.MB_ERROR,
      V_C2C_phy_power_down              => '0',
      V_C2C_PHY_user_clk_out            => clk_V_C2C_PHY_user,

      VIRTEX_SYS_MGMT_sda                   =>v_fpga_i2c_sda,
      VIRTEX_SYS_MGMT_scl                   =>v_fpga_i2c_scl
);

  RGB_pwm_1: entity work.RGB_pwm
    generic map (
      CLKFREQ => 200000000,
      RGBFREQ => 1000)
    port map (
      clk        => clk_200,
      redcount   => led_red_local,
      greencount => led_green_local,
      bluecount  => led_blue_local,
      LEDred     => led_red,
      LEDgreen   => led_green,
      LEDblue    => led_blue);

  rate_counter_1: entity work.rate_counter
    generic map (
      CLK_A_1_SECOND => 2000000)
    port map (
      clk_A         => clk_200,
      clk_B         => clk_V_C2C_PHY_user,
      reset_A_async => AXI_RESET,
      event_b       => '1',
      rate          => C2C_Mon.USER_FREQ);

  V_IO_interface_1: entity work.V_IO_map
    port map (
      clk_axi         => AXI_CLK,
      reset_axi_n     => AXI_RST_N,
      slave_readMOSI  => local_AXI_readMOSI(0),
      slave_readMISO  => local_AXI_readMISO(0),
      slave_writeMOSI => local_AXI_writeMOSI(0),
      slave_writeMISO => local_AXI_writeMISO(0),
      slave_rd_ack    => local_AXI_RdAck,
      Mon.C2C                 => C2C_Mon,
      Mon.CLK_200_LOCKED      => locked_clk200,
      Mon.BRAM.RD_DATA        => BRAM_RD_DATA,
      Mon.TCRAM.RD_DATA       => TCRAM_RD_DATA,
      Mon.TCRAM.ADDR          => local_addr,
      Ctrl.C2C                => C2C_Ctrl,
      Ctrl.RGB.R              => led_red_local,
      Ctrl.RGB.G              => led_green_local,
      Ctrl.RGB.B              => led_blue_local,
      Ctrl.BRAM.WRITE         => BRAM_WRITE,
      Ctrl.BRAM.ADDR(9 downto 0) => BRAM_ADDR,
      Ctrl.BRAM.ADDR(14 downto 10) => open,
      Ctrl.BRAM.WR_DATA       => BRAM_WR_DATA,
      Ctrl.TCRAM.WRITE         => TCRAM_WRITE,
      Ctrl.TCRAM.WR_BASE       => TCRAM_WR_BASE,
      Ctrl.TCRAM.BASE_ADDR     => TCRAM_BASE_ADDR,
      Ctrl.TCRAM.WR_DATA       => TCRAM_WR_DATA,
      Ctrl.TCRAM.FF_MODE       => TCRAM_FF_MODE,
      Ctrl.TCRAM.ENA       => TCRAM_ENA,
      Ctrl.TCRAM.ENB       => TCRAM_ENB,
      Ctrl.TCRAM.RST       => TCRAM_RST,
      Ctrl.TCRAM.START     => TCRAM_START
      );

  CM_V_info_1: entity work.CM_V_info
    port map (
      clk_axi     => AXI_CLK,
      reset_axi_n => AXI_RST_N,
      readMOSI    => local_AXI_ReadMOSI(1),
      readMISO    => local_AXI_ReadMISO(1),
      writeMOSI   => local_AXI_WriteMOSI(1),
      writeMISO   => local_AXI_WriteMISO(1));


  AXI_RESET <= not AXI_RST_N;



  axi_bram_controller_1: entity work.axi_bram_controller
    generic map (
      USE_D64_PKG                   => 1,
      C_ADR_WIDTH                   => 32,
      C_DATA_WIDTH                  => 64,
      C_FAMILY                      => "virtexuplus",
      C_MEMORY_DEPTH                => 4096,
      C_BRAM_ADDR_WIDTH             => 12,
      C_SINGLE_PORT_BRAM            => 1,
      C_S_AXI_ID_WIDTH              => 0,
      C_S_AXI_PROTOCOL              => "AXI4",
      C_S_AXI_DATA_WIDTH            => 64)
    port map (
      s_axi_aclk    => AXI_CLK,
      s_axi_aresetn => AXI_RST_N,
      r_mosi_d64        => ext_AXI_ReadMOSI,
      r_miso_d64        => ext_AXI_ReadMISO,
      w_mosi_d64        => ext_AXI_WriteMOSI,
      w_miso_d64        => ext_AXI_WriteMISO,
      bram_rst_a    => bram_rst_a,
      bram_clk_a    => bram_clk_a,
      bram_en_a     => bram_en_a,
      bram_we_a     => bram_we_a,
      bram_addr_a(31 downto 11) => open,
      bram_addr_a(10 downto  2) => bram_addr_a,
      bram_addr_a( 1 downto  0) => open,
      bram_wrdata_a => bram_wrdata_a,
      bram_rddata_a => bram_rddata_a);

  asym_ram_tdp_1: entity work.asym_ram_tdp
    generic map (
      WIDTHA     => 32,
      SIZEA      => 1024,
      ADDRWIDTHA => 10,
      WIDTHB     => 64,
      SIZEB      => 512,
      ADDRWIDTHB => 9)
    port map (
      clkA  => AXI_CLK,
      clkB  => AXI_CLK,
      enA   => '1',
      enB   => bram_en_a,
      weA   => BRAM_WRITE,
      weB   => or_reduce(bram_we_a),
      addrA => BRAM_ADDR,
      addrB => bram_addr_a,
      diA   => BRAM_WR_DATA,
      diB   => bram_wrdata_a,
      doA   => BRAM_RD_DATA,
      doB   => bram_rddata_a);


-- Summer Chain Testing


--  sc_clk <= clk_250;
  sc_clk <= clk_250;
  
  
--Event_input_1 : input_mems
--  PORT MAP(
--    CLK        => sc_clk,
--    RST        => sc_rst,
--    RENA       => DL_39_link_read,
--    EMPTY_B    => DL_39_link_empty_neg,
--	DL_39_PS10G_1_A => DL_39_link_AV_dout(PS10G_1_A),
--	DL_39_PS10G_2_A => DL_39_link_AV_dout(PS10G_2_A),
--	DL_39_PS10G_2_B => DL_39_link_AV_dout(PS10G_2_B),
--	DL_39_PS10G_3_A => DL_39_link_AV_dout(PS10G_3_A),
--	DL_39_PS10G_3_B => DL_39_link_AV_dout(PS10G_3_B),
--	DL_39_PS_1_A => DL_39_link_AV_dout(PS_1_A),
--	DL_39_PS_1_B => DL_39_link_AV_dout(PS_1_B),
--	DL_39_PS_2_A => DL_39_link_AV_dout(PS_2_A),
--	DL_39_PS_2_B => DL_39_link_AV_dout(PS_2_B),
--	DL_39_2S_1_A => DL_39_link_AV_dout(twoS_1_A),
--	DL_39_2S_1_B => DL_39_link_AV_dout(twoS_1_B),
--	DL_39_2S_2_A => DL_39_link_AV_dout(twoS_2_A),
--	DL_39_2S_2_B => DL_39_link_AV_dout(twoS_2_B),
--	DL_39_2S_3_A => DL_39_link_AV_dout(twoS_3_A),
--	DL_39_2S_3_B => DL_39_link_AV_dout(twoS_3_B),
--	DL_39_2S_4_A => DL_39_link_AV_dout(twoS_4_A),
--	DL_39_2S_4_B => DL_39_link_AV_dout(twoS_4_B)
--  );

ROM_DL_PS10G_1_A_04_i : ROM_DL_PS10G_1_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS10G_1_A),
    douta => DL_39_link_AV_dout(PS10G_1_A)
  );
ROM_DL_PS10G_2_A_04_i : ROM_DL_PS10G_2_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS10G_2_A),
    douta => DL_39_link_AV_dout(PS10G_2_A)
  );
ROM_DL_PS10G_2_B_04_i : ROM_DL_PS10G_2_B_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS10G_2_B),
    douta => DL_39_link_AV_dout(PS10G_2_B)
  );
ROM_DL_PS10G_3_A_04_i : ROM_DL_PS10G_3_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS10G_3_A),
    douta => DL_39_link_AV_dout(PS10G_3_A)
  );
ROM_DL_PS10G_3_B_04_i : ROM_DL_PS10G_3_B_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS10G_3_B),
    douta => DL_39_link_AV_dout(PS10G_3_B)
  );
ROM_DL_PS_1_A_04_i : ROM_DL_PS_1_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS_1_A),
    douta => DL_39_link_AV_dout(PS_1_A)
  );
ROM_DL_PS_1_B_04_i : ROM_DL_PS_1_B_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS_1_B),
    douta => DL_39_link_AV_dout(PS_1_B)
  );
ROM_DL_PS_2_A_04_i : ROM_DL_PS_2_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS_2_A),
    douta => DL_39_link_AV_dout(PS_2_A)
  );
ROM_DL_PS_2_B_04_i : ROM_DL_PS_2_B_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(PS_2_B),
    douta => DL_39_link_AV_dout(PS_2_B)
  );
ROM_DL_2S_1_A_04_i : ROM_DL_2S_1_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(twoS_1_A),
    douta => DL_39_link_AV_dout(twoS_1_A)
  );
ROM_DL_2S_1_B_04_i : ROM_DL_2S_1_B_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(twoS_1_B),
    douta => DL_39_link_AV_dout(twoS_1_B)
  );
ROM_DL_2S_2_A_04_i : ROM_DL_2S_2_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(twoS_2_A),
    douta => DL_39_link_AV_dout(twoS_2_A)
  );
ROM_DL_2S_2_B_04_i : ROM_DL_2S_2_B_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(twoS_2_B),
    douta => DL_39_link_AV_dout(twoS_2_B)
  );
ROM_DL_2S_3_A_04_i : ROM_DL_2S_3_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(twoS_3_A),
    douta => DL_39_link_AV_dout(twoS_3_A)
  );
ROM_DL_2S_3_B_04_i : ROM_DL_2S_3_B_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(twoS_3_B),
    douta => DL_39_link_AV_dout(twoS_3_B)
  );
ROM_DL_2S_4_A_04_i : ROM_DL_2S_4_A_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(twoS_4_A),
    douta => DL_39_link_AV_dout(twoS_4_A)
  );
ROM_DL_2S_4_B_04_i : ROM_DL_2S_4_B_04
  PORT MAP (
    clka => sc_clk,
    addra => dl_addr(twoS_4_B),
    douta => DL_39_link_AV_dout(twoS_4_B)
  );

DL_ADDR_loop : for var in enum_dl_39 generate
  constant N_EVENTS  : natural := 20;  --! Number of events in data link input memory
begin
  rd_dl_addr: process (sc_clk) is
  begin  -- process rd_dl_addr
    if sc_clk'event and sc_clk = '1' then  -- rising clock edge
      if sc_rst = '1' then
        dl_addrcnt(var) <= (others => '0');
      else
        if DL_39_link_read(var) = '1' and dl_addrcnt(var) < (N_EVENTS*MAX_ENTRIES-1) then
          dl_addrcnt(var) <= dl_addrcnt(var) + 1;
        else
          dl_addrcnt(var) <= (others => '0');
        end if;
      end if;
    end if;
  end process rd_dl_addr;
  dl_addr(var)   <= std_logic_vector(dl_addrcnt(var));
  DL_39_link_empty_neg(var) <= '1';
end generate DL_ADDR_loop;


  sc_rst <= SC_RESET OR TCRAM_RST OR AXI_RESET OR vio_sc_rst;
  START_FIRST_LINK    <=  TCRAM_START OR vio_sc_start;
      
  procStart : process(sc_clk)
    -- Process to start first module in chain & generate its BX counter input.
    -- Also releases reset flag.
    constant CLK_RESET : natural := 5; -- Any low number OK.
    variable CLK_COUNT : natural := MAX_ENTRIES - CLK_RESET;
    variable EVENT_COUNT : integer := -1;
  begin
  
    if (vio_sc_rst = '1') then
      SC_RESET <= '1';
      IR_START <= '0';
      IR_BX_IN <= "111";
    end if;
    
    if START_FIRST_LINK= '1' then
      if rising_edge(sc_clk) then
        if (CLK_COUNT < MAX_ENTRIES) then
          CLK_COUNT := CLK_COUNT + 1;
        else
          CLK_COUNT := 1;
          EVENT_COUNT := EVENT_COUNT + 1;

          IR_START <= '1';
          IR_BX_IN <= std_logic_vector(to_unsigned(EVENT_COUNT, IR_BX_IN'length));

        end if;
        -- Releae
        if (CLK_COUNT = MAX_ENTRIES) then 
          SC_RESET <= '0';
        end if;
      end if;
    end if;
  end process procStart;


SectorProcessor_1: entity work.SectorProcessor
 port map (
    clk => sc_clk,
    reset => sc_rst,
    ir_start => IR_START,
    IR_BX_IN => IR_BX_IN,
    FT_BX_out => FT_BX_out,
    FT_BX_OUT_VLD => FT_BX_OUT_VLD,
    FT_DONE => FT_DONE,
    DL_39_link_AV_dout       => DL_39_link_AV_dout,
    DL_39_link_empty_neg     => DL_39_link_empty_neg,
    DL_39_link_read          => DL_39_link_read,
    TW_84_stream_AV_din      => TW_84_stream_AV_din,
    TW_84_stream_A_full_neg  => TW_84_stream_A_full_neg,
    TW_84_stream_A_write     => TW_84_stream_A_write,
    BW_46_stream_AV_din      => BW_46_stream_AV_din,
    BW_46_stream_A_full_neg  => BW_46_stream_A_full_neg,
    BW_46_stream_A_write     => BW_46_stream_A_write
  );

tw_ena(L1L2) <= TCRAM_ENA(4) OR vio_sc_ena(4);
tw_enb(L1L2) <= TCRAM_ENB(4) OR vio_sc_enb(4);

  incr_addr <= local_AXI_RdAck;
  adra_rst <= TCRAM_RST OR AXI_RESET;

  Increment_addr : process (AXI_CLK) is 
  begin 
    if AXI_CLK'event and AXI_CLK = '1' then  -- rising clock edge
      if adra_rst = '1' then
        porta_addrcnt <= (others => '0');
      else
        if TCRAM_WR_BASE = '1' then
          porta_addrcnt <= unsigned(TCRAM_BASE_ADDR);
        elsif incr_addr = '1' AND TCRAM_FF_MODE = '1' then
          porta_addrcnt <= porta_addrcnt + 1;
        end if;
      end if;
    end if;
  end process Increment_addr;
    
  local_addr   <= std_logic_vector(porta_addrcnt);
  axiwrdata    <= x"0000000000000000" & x"0" & "00" & tw_addr(L1L2) & "000" & ir_start & "0" & IR_BX_IN & "0" & FT_BX_out & "00" & FT_BX_OUT_VLD & FT_DONE & TCRAM_WR_DATA;
  axiwrdata2   <= x"00000000000000000000000000000000" & x"00000000000000000000000000000000" & x"00000000000000000000000000000000" & x"0000000000000000" & "00" & tf_addr(L1L2) & "000" & ir_start & "0" & IR_BX_IN & "0" & FT_BX_out & "00" & FT_BX_OUT_VLD & FT_DONE & TCRAM_WR_DATA;


TW_84_loop : for var in enum_TW_84 generate
begin

  fill_mem: process (sc_clk) is
  begin  -- process fill_mem
    if sc_clk'event and sc_clk = '1' then  -- rising clock edge
      if sc_rst = '1' then
        tw_addrcnt(var) <= (others => '0');
        tw_not_full(var) <= '1';
      else
        if TW_84_stream_A_write(var) = '1' then
          tw_addrcnt(var) <= tw_addrcnt(var) + 4;
        end if;
      end if;
      if tw_addrcnt(var) >= 1020 and tw_not_full(var) = '1' then
        tw_not_full(var) <= '0';
      end if;
    end if;
  end process fill_mem;
  
  mem_full: process (tw_addrcnt(var)) is
  begin  -- process mem_full
--      if tw_addrcnt(var) < 1020 then
--        TW_84_stream_A_full_neg(var) <= '1';
--      else
--        TW_84_stream_A_full_neg(var) <= '0';
--      end if;
      TW_84_stream_A_full_neg(var) <= '1';
end process mem_full;
   
  tw_addr(var)      <= std_logic_vector(tw_addrcnt(var));
  tw_wrdata(var)    <= x"ADD3" & x"0" & "00" & tw_addr(var)  & x"000" & TW_84_stream_AV_din(var);
  tw_wrena(var)     <= TW_84_stream_A_write(var) and tw_not_full(var);
  
Summer_Chain_MEM : Test_Chain_Mem_1
  PORT MAP (
    clka   => AXI_CLK,
    ena    => tw_ena(var),
    wea(0) => TCRAM_WRITE,
    addra  => local_addr(9 downto 0),
    dina   => axiwrdata,
    douta  => tw_rddata(var),
    clkb   => sc_clk,
    enb    => tw_enb(var),
    web(0) => tw_wrena(var),
    addrb  => tw_addr(var),
    dinb   => tw_wrdata(var),
    doutb  => open
  );
end generate TW_84_loop;

bw_ena(L1L2_L3) <= TCRAM_ENA(0) OR vio_sc_ena(0);
bw_ena(L1L2_L4) <= TCRAM_ENA(1) OR vio_sc_ena(1);
bw_ena(L1L2_L5) <= TCRAM_ENA(2) OR vio_sc_ena(2);
bw_ena(L1L2_L6) <= TCRAM_ENA(3) OR vio_sc_ena(3);
bw_enb(L1L2_L3) <= TCRAM_ENB(0) OR vio_sc_enb(0);
bw_enb(L1L2_L4) <= TCRAM_ENB(1) OR vio_sc_enb(1);
bw_enb(L1L2_L5) <= TCRAM_ENB(2) OR vio_sc_enb(2);
bw_enb(L1L2_L6) <= TCRAM_ENB(3) OR vio_sc_enb(3);


BW_46_loop : for var in enum_BW_46 generate
begin

  fill_mem: process (sc_clk) is
  begin  -- process fill_mem
    if sc_clk'event and sc_clk = '1' then  -- rising clock edge
      if sc_rst = '1' then
        bw_addrcnt(var) <= (others => '0');
        bw_not_full(var) <= '1';
      else
        if BW_46_stream_A_write(var) = '1' then
          bw_addrcnt(var) <= bw_addrcnt(var) + 4;
        end if;
      end if;
      if bw_addrcnt(var) >= 1020 and bw_not_full(var) = '1' then
        bw_not_full(var) <= '0';
      end if;
    end if;
  end process fill_mem;
  
  mem_full: process (bw_addrcnt(var)) is
  begin  -- process mem_full
--      if bw_addrcnt(var) < 1020 then
--        BW_46_stream_A_full_neg(var) <= '1';
--      else
--        BW_46_stream_A_full_neg(var) <= '0';
--      end if;
      BW_46_stream_A_full_neg(var) <= '1';
  end process mem_full;
   
  bw_addr(var)      <= std_logic_vector(bw_addrcnt(var));
  bw_wrdata(var)    <= x"ADD3" & x"0" & "00" & bw_addr(var) & x"00000000" & x"0000" & "00" & BW_46_stream_AV_din(var);
  bw_wrena(var)     <= BW_46_stream_A_write(var) and bw_not_full(var);
  
Summer_Chain_MEM : Test_Chain_Mem_1
  PORT MAP (
    clka   => AXI_CLK,
    ena    => bw_ena(var),
    wea(0) => TCRAM_WRITE,
    addra  => local_addr(9 downto 0),
    dina   => axiwrdata,
    douta  => bw_rddata(var),
    clkb   => sc_clk,
    enb    => bw_enb(var),
    web(0) => bw_wrena(var),
    addrb  => bw_addr(var),
    dinb   => bw_wrdata(var),
    doutb  => open
  );
end generate BW_46_loop;

mem_mux: process (TCRAM_ENA, tw_rddata, bw_rddata, tf_rd_AXI_data) is
  begin  -- process mem_mux
   case (TCRAM_ENA) is
      when "000001" =>
         TCRAM_RD_DATA <= tw_rddata(L1L2);
      when "000010" =>
         TCRAM_RD_DATA <= bw_rddata(L1L2_L3);
      when "000100" =>
         TCRAM_RD_DATA <= bw_rddata(L1L2_L4);
      when "001000" =>
         TCRAM_RD_DATA <= bw_rddata(L1L2_L5);
      when "010000" =>
         TCRAM_RD_DATA <= bw_rddata(L1L2_L6);
      when "100000" =>
         TCRAM_RD_DATA <= tf_rd_AXI_data(L1L2);
      when others =>
         TCRAM_RD_DATA <= x"BADFEED5";
   end case;
end process mem_mux;

tf_ena(L1L2) <= TCRAM_ENA(5) OR vio_sc_ena(5);
tf_enb(L1L2) <= TCRAM_ENB(5) OR vio_sc_enb(5);

TF_464_loop : for var in enum_TW_84 generate
begin

  fill_mem: process (sc_clk) is
  begin  -- process fill_mem
    if sc_clk'event and sc_clk = '1' then  -- rising clock edge
      if sc_rst = '1' then
        tf_addrcnt(var) <= (others => '0');
        tf_not_full(var) <= '1';
      else
        if TW_84_stream_A_write(var) = '1' then
          tf_addrcnt(var) <= tf_addrcnt(var) + 16;
        end if;
      end if;
      if tf_addrcnt(var) >= 16368 and tf_not_full(var) = '1' then
        tf_not_full(var) <= '0';
      end if;
    end if;
  end process fill_mem;
  sim_word_cnt: process (sc_clk) is
  begin  -- process sim_word_cnt
    if sc_clk'event and sc_clk = '1' then  -- rising clock edge
      if sc_rst = '1' then
        sim_wrd_cnt(var) <= (others => '0');
      else
        if TW_84_stream_A_write(var) = '1' and sim_wrd_cnt(var) = N_SIM_WORDS-1 then
          sim_wrd_cnt(var) <= (others => '0');
        elsif TW_84_stream_A_write(var) = '1' then
          sim_wrd_cnt(var) <= sim_wrd_cnt(var) + 1;
        end if;
      end if;
    end if;
  end process sim_word_cnt;
  
--  mem_full: process (tf_addrcnt(var)) is
--  begin  -- process mem_full
--          if tf_addrcnt(var) < 16368 then
--            TW_84_stream_A_full_neg(var) <= '1';
--          else
--            TW_84_stream_A_full_neg(var) <= '0';
--          end if;
--  end process mem_full;
   
  tf_addr(var)      <= std_logic_vector(tf_addrcnt(var));
  sim_wrd(var)      <= std_logic_vector(sim_wrd_cnt(var));
--  tf_wrdata(var)    <= x"ADD3" & "00" & To_StdLogicVector(To_bitvector(tf_addr(var)) srl 4) & x"0000" & TW_84_stream_AV_din(var) & BW_46_stream_AV_din(L1L2_L3) & BW_46_stream_AV_din(L1L2_L4) & BW_46_stream_AV_din(L1L2_L5) & BW_46_stream_AV_din(L1L2_L6) & emptyDiskStub & emptyDiskStub & emptyDiskStub & emptyDiskStub;
  tf_wrdata(var)    <= x"ADD3" & x"0" & "00" & sim_wrd(var) & x"0000" & TW_84_stream_AV_din(var) & BW_46_stream_AV_din(L1L2_L3) & BW_46_stream_AV_din(L1L2_L4) & BW_46_stream_AV_din(L1L2_L5) & BW_46_stream_AV_din(L1L2_L6) & emptyDiskStub & emptyDiskStub & emptyDiskStub & emptyDiskStub;

  tf_wrena(var)     <= TW_84_stream_A_write(var) and tf_not_full(var);
  
Summer_Chain_512_MEM : Test_Chain_512_Mem
  PORT MAP (
    clka   => AXI_CLK,
    ena    => tf_ena(var),
    wea(0) => TCRAM_WRITE,
    addra  => local_addr(13 downto 0),
    dina   => axiwrdata2,
    douta  => tf_rd_AXI_data(var),
    clkb   => sc_clk,
    enb    => tf_enb(var),
    web(0) => tf_wrena(var),
    addrb  => tf_addr(var),
    dinb   => tf_wrdata(var),
    doutb  => open
  );
end generate TF_464_loop;
  
ROM_TF_L1L2_i : ROM_TF_L1L2
  PORT MAP (
    clka => sc_clk,
    addra => tf_sim_addr(L1l2),
    douta => tf_sim_rddata(L1l2)
  );

TF_simulator_ADDR_loop : for var in enum_TW_84 generate
begin
  rd_tf_sim_addr: process (sc_clk) is
  begin  -- process rd_tf_sim_addr
    if sc_clk'event and sc_clk = '1' then  -- rising clock edge
      if sc_rst = '1' then
        tf_sim_addrcnt(var) <= (others => '0');
      else
        if TW_84_stream_A_write(var) = '1' and tf_sim_addrcnt(var) < (N_SIM_WORDS-1) then
          tf_sim_addrcnt(var) <= tf_sim_addrcnt(var) + 1;
        elsif TW_84_stream_A_write(var) = '1' then
          tf_sim_addrcnt(var) <= (others => '0');
        else
          tf_sim_addrcnt(var) <= tf_sim_addrcnt(var);
        end if;
      end if;
    end if;
  end process rd_tf_sim_addr;
  tf_sim_addr(var)   <= std_logic_vector(tf_sim_addrcnt(var));
end generate TF_simulator_ADDR_loop;

TF_cv_loop : for var in enum_TW_84 generate
begin
  cv_pipe:  process (sc_clk) is
    begin  -- process cv_pipe
    if sc_clk'event and sc_clk = '1' then  -- rising clock edge
      pre_comp_valid_2(var) <= TW_84_stream_A_write(var);
      pre_comp_valid_1(var) <= pre_comp_valid_2(var);
      comp_valid(var)       <= pre_comp_valid_1(var);
      comp_valid_1(var)     <= comp_valid(var);
      comp_valid_2(var)     <= comp_valid_1(var);
      comp_sim_reg(var)     <= tf_sim_rddata(var);
      -- read latency on ROM_TF_L1L2 is 2 clock cycles so Sector Processor data must be delayed.
      tf_wrdata_1(var)      <= tf_wrdata(var);
      tf_wrdata_2(var)      <= tf_wrdata_1(var);
      comp_tf_reg(var)      <= tf_wrdata_2(var);
    end if;
  end process cv_pipe;
end generate TF_cv_loop;


TF_comp_err_loop : for var in enum_TW_84 generate
begin
  err_regs: process (sc_clk) is
  begin  -- process err_regs
    if sc_clk'event and sc_clk = '1' then  -- rising clock edge
        if comp_valid(var) = '1' then
          comp_err_reg(var) <= comp_sim_reg(var) xor comp_tf_reg(var);
        else
          comp_err_reg(var) <= comp_err_reg(var);
        end if;
        if comp_valid_1(var) = '1' and comp_err_reg(var) /= x"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" then
          error_flag(var) <= '1';
        else
          error_flag(var) <= '0';
        end if;
        if sc_rst = '1' then
          err_count(var) <= (others => '0');
        else
          if error_flag(var) = '1' then
            err_count(var) <= err_count(var) + 1;
          end if;
        end if;
    end if;
  end process err_regs;
  errors(var)   <= std_logic_vector(err_count(var));
end generate TF_comp_err_loop;

probe_in0(0) <= sc_rst;
probe_in1(0) <= IR_START;
probe_in2    <= tf_ena(L1L2) & tw_ena(L1L2) & bw_ena(L1L2_L6) & bw_ena(L1L2_L5) & bw_ena(L1L2_L4) & bw_ena(L1L2_L3);
probe_in3    <= tf_enb(L1L2) & tw_enb(L1L2) & bw_enb(L1L2_L6) & bw_enb(L1L2_L5) & bw_enb(L1L2_L4) & bw_enb(L1L2_L3);
probe_in4(0) <= START_FIRST_LINK;
probe_in5(0) <= error_flag(L1l2);
probe_in6    <= errors(L1l2);
vio_sc_rst   <= probe_out0(0);
vio_sc_start <= probe_out1(0);
vio_sc_ena   <= probe_out2;
vio_sc_enb   <= probe_out3;
vio_clk_sel  <= probe_out4;


SummerChain_vio_1 : SummerChain_vio
  PORT MAP (
    clk => clk_50,
    probe_in0 => probe_in0,
    probe_in1 => probe_in1,
    probe_in2 => probe_in2,
    probe_in3 => probe_in3,
    probe_in4 => probe_in4,
    probe_in5 => probe_in5,
    probe_in6 => probe_in6,
    probe_out0 => probe_out0,
    probe_out1 => probe_out1,
    probe_out2 => probe_out2,
    probe_out3 => probe_out3,
    probe_out4 => probe_out4
  );


probe0      <= DL_39_link_AV_dout(PS10G_1_A);
probe1      <= DL_39_link_AV_dout(PS10G_2_A);
probe2      <= DL_39_link_AV_dout(PS10G_2_B);
probe3      <= DL_39_link_AV_dout(PS10G_3_A);
probe4      <= DL_39_link_AV_dout(PS10G_3_B);
probe5      <= DL_39_link_AV_dout(PS_1_A);
probe6      <= DL_39_link_AV_dout(PS_1_B);
probe7      <= DL_39_link_AV_dout(PS_2_A);
probe8      <= DL_39_link_AV_dout(PS_2_B);
probe9      <= DL_39_link_AV_dout(twoS_1_A);
probe10     <= DL_39_link_AV_dout(twoS_1_B);
probe11     <= DL_39_link_AV_dout(twoS_2_A);
probe12     <= DL_39_link_AV_dout(twoS_2_B);
probe13     <= DL_39_link_AV_dout(twoS_3_A);
probe14     <= DL_39_link_AV_dout(twoS_3_B);
probe15     <= DL_39_link_AV_dout(twoS_4_A);
probe16     <= DL_39_link_AV_dout(twoS_4_B);
probe17(0)  <= sc_clk;
probe18(0)  <= sc_rst;
probe19     <= DL_39_link_read(twoS_4_B) & DL_39_link_read(twoS_4_A) & DL_39_link_read(twoS_3_B) & DL_39_link_read(twoS_3_A) & DL_39_link_read(twoS_2_B) & DL_39_link_read(twoS_2_A) & DL_39_link_read(twoS_1_B) & DL_39_link_read(twoS_1_A) & DL_39_link_read(PS_2_B) & DL_39_link_read(PS_2_A) & DL_39_link_read(PS_1_B) & DL_39_link_read(PS_1_A) & DL_39_link_read(PS10G_3_B) & DL_39_link_read(PS10G_3_A) & DL_39_link_read(PS10G_2_B) & DL_39_link_read(PS10G_2_A) & DL_39_link_read(PS10G_1_A);
probe20     <= DL_39_link_empty_neg(twoS_4_B) & DL_39_link_empty_neg(twoS_4_A) & DL_39_link_empty_neg(twoS_3_B) & DL_39_link_empty_neg(twoS_3_A) & DL_39_link_empty_neg(twoS_2_B) & DL_39_link_empty_neg(twoS_2_A) & DL_39_link_empty_neg(twoS_1_B) & DL_39_link_empty_neg(twoS_1_A) & DL_39_link_empty_neg(PS_2_B) & DL_39_link_empty_neg(PS_2_A) & DL_39_link_empty_neg(PS_1_B) & DL_39_link_empty_neg(PS_1_A) & DL_39_link_empty_neg(PS10G_3_B) & DL_39_link_empty_neg(PS10G_3_A) & DL_39_link_empty_neg(PS10G_2_B) & DL_39_link_empty_neg(PS10G_2_A) & DL_39_link_empty_neg(PS10G_1_A);
probe21(0)  <= ir_start;
probe22     <= IR_BX_IN;
probe23     <= FT_BX_out;
probe24(0)  <= FT_BX_OUT_VLD;
probe25(0)  <= FT_DONE;
probe26(0)  <= tw_ena(L1L2);
probe27(0)  <= tw_enb(L1L2);
probe28     <= bw_ena(L1L2_L6) & bw_ena(L1L2_L5) & bw_ena(L1L2_L4) & bw_ena(L1L2_L3);
probe29     <= bw_enb(L1L2_L6) & bw_enb(L1L2_L5) & bw_enb(L1L2_L4) & bw_enb(L1L2_L3);
probe30(0)  <= TW_84_stream_A_full_neg(L1L2);
probe31(0)  <= TW_84_stream_A_write(L1L2);
probe32     <= tw_addr(L1L2);
probe33     <= TW_84_stream_AV_din(L1L2);
probe34(0)  <= BW_46_stream_A_full_neg(L1L2_L3);
probe35(0)  <= BW_46_stream_A_write(L1L2_L3);
probe36     <= bw_addr(L1L2_L3);
probe37     <= BW_46_stream_AV_din(L1L2_L3);
probe38(0)  <= BW_46_stream_A_full_neg(L1L2_L4);
probe39(0)  <= BW_46_stream_A_write(L1L2_L4);
probe40     <= bw_addr(L1L2_L4);
probe41     <= BW_46_stream_AV_din(L1L2_L4);
probe42(0)  <= BW_46_stream_A_full_neg(L1L2_L5);
probe43(0)  <= BW_46_stream_A_write(L1L2_L5);
probe44     <= bw_addr(L1L2_L5);
probe45     <= BW_46_stream_AV_din(L1L2_L5);
probe46(0)  <= BW_46_stream_A_full_neg(L1L2_L6);
probe47(0)  <= BW_46_stream_A_write(L1L2_L6);
probe48     <= bw_addr(L1L2_L6);
probe49     <= BW_46_stream_AV_din(L1L2_L6);
probe50(0)  <= START_FIRST_LINK;
probe51     <= tf_addr(L1L2);
probe52(0)  <= tf_ena(L1L2);
probe53(0)  <= tf_enb(L1L2);
probe54(0)  <= comp_valid(L1L2);
probe55(0)  <= comp_valid_1(L1L2);
probe56(0)  <= comp_valid_2(L1L2);
probe57(0)  <= error_flag(L1L2);
probe58     <= comp_tf_reg(L1L2);
probe59     <= comp_sim_reg(L1L2);
probe60     <= comp_err_reg(L1L2);
probe61     <= errors(L1L2);
probe62     <= tf_sim_addr(L1L2);
probe63     <= tf_sim_rddata(L1L2);

SummerChain_debug_1 : SummerChain_debug
PORT MAP (
	clk => sc_clk,
	probe0 => probe0, 
	probe1 => probe1, 
	probe2 => probe2, 
	probe3 => probe3, 
	probe4 => probe4, 
	probe5 => probe5, 
	probe6 => probe6, 
	probe7 => probe7, 
	probe8 => probe8, 
	probe9 => probe9, 
	probe10 => probe10, 
	probe11 => probe11, 
	probe12 => probe12, 
	probe13 => probe13, 
	probe14 => probe14, 
	probe15 => probe15, 
	probe16 => probe16, 
	probe17 => probe17, 
	probe18 => probe18, 
	probe19 => probe19, 
	probe20 => probe20, 
	probe21 => probe21, 
	probe22 => probe22, 
	probe23 => probe23, 
	probe24 => probe24, 
	probe25 => probe25, 
	probe26 => probe26, 
	probe27 => probe27, 
	probe28 => probe28, 
	probe29 => probe29, 
	probe30 => probe30, 
	probe31 => probe31, 
	probe32 => probe32, 
	probe33 => probe33, 
	probe34 => probe34, 
	probe35 => probe35, 
	probe36 => probe36, 
	probe37 => probe37, 
	probe38 => probe38, 
	probe39 => probe39, 
	probe40 => probe40, 
	probe41 => probe41, 
	probe42 => probe42, 
	probe43 => probe43, 
	probe44 => probe44, 
	probe45 => probe45, 
	probe46 => probe46, 
	probe47 => probe47, 
	probe48 => probe48,
	probe49 => probe49,
	probe50 => probe50,
	probe51 => probe51,
	probe52 => probe52,
	probe53 => probe53,
	probe54 => probe54,
	probe55 => probe55,
	probe56 => probe56,
	probe57 => probe57,
	probe58 => probe58,
	probe59 => probe59,
	probe60 => probe60,
	probe61 => probe61,
	probe62 => probe62,
	probe63 => probe63
);

end architecture structure;
