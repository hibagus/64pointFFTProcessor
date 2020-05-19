###################################################################

# Created by write_sdc on Mon Dec  9 00:09:12 2019

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
create_clock [get_ports clk]  -name pclk  -period 10  -waveform {0 5}
