library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumator_tb is
end sumator_tb;

architecture behav of sumator is 
    component sumator is
        generic( width : integer := 8);
        port( a, b : in unsigned(width-1 downto 0); x : out unsigned(width downto 0) );
    end component;

    constant width : integer := 4;
    constant tests : integer := (2**width);
    constant period : time := 10 ns;

    signal A, B : unsigned(width-1 downto 0);
    signal X : unsigned(width downto 0);

begin
    uut: sumator generic map ( width ) port map ( A, B, X );

    process
    begin
        wait for period;

        A <= (others => '0');
        B <= (others => '0');

        wait for period;

        for i in 0 to test-1 loop
            for j in 0 test-1 loop
                wait for period;
                B <= B+1;
            end loop;
            A <= A+1;
        end loop;
        wait for period;
        wait;
    end process;
end behav;