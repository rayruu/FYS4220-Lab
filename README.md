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

- [x] Preparing the project
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

#### b)
Preparing the lab for 7-segment decoder with functional simulation by updating the vhdl-file and the tcl-file.

Updated vhdl-file, filename: lab1.vhd

```
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
```

Updated tcl-file, filename: fys4220_de1_soc_board.tcl

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

#Seven segment display
set_location_assignment PIN_AE26 -to HEX0[0]
set_location_assignment PIN_AE27 -to HEX0[1]
set_location_assignment PIN_AE28 -to HEX0[2]
set_location_assignment PIN_AG27 -to HEX0[3]
set_location_assignment PIN_AF28 -to HEX0[4]
set_location_assignment PIN_AG28 -to HEX0[5]
set_location_assignment PIN_AH28 -to HEX0[6]

#To avoid that the FPGA is driving an unintended value on pins that are not in use:
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
```

We will simulate the updated program by creating a test bench design:
 - Test bench file is created under: hdl/tb
Filename:	tb_lab1.
```
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
```

![part1b1](/pic/part1b1.png)
