LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- No ports
entity xand_tb is
end xand_tb;

architecture behavior of xand_tb is
    component Xand is
      generic (width : integer);
      port ( clk : in std_logic;
        A,B : in std_logic_vector(width - 1 downto 0);
        C : out std_logic_vector(width - 1 downto 0)
      );
    end component;
  
    constant width : integer := 4;

    -- Input
    signal clk : std_logic := '0';
    -- 0000
    signal portsA : std_logic_vector(width - 1 downto 0) := (others => '0');
    -- 1010
    signal portsB : std_logic_vector(width - 1 downto 0) := (0 => '1', 2 => '1', others => '0');

    -- Output
    signal portsC : std_logic_vector(width - 1 downto 0) := (others => '0');

    -- okres zegara
    constant period : time := 10 ns;
  
  begin
    uut: Xand generic MAP (width) port MAP (
          clk => clk,
          A => portsA,
          B => portsB,
          C => portsC
        );

    -- Start simulating process
    stim_proc: process
      begin

      wait for period;
      for i in 0 to 2**width loop
        portsA <= std_logic_vector( unsigned(portsA) + 1 );
        for i in 0 to 2**width loop
          portsB <= std_logic_vector( unsigned(portsB) + 1 );
          wait for period;
        end loop;
        wait for period;
      end loop;
      wait;
   end process;
end behavior;