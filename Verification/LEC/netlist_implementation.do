// activate 'tclmode'
tclmode

//  set log file for debug
set_log_file logging2 -Replace

//set undefined cells to Black_box
set_undefined_cell Black_box -Both


// read library file,
//library file is not sufficient to represent all cells in implementation
read_library -Both -Replace  -sensitive -Statetable -Liberty /misc/scratch/bagus/verification/gscl45nm.lib -nooptimize


//read Golden design
read_design /misc/scratch/bagus/fft_gatelevel_new.v -Verilog -Golden -sensitive -nokeep_unreach -nosupply


// Load the revised design: 
read_design /misc/scratch/bagus/verification/fft_64p_16b_top_implementation.v -Verilog -Revised -sensitive -continuousassignment Bidirectional -nokeep_unreach -nosupply

//Setting the options for analysis
//set sequential element to 0 during reset
set_flatten_model -seq_constant -seq_constant_x_to 0
//merge equivalent sequential element in the design
set_flatten_model -seq_merge

//set No "Z" output in the analysis
set_flatten_model -nooutput_z

//add Black_box into analysis
set_flatten_model -bbox_merge
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