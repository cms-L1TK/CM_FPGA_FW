library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ChannelTest is
  port (
    clk       : in  std_logic;
    clk_axi   : in  std_logic;
    reset     : in  std_logic;
    rx_data   : in  std_logic_vector(31 downto 0);
    rx_k_data : in  std_logic_vector(3 downto 0);
    rt_data   : out std_logic_vector(31 downto 0);
    rt_k_data : out std_logic_vector(3 downto 0);
    error_count : out std_logic_vector(31 downto 0));
end entity ChannelTest;
architecture behavioral of ChannelTest is
  signal counter : unsigned(31 downto 0);
  signal check_counter : unsigned(31 downto 0);
  signal search_mode : std_logic_vector(1 downto 0);
  signal rx_error : std_logic;
  
  
begin  -- architecture behavioral  
  rate_counter_1: entity work.rate_counter
    generic map (
      CLK_A_1_SECOND => CLK_A_1_SECOND)
    port map (
      clk_A         => clk_axi,
      clk_B         => clk,
      reset_A_async => reset,
      event_b       => rx_error,
      rate          => error_count);

  data_gen: process (clk_tx_int, reset) is
  begin  -- process data_proc
    if reset = '1' then               -- asynchronous reset (active high)
      tx_data <= x"BCBCBCBC";
      tx_k_data <= x"F";
      counter <= x"00000000";
    elsif clk_tx_int'event and clk_tx_int = '1' then  -- rising clock edge
      counter <= counter + 1;
      if counter(8 downto 0) = "100000000" then
        counter <= counter;
        tx_data <= x"BCBCBCBC";
        tx_k_data <= x"F";
      else
        tx_data <= counter;
        tx_k_data <= x"0";        
      end if;
    end if;
  end process data_gen;

  data_proc: process (clk_rx, reset) is
  begin  -- process data_proc
    if reset = '0' then                 -- asynchronous reset (active low)
      search_mode <= "00";
      check_counter <= x"00000000";
    elsif clk_rx'event and clk_rx = '1' then  -- rising clock edge
      rx_error <= '0';
      case search_mode is
        when "00" =>
          -- wait for a K-char word
          if rx_data = x"BCBCBCBC" and rx_k_data = x"F" then
            search_mode <= "01";
          end if;
        when "01" =>
          --grab the current counter value
          if or_reduce(rx_k_data) = '1' then
            rx_error <= '1';
          else
            check_counter <= unsigned(rx_data) + 1;
            search_mode <= "10";            
          end if;
        when "10" =>
          --process counter values
          if rx_k_data = x"0" then
            if rx_data /= check_counter then
              rx_error <= '1';
              -- go back to searching
              search_mode <= "00";
            end if;
            check_counter <= check_counter +1 ;
          elsif rx_k_data = x"F" and rx_data(8 downto 0) = "100000000" then
            check_counter <= check_counter;
          else
            rx_error <= '1';
            search_mode <= "00";
          end if;          
        when others => null;
      end case;
    end if;
  end process data_proc;
end architecture behavioral;
