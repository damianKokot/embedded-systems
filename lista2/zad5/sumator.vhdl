library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumator is
    generic( width : integer := 8 );
    port( a, b : in unsigned(width-1 downto 0); x : out unsigned(width-1 downto 0); over : out std_logic);
end sumator;

architecture rtl of sumator is 
    component adder
        port (
          i0, i1 : in std_logic;
          ci : in std_logic;
          s : out std_logic;
          co : out std_logic);
    end component;

    signal c : unsigned(width downto 0);
begin
    c(0) <= '0';

    sumator_gen: for i in 0 to width-1 generate
        adderX : adder port map ( a(i), b(i), c(i), x(i), c(i+1) );
    end generate sumator_gen;

    over <= c(width);

end rtl;