--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.V_IO_Ctrl.all;
entity V_IO_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    slave_rd_ack     : out std_logic;
    Mon              : in  V_IO_Mon_t;
    Ctrl             : out V_IO_Ctrl_t
        
    );
end entity V_IO_interface;
architecture behavioral of V_IO_interface is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;
  signal tcram_RdAck        : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 773);
  constant Default_reg_data : slv32_array_t(integer range 0 to 773) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  AXIRegBridge : entity work.axiLiteRegBlocking
    port map (
      clk_axi     => clk_axi,
      reset_axi_n => reset_axi_n,
      readMOSI    => slave_readMOSI,
      readMISO    => slave_readMISO,
      writeMOSI   => slave_writeMOSI,
      writeMISO   => slave_writeMISO,
      address     => localAddress,
      rd_data     => localRdData_latch,
      wr_data     => localWrData,
      write_en    => localWrEn,
      read_req    => localRdReq,
      read_ack    => localRdAck);
      
      slave_rd_ack <= tcram_RdAck;

  -------------------------------------------------------------------------------
  -- Record read decoding
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------

  latch_reads: process (clk_axi,reset_axi_n) is
  begin  -- process latch_reads
    if reset_axi_n = '0' then
      localRdAck <= '0';
    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      localRdAck <= '0';
      
      if regRdAck = '1' then
        localRdData_latch <= localRdData;
        localRdAck <= '1';
      
      end if;
    end if;
  end process latch_reads;

  
  reads: process (clk_axi,reset_axi_n) is
  begin  -- process latch_reads
    if reset_axi_n = '0' then
      regRdAck <= '0';
      tcram_RdAck <= '0';
    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      regRdAck  <= '0';
      tcram_RdAck <= '0';
      localRdData <= x"00000000";
      if localRdReq = '1' then
        regRdAck  <= '1';
        case to_integer(unsigned(localAddress(9 downto 0))) is
          
        when 0 => --0x0
          localRdData( 0)            <=  Mon.C2C.SOFT_ERR;                 --
          localRdData( 1)            <=  Mon.C2C.MMCM_NOT_LOCKED;          --
          localRdData( 2)            <=  Mon.C2C.LINK_RESET;               --
          localRdData( 3)            <=  Mon.C2C.LANE_UP;                  --
          localRdData( 4)            <=  Mon.C2C.HARD_ERR;                 --
          localRdData( 5)            <=  Mon.C2C.GT_PLL_LOCK;              --
          localRdData( 6)            <=  Mon.C2C.MULTIBIT_ERR;             --
          localRdData( 7)            <=  Mon.C2C.LINK_STATUS;              --
          localRdData( 8)            <=  Mon.C2C.CONFIG_ERR;               --
          localRdData( 9)            <=  Mon.C2C.DO_CC;                    --
        when 256 => --0x100
          localRdData( 7 downto  0)  <=  reg_data(256)( 7 downto  0);      --
          localRdData(15 downto  8)  <=  reg_data(256)(15 downto  8);      --
          localRdData(23 downto 16)  <=  reg_data(256)(23 downto 16);      --
        when 514 => --0x202
          localRdData(31 downto  0)  <=  reg_data(514)(31 downto  0);      --
        when 515 => --0x203
          localRdData(31 downto  0)  <=  Mon.BRAM.RD_DATA;                 --
        when 513 => --0x201
          localRdData(14 downto  0)  <=  reg_data(513)(14 downto  0);      --
        when 16 => --0x10
          localRdData( 0)            <=  Mon.CLK_200_LOCKED;               --

        when 769 => --0x301
          localRdData(14 downto  0)  <=  reg_data(769)(14 downto  0);           --
        when 770 => --0x302
          localRdData(14 downto  0)  <=  Mon.TCRAM.ADDR;                        --
        when 771 => --0x303
          localRdData(31 downto  0)  <=  reg_data(771)(31 downto  0);           --
        when 772 => --0x304
          localRdData(31 downto  0)  <=  Mon.TCRAM.RD_DATA;                     --
          tcram_RdAck <= '1';
        when 773 => --0x305
          localRdData( 0)            <=  reg_data(773)( 0);                     --
          localRdData( 12 downto 8)  <=  reg_data(773)( 12 downto 8);           --
          localRdData( 20 downto 16) <=  reg_data(773)( 20 downto 16);          --
          localRdData( 24)           <=  reg_data(773)( 24);                    --
          localRdData( 28)           <=  reg_data(773)( 28);                    --

        when others =>
          regRdAck <= '0';
          tcram_RdAck <= '1';
          localRdData <= x"00000000";
        end case;
      end if;
    end if;
  end process reads;


  -------------------------------------------------------------------------------
  -- Record write decoding
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------

  -- Register mapping to ctrl structures
  Ctrl.RGB.R         <=  reg_data(256)( 7 downto  0);     
  Ctrl.RGB.G         <=  reg_data(256)(15 downto  8);     
  Ctrl.RGB.B         <=  reg_data(256)(23 downto 16);     
  Ctrl.BRAM.ADDR     <=  reg_data(513)(14 downto  0);     
  Ctrl.BRAM.WR_DATA  <=  reg_data(514)(31 downto  0);     
  Ctrl.TCRAM.BASE_ADDR              <=  reg_data(769)(14 downto  0);     
  Ctrl.TCRAM.WR_DATA                <=  reg_data(771)(31 downto  0);     
  Ctrl.TCRAM.FF_MODE                <=  reg_data(773)( 0);               
  Ctrl.TCRAM.ENA                    <=  reg_data(773)( 12 downto 8);               
  Ctrl.TCRAM.ENB                    <=  reg_data(773)( 20 downto 16);               
  Ctrl.TCRAM.RST                    <=  reg_data(773)( 24);               
  Ctrl.TCRAM.START                  <=  reg_data(773)( 28);               


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(256)( 7 downto  0)  <= DEFAULT_V_IO_CTRL_t.RGB.R;
      reg_data(256)(15 downto  8)  <= DEFAULT_V_IO_CTRL_t.RGB.G;
      reg_data(256)(23 downto 16)  <= DEFAULT_V_IO_CTRL_t.RGB.B;
      reg_data(513)(14 downto  0)  <= DEFAULT_V_IO_CTRL_t.BRAM.ADDR;
      reg_data(514)(31 downto  0)  <= DEFAULT_V_IO_CTRL_t.BRAM.WR_DATA;
      reg_data(769)(14 downto  0)  <= DEFAULT_V_IO_CTRL_t.TCRAM.BASE_ADDR;
      reg_data(771)(31 downto  0)  <= DEFAULT_V_IO_CTRL_t.TCRAM.WR_DATA;
      reg_data(773)( 0)  <= DEFAULT_V_IO_CTRL_t.TCRAM.FF_MODE;
      reg_data(773)( 12 downto 8)  <= DEFAULT_V_IO_CTRL_t.TCRAM.ENA;
      reg_data(773)( 20 downto 16) <= DEFAULT_V_IO_CTRL_t.TCRAM.ENB;
      reg_data(773)( 24)           <= DEFAULT_V_IO_CTRL_t.TCRAM.RST;
      reg_data(773)( 28)           <= DEFAULT_V_IO_CTRL_t.TCRAM.START;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.BRAM.WRITE <= '0';
      Ctrl.TCRAM.WRITE <= '0';
      Ctrl.TCRAM.WR_BASE <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(9 downto 0))) is
        when 256 => --0x100
          reg_data(256)( 7 downto  0)  <=  localWrData( 7 downto  0);      --
          reg_data(256)(15 downto  8)  <=  localWrData(15 downto  8);      --
          reg_data(256)(23 downto 16)  <=  localWrData(23 downto 16);      --
        when 512 => --0x200
          Ctrl.BRAM.WRITE              <=  localWrData( 0);               
        when 514 => --0x202
          reg_data(514)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 513 => --0x201
          reg_data(513)(14 downto  0)  <=  localWrData(14 downto  0);      --
        when 768 => --0x300
          Ctrl.TCRAM.WRITE             <=  localWrData( 0);               
          Ctrl.TCRAM.WR_BASE           <=  localWrData( 1);               
        when 769 => --0x301
          reg_data(769)(14 downto  0)  <=  localWrData(14 downto  0);      --
        when 771 => --0x303
          reg_data(771)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 773 => --0x305
          reg_data(773)( 0)            <=  localWrData( 0);                --
          reg_data(773)( 12 downto 8)  <=  localWrData( 12 downto 8);      --
          reg_data(773)( 20 downto 16) <=  localWrData( 20 downto 16);     --
          reg_data(773)( 24)           <=  localWrData( 24);               --
          reg_data(773)( 28)           <=  localWrData( 28);               --

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;