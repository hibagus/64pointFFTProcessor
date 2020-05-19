package tests;
`include "uvm_macros.svh"
import modules_pkg::*;
import uvm_pkg::*;
import sequences::*;
import scoreboard::*;

class test1 extends fft_test;
    `uvm_component_utils(test1)

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new
    
    task run_phase(uvm_phase phase);
	seq_of_commands seq;
	seq = seq_of_commands::type_id::create("seq");
	assert( seq.randomize() );
	phase.raise_objection(this);
	seq.start(fft_env_h.fft_agent_in_h.fft_sequencer_in_h);
	phase.drop_objection(this);
    endtask: run_phase     
endclass: test1

endpackage: tests
