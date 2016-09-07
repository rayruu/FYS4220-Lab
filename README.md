# FYS4220-Lab

## Lab 1.

### Part 1. Quartus project, combinatorial logic and functional simulation

Given task in lab 1:
#### a) Switches and LEDs

- [x] Create a new Quartus project
<<<<<<< HEAD
- [x] Create a new VHDL file
=======
- [ ] Create a new VHDL file
>>>>>>> c056455d728cc365191de2392cc257d0dfd9973d
- [ ] Create tcl scripting file and make pin assignments
- [ ] Create and import pin settings
- [ ] Compile the project and program the FPGA
- [ ] Update the git repository

#### b) 7 - segment decoder with functional simulation

- [ ] Preparing the project
- [ ] Simulate the design
- [ ] Program the FPGA
- [ ] Update the git repository

### Part 2. Synchronous process

#### 4-bit counter and push button

- [ ] Create the 4 bit counter with active low synchronous reset
- [ ] Timing analysis
- [ ] Update the git repository

### Part 1.
#### a)

The vhdl - file for lab1:
'''
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

'''


