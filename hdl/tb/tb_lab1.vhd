library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_lab1 is
end;

architecture testbench of tb_lab1 is
  signal LED : std_logic_vector(9 downto 0);
  signal SW   : std_logic_vector(9 downto 0);
  signal HEX0 : std_logic_vector(6 downto 0);
  component lab1 is
    port (
        LED : out std_logic_vector(9 downto 0);
        SW   : in  std_logic_vector(9 downto 0);
        HEX0 : out std_logic_vector(6 downto 0));
    end component lab1;
begin
    UUT : lab1
        port map(
            LED => LED,
            SW   => SW,
            HEX0 => HEX0
        );

    stimuli_process : process
    begin
        --set '1' as the default values for input SW.
        SW(9 downto 0) <= (others => '0');
        wait for 20 ns;
        --Run through all combinations of input values
        --for SW(3 downto 0) and validate the expected value --of HEX0. Chang value every 20 ns.
        SW(3 downto 0) <= X"0";
        wait for 20 ns;
        SW(3 downto 0) <= X"1";
        wait for 20 ns;
        SW(3 downto 0) <= X"2";
        wait for 20 ns;
        SW(3 downto 0) <= X"3";
        wait for 20 ns;
        SW(3 downto 0) <= X"4";
        wait for 20 ns;
        SW(3 downto 0) <= X"5";
        wait for 20 ns;
        SW(3 downto 0) <= X"6";
        wait for 20 ns;
        SW(3 downto 0) <= X"7";
        wait for 20 ns;
        SW(3 downto 0) <= X"8";
        wait for 20 ns;
        SW(3 downto 0) <= X"9";
        wait for 20 ns;
        SW(3 downto 0) <= X"A";
        wait for 20 ns;
        SW(3 downto 0) <= X"B";
        wait for 20 ns;
        SW(3 downto 0) <= X"C";
        wait for 20 ns;
        SW(3 downto 0) <= X"D";
        wait for 20 ns;
        SW(3 downto 0) <= X"E";
        wait for 20 ns;
        SW(3 downto 0) <= X"F";
        wait for 20 ns;
        wait;
    end process stimuli_process;
end architecture testbench;