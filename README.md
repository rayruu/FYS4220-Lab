# FYS4220-Lab

## Lab 1.

### Part 1. Quartus project, combinatorial logic and functional simulation

Given task in lab 1:
#### a) Switches and LEDs

- [x] Create a new Quartus project
- [x] Create a new VHDL file
- [x] Create tcl scripting file and make pin assignments
- [x] Create and import pin settings
- [x] Compile the project and program the FPGA
- [x] Update the git repository

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

The vhdl - file for lab1, a:   name: lab1.vhd
```
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
```

Created tcl scripting file: 	name: fys4220_de1_soc_board.tcl

```
#Toggle switches
set_location_assignment PIN_AB12 -to SW[0] 
set_location_assignment PIN_AC12 -to SW[1] 
set_location_assignment PIN_AF9 -to SW[2] 
set_location_assignment PIN_AF10 -to SW[3] 
set_location_assignment PIN_AD11 -to SW[4] 
set_location_assignment PIN_AD12 -to SW[5] 
set_location_assignment PIN_AE11 -to SW[6] 
set_location_assignment PIN_AC9 -to SW[7] 
set_location_assignment PIN_AD10 -to SW[8] 
set_location_assignment PIN_AE12 -to SW[9] 

#LED outputs
set_location_assignment PIN_V16 -to LED[0]
set_location_assignment PIN_W16 -to LED[1]
set_location_assignment PIN_V17 -to LED[2]
set_location_assignment PIN_V18 -to LED[3]
set_location_assignment PIN_W17 -to LED[4]
set_location_assignment PIN_W19 -to LED[5]
set_location_assignment PIN_Y19 -to LED[6]
set_location_assignment PIN_W20 -to LED[7]
set_location_assignment PIN_W21 -to LED[8]
set_location_assignment PIN_Y21 -to LED[9]

#To avoid that the FPGA is driving an unintended value on pins that are not in use:
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"

```
Imported vhd- and tcl-file in Quartus project. Compiled the project from Quartus Prime (Processing -> Start Compilation)
- The compilation was successful, which mean that Quartus has generated and SRAM object file (.sof) in the directory output-files under the project directory.

We have to configure "Hardware Setup" under: Tools -> Programmer, before we can run the program on DE1-SoC board. 

The program will set output LED when SW == 1.


