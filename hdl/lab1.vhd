
library IEEE;
use IEEE.std_logic_1164.all;

entity lab1 is
  port (
    LED : 	out std_logic_vector(9 downto 0);	-- Red LEDs
    SW : 	in std_logic_vector(9 downto 0);    -- Switches end entity lab1;
	HEX0:	out std_logic_vector(6 downto 0)	-- HEX0
    );
end entity lab1;

architecture top_level of lab1 is
begin
  -- Insert statement to assign all switches to the LEDs and architecture top_level;
  LED(9 downto 0) <= SW(9 downto 0);
  
--------------------------------------------------------------------
-- Source: 12.7 BCD to 7-Segment Decoder - Data-Flow Model
--------------------------------------------------------------------
-- BCD to 7-Segment Decoder: Implemented as combinatorial circuit.
-- Outputs are active low; Hex outputs are included. The HEX0 format
-- is ABCDEFG (segA, segB etc.)
--
-- Required signals:
--------------------------------------------------------------------
-- SW: in std_logic_vector(3 downto 0);
-- HEX0: out std_logic_vector(6 downto 0);
--------------------------------------------------------------------
	with SW(3 downto 0) select
		HEX0 <= "0000001" when "0000",	 -- 0
				"1001111" when "0001",	 -- 1
				"0010010" when "0010",	 -- 2
				"0000110" when "0011",	 -- 3
				"1001100" when "0100",	 -- 4
				"0100100" when "0101",	 -- 5
				"0100000" when "0110",	 -- 6
				"0001111" when "0111",	 -- 7
				"0000000" when "1000",	 -- 8
				"0000100" when "1001",	 -- 9
				"0001000" when "1010",	 -- A
				"1100000" when "1011",	 -- B
				"0110001" when "1100",	 -- C
				"1000010" when "1101",	 -- D
				"0110000" when "1110",	 -- E
				"0111000" when "1111",	 -- F
				"1111111" when others; -- turn off all LEDs

end architecture top_level;

