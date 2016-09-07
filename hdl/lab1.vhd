
library IEEE;
use IEEE.std_logic_1164.all;

entity lab1 is
  port (
    LED : out std_logic_vector(9 downto 0);     -- Red LEDs
    SW : in std_logic_vector(9 downto 0);       -- Switches end entity lab1;
    );
end entity lab1;

architecture top_level of lab1 is
begin
  -- Insert statement to assign all switches to the LEDs and architecture top_level;
  LED(9 downto 0) <= SW(9 downto 0);

end architecture top_level;

