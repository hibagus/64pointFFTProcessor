# Create the library.
if [file exists work] {
    vdel -all
}
vlib work

# Compile the sources.

# FFT Netlist Source Files
#vlog ./../../synth/fft_netlist.v ./../../synth/lib/gscl45nm.v

# FFT RTL Soure Files
vlog ../../src/bit_adj_32b_to_16b.v ../../src/black_cell.v ../../src/bypass_32b.v ../../src/cb_circuit.v ../../src/complex_adder_ksa_32b.v ../../src/complex_mult_twiddle_wn0_32b.v ../../src/complex_mult_twiddle_wn1_32b.v ../../src/complex_mult_twiddle_wn2_32b.v ../../src/complex_mult_twiddle_wn3_32b.v ../../src/complex_subst_ksa_32b.v ../../src/const_mult_ksa_16b_halfsqrt2.v ../../src/const_mult_ksa_16b_sqrt2.v ../../src/dff_hold_sync_high_reset.v ../../src/dff_inputsel_hold_sync_high_reset.v ../../src/dff_segment_for_cb.v ../../src/dff_segment_for_input.v ../../src/dff_segment_for_output.v ../../src/dff_sync_high_reset.v ../../src/fft_64p_16b_top.v ../../src/fft_8p_16b_top.v ../../src/generic_complex_mult_16b.v ../../src/generic_complex_mult_block.v ../../src/generic_mult_16b.v ../../src/grey_cell.v ../../src/input_circuit.v ../../src/input_counter.v ../../src/interdimensional_multiplier.v ../../src/intermediate_circuit.v ../../src/ks_1_16b.v ../../src/ks_1_32b.v ../../src/ks_2_16b.v ../../src/ks_2_32b.v ../../src/ks_3_16b.v ../../src/ks_3_32b.v ../../src/ks_4_16b.v ../../src/ks_4_32b.v ../../src/ks_5_16b.v ../../src/ks_5_32b.v ../../src/ks_6_16b.v ../../src/ks_6_32b.v ../../src/ks_7_16b.v ../../src/ks_7_32b.v ../../src/ksa_top_16b.v ../../src/ksa_top_32b.v ../../src/lshifter.v ../../src/master_control.v ../../src/mux_2_to_1.v ../../src/mux_8_to_1.v ../../src/notgate.v ../../src/output_circuit.v ../../src/output_counter.v ../../src/pg.v ../../src/real_imaginary_interchange.v ../../src/rshift_6_16b_to_16b.v ../../src/scalling_out.v ../../src/sgninv_16b.v ../../src/sub_ksa_16b.v

# FFT Dummy Source Files
#vlog -sv ../tb/dummy.sv


# UVM Source Files
vlog +cover -sv ../tb/interfaces.sv  ../tb/sequences.sv ../tb/coverage.sv ../tb/scoreboard.sv ../tb/modules.sv ../tb/tests.sv  ../tb/tb.sv  

# Simulate the design.
vsim -c top
run -all
exit
