#Tcl script which can be used with JasperGold

clear -all
#Reading the files
analyze -v2k ../../Verilog/master_control.v
analyze -sv v_master_control.sv

#Elaborating the design
elaborate -top master_control

#Set the clock
clock clk

#Set Reset
reset -expression (rst)

#Prove all
prove -bg -all
