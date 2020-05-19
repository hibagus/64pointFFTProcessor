`include "uvm_macros.svh"
package modules_pkg;

import uvm_pkg::*;
import sequences::*;
import coverage::*;
import scoreboard::*;

typedef uvm_sequencer #(fft_transaction_in) fft_sequencer_in;

class fft_dut_config extends uvm_object;
    `uvm_object_utils(fft_dut_config)

    virtual dut_in dut_vi_in;
    virtual dut_out dut_vi_out;

endclass: fft_dut_config

class fft_driver_in extends uvm_driver#(fft_transaction_in);
    `uvm_component_utils(fft_driver_in)

    fft_dut_config dut_config_0;
    virtual dut_in dut_vi_in;

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
       assert( uvm_config_db #(fft_dut_config)::get(this, "", "dut_config", dut_config_0));
       dut_vi_in = dut_config_0.dut_vi_in;
    endfunction : build_phase
   
    task run_phase(uvm_phase phase);
      forever
      begin
        fft_transaction_in tx;
        
        @(posedge dut_vi_in.clk);
        seq_item_port.get(tx);
        dut_vi_in.rst        = tx.rst;
        dut_vi_in.In_Stream  = tx.In_Stream;
        dut_vi_in.Data_Start = tx.Data_Start;
        dut_vi_in.Mode       = tx.Mode;
      end
    endtask: run_phase

endclass: fft_driver_in

class fft_monitor_in extends uvm_monitor;
    `uvm_component_utils(fft_monitor_in)

    uvm_analysis_port #(fft_transaction_in) aport;

    fft_dut_config dut_config_0;

    virtual dut_in dut_vi_in;

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        dut_config_0=fft_dut_config::type_id::create("config");
        aport=new("aport",this);
        assert( uvm_config_db #(fft_dut_config)::get(this, "", "dut_config", dut_config_0) );
        dut_vi_in=dut_config_0.dut_vi_in;

    endfunction: build_phase

    task run_phase(uvm_phase phase);
      forever
      begin
        fft_transaction_in tx;
        @(posedge dut_vi_in.clk);
        tx = fft_transaction_in::type_id::create("tx");
        tx.In_Stream  = dut_vi_in.In_Stream;
        tx.Mode       = dut_vi_in.Mode;
        tx.Data_Start = dut_vi_in.Data_Start;
        tx.rst        = dut_vi_in.rst;
        aport.write(tx);
      end
    endtask: run_phase

endclass: fft_monitor_in


class fft_monitor_out extends uvm_monitor;
    `uvm_component_utils(fft_monitor_out)

    uvm_analysis_port #(fft_transaction_out) aport;

    fft_dut_config dut_config_0;

    virtual dut_out dut_vi_out;

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        dut_config_0=fft_dut_config::type_id::create("config");
        aport=new("aport",this);
        assert( uvm_config_db #(fft_dut_config)::get(this, "", "dut_config", dut_config_0) );
        dut_vi_out=dut_config_0.dut_vi_out;

    endfunction: build_phase

    task run_phase(uvm_phase phase);
      forever
      begin
        fft_transaction_out tx;
        
        @(posedge dut_vi_out.clk);
        tx = fft_transaction_out::type_id::create("tx");
        tx.Out_Stream= dut_vi_out.Out_Stream;
        tx.Data_Out  = dut_vi_out.Data_Out;
        tx.next_data = dut_vi_out.next_data;
        aport.write(tx);
      end
    endtask: run_phase
endclass: fft_monitor_out

class fft_agent_in extends uvm_agent;
    `uvm_component_utils(fft_agent_in)

    uvm_analysis_port #(fft_transaction_in) aport;

    fft_sequencer_in fft_sequencer_in_h;
    fft_driver_in fft_driver_in_h;
    fft_monitor_in fft_monitor_in_h;

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new


    function void build_phase(uvm_phase phase);
        aport=new("aport",this);
        fft_sequencer_in_h=fft_sequencer_in::type_id::create("fft_sequencer_in_h",this);
        fft_driver_in_h=fft_driver_in::type_id::create("fft_driver_in_h",this);
        fft_monitor_in_h=fft_monitor_in::type_id::create("fft_monitor_in_h",this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        fft_driver_in_h.seq_item_port.connect(fft_sequencer_in_h.seq_item_export);
        fft_monitor_in_h.aport.connect(aport);
    endfunction: connect_phase

endclass: fft_agent_in

class fft_agent_out extends uvm_agent;
    `uvm_component_utils(fft_agent_out)

    uvm_analysis_port #(fft_transaction_out) aport;

    fft_monitor_out fft_monitor_out_h;

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        aport=new("aport",this);
        fft_monitor_out_h=fft_monitor_out::type_id::create("fft_monitor_out_h",this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        fft_monitor_out_h.aport.connect(aport);
    endfunction: connect_phase

endclass: fft_agent_out


class fft_env extends uvm_env;
    `uvm_component_utils(fft_env)

    fft_agent_in fft_agent_in_h;
    fft_agent_out fft_agent_out_h;
    fft_subscriber_in fft_subscriber_in_h;
    fft_subscriber_out fft_subscriber_out_h;
    fft_scoreboard fft_scoreboard_h;

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        fft_agent_in_h = fft_agent_in::type_id::create("fft_agent_in_h",this);
        fft_agent_out_h = fft_agent_out::type_id::create("fft_agent_out_h",this);
        fft_subscriber_in_h = fft_subscriber_in::type_id::create("fft_subscriber_in_h",this);
        fft_subscriber_out_h = fft_subscriber_out::type_id::create("fft_subscriber_out_h",this);
        fft_scoreboard_h = fft_scoreboard::type_id::create("fft_scoreboard_h",this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        fft_agent_in_h.aport.connect(fft_subscriber_in_h.analysis_export);
        fft_agent_out_h.aport.connect(fft_subscriber_out_h.analysis_export);
        fft_agent_in_h.aport.connect(fft_scoreboard_h.sb_in);
        fft_agent_out_h.aport.connect(fft_scoreboard_h.sb_out);
    endfunction: connect_phase

    function void start_of_simulation_phase(uvm_phase phase);
        uvm_top.set_report_verbosity_level_hier(UVM_DEBUG);
    endfunction: start_of_simulation_phase

endclass: fft_env

class fft_test extends uvm_test;
    `uvm_component_utils(fft_test)

    fft_dut_config dut_config_0;
    fft_env fft_env_h;

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        dut_config_0 = new();
        if(!uvm_config_db #(virtual dut_in)::get( this, "", "dut_vi_in", dut_config_0.dut_vi_in))
          `uvm_fatal("NOVIF", "No virtual interface set for dut_in")
        
        if(!uvm_config_db #(virtual dut_out)::get( this, "", "dut_vi_out", dut_config_0.dut_vi_out))
          `uvm_fatal("NOVIF", "No virtual interface set for dut_out")
            
        uvm_config_db #(fft_dut_config)::set(this, "*", "dut_config", dut_config_0);
        fft_env_h = fft_env::type_id::create("fft_env_h", this);
    endfunction: build_phase

endclass:fft_test

endpackage: modules_pkg
