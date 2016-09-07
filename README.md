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
- [x] Simulate the design
- [x] Program the FPGA
- [x] Update the git repository

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
-- With some changes
--------------------------------------------------------------------
-- Required signals:
--------------------------------------------------------------------
-- SW: in std_logic_vector(3 downto 0);
-- HEX0: out std_logic_vector(6 downto 0);
--------------------------------------------------------------------
	with SW(3 downto 0) select
		HEX0 <= "1000000" when "0000",	 -- 0
				"1111001" when "0001",	 -- 1
				"0100100" when "0010",	 -- 2
				"0110000" when "0011",	 -- 3
				"0011001" when "0100",	 -- 4
				"0010010" when "0101",	 -- 5
				"0000010" when "0110",	 -- 6
				"1111000" when "0111",	 -- 7
				"0000000" when "1000",	 -- 8
				"0010000" when "1001",	 -- 9
				"0001000" when "1010",	 -- A
				"0000011" when "1011",	 -- b
				"1000110" when "1100",	 -- C
				"0100001" when "1101",	 -- d
				"0000110" when "1110",	 -- E
				"0001110" when "1111",	 -- F
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

 - Simulating vhdl-files using Modelsim-Altera
 - Uploading vhdl-files by following Lab1 guide.
 - Compiling selected file (Compile -> Compile Selected)
 - NB: Compile them in correct order: lab1.vhd then tb_lab1.vhd

 - To start simulation (Simulate -> Start Simulate) and chose tb_lab1.vhd
 - Mark LED, hold in shift and select HEX0.
 - Right click on selected and add wave. Wave window will pop up with parameters LED, SW and HEX0. 
 - Then Simulate by: Simulate -> Run -> Run-all
 
 Picture below show simulated values. (Click on picture to get better view.)
 
![part1b1](http://i.imgur.com/PbxtsdQ.png)

- Uploaded the program to FPGA.
- Had some adjusting with typo mistakes. Like 7-segment indicated 2 when switch: "0101" supposed to be 5.




