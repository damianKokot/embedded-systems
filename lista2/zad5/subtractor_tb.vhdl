library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor_tb is
end subtractor_tb;

architecture behaviour of subtractor_tb is 
    component subtractor is
        generic( width : integer := 8 );
        port( op : in std_logic; A, B : in unsigned(width-1 downto 0); X : out unsigned(width-1 downto 0); err : out std_logic );
    end component;

    constant width : integer := 4;
    constant tests : integer := (2**width);
    constant period : time := 100 ns;

    signal op, err : std_logic;
    signal A, B : unsigned(width-1 downto 0);
    signal X : unsigned(width-1 downto 0);
begin
    uut: subtractor generic map ( width ) port map ( op, A, B, X, err );

    process
    begin
        wait for period;
        
        A <= (others => '0');
        B <= (others => '0');
        wait for period;

        wait for period;
        op <= '1';

        for i in 0 to tests-1 loop
            for j in 0 to tests-1 loop
                wait for period;
                B <= B+1;
            end loop;
            A <= A+1;
        end loop;
        
        wait for period;
        op <= '0';
        for i in 0 to tests-1 loop
            for j in 0 to tests-1 loop
                wait for period;
                B <= B+1;
            end loop;
            A <= A+1;
        end loop;
        wait for period;

        wait;
    end process;
end behaviour;

-- ghdl -a adder.vhdl && ghdl -e adder
-- ghdl -a sumator.vhdl && ghdl -e sumator
-- ghdl -a subtractor.vhdl && ghdl -e subtractor
-- ghdl -a subtractor_tb.vhdl && ghdl -e subtractor_tb
-- ghdl -r subtractor_tb --wave=wave.ghw && gtkwave wave.ghw

-- ghdl -a adder.vhdl && ghdl -e adder && ghdl -a sumator.vhdl && ghdl -e sumator && ghdl -a subtractor.vhdl && ghdl -e subtractor && ghdl -a subtractor_tb.vhdl && ghdl -e subtractor_tb && ghdl -r subtractor_tb --wave=wave.ghw && gtkwave wave.ghw