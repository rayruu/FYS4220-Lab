
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