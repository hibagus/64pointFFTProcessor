// activate 'tclmode'
tclmode

//  set log file for debug
set_log_file logging2 -Replace


// read library file
read_library -Both -Replace  -sensitive -Statetable -Liberty /misc/scratch/bagus/verification/gscl45nm.lib -nooptimize

// source RTL files
source /home/ecelrc/students/tjemilehin/verif_labs/Project/rtl.list

//add search path to load RTL file
add_search_path /misc/scratch/bagus/verification/Verilog-RTL -Design -Golden -Recursive

//read RTL design
read_design $RTL_LIST -Verilog -Golden -sensitive -nokeep_unreach -nosupply
   

// Load the revised design: 
read_design /misc/scratch/bagus/fft_gatelevel_new.v -Verilog -Revised -sensitive -continuousassignment Bidirectional -nokeep_unreach -nosupply

//Setting the options for analysis

//set sequential element to 0 during reset
set_flatten_model -seq_constant -seq_constant_x_to 0
//merge equivalent sequential element in the design
set_flatten_model -seq_merge
set_analyze_option -auto

// Set the system mode to lec
set_system_mode lec


// Comparison stage
add_compared_points -all
compare

// Display result
puts "Num of compare points = [get_compare_points -count]"
puts "Num of diff points    = [get_compare_points -NONequivalent -count]"
puts "Num of abort points   = [get_compare_points -abort -count]"
puts "Num of unknown points = [get_compare_points -unknown -count]"