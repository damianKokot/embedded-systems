library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor is
   generic( width : integer := 8 );
   port( op : in std_logic; A, B : in unsigned(width-1 downto 0); X : out unsigned(width-1 downto 0); err : out std_logic );
end subtractor;
      
architecture rtl of subtractor is
   component sumator is
      generic( width : integer := 8 );
      port( a, b : in unsigned(width-1 downto 0); x : out unsigned(width-1 downto 0); over : out std_logic);
   end component;

   signal c : unsigned(width - 1 downto 0);
   signal d : unsigned(width - 1 downto 0);
   signal e : unsigned(width - 1 downto 0);
   signal f : unsigned(width - 1 downto 0);

   constant zero : unsigned(width-1 downto 0) := (others => '0');
   constant fullOne : unsigned(width-1 downto 0) := (others => '1');
   signal one : unsigned(width - 1 downto 0);

   signal over1, over2 : std_logic;
   constant period : time := 5 ns;
begin
   one <= zero + 1;
   e <= B xor fullOne;
   sumC: sumator generic map ( width ) port map ( A, B, c, over1);
   sumF: sumator generic map ( width ) port map ( A, e, d, over2 );
   sumX: sumator generic map ( width ) port map ( d, one, f, over2 );
   
   process (c, f, over1)
   begin
      if (op = '0') then
         X <= c after period;
         err <= over1;
      elsif (A < B) then
         X <= zero;
         err <= '1';
      else
         X <= f after period;
         err <= '0';
      end if;
   end process;
end rtl;
