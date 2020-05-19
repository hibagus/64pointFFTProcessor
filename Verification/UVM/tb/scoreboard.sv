`include "uvm_macros.svh"
package scoreboard; 
import uvm_pkg::*;
import sequences::*;

class fft_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(fft_scoreboard)

    uvm_analysis_export #(fft_transaction_in) sb_in;
    uvm_analysis_export #(fft_transaction_out) sb_out;

    uvm_tlm_analysis_fifo #(fft_transaction_in) fifo_in;
    uvm_tlm_analysis_fifo #(fft_transaction_out) fifo_out;

    fft_transaction_in tx_in;
    fft_transaction_out tx_out;

    logic [31:0] in_data [0:63];
    logic [31:0] golden  [0:63];
    logic [31:0] out_data[0:63];
    logic [31:0] index1 = 0;
    logic [31:0] index2 = 0;
    logic next_flag  = 1;

    function new(string name, uvm_component parent);
        super.new(name,parent);
        tx_in=new("tx_in");
        tx_out=new("tx_out");
    endfunction: new

    function void build_phase(uvm_phase phase);
        sb_in=new("sb_in",this);
        sb_out=new("sb_out",this);
        fifo_in=new("fifo_in",this);
        fifo_out=new("fifo_out",this);
    endfunction: build_phase

    function void connect_phase(uvm_phase phase);
        sb_in.connect(fifo_in.analysis_export);
        sb_out.connect(fifo_out.analysis_export);
    endfunction: connect_phase

    task run();
        forever begin
            fifo_in.get(tx_in);
            fifo_out.get(tx_out);
            if(tx_in.Data_Start && (tx_in.rst == 0) && (index1 < 64))begin
                in_data[index1] =  tx_in.In_Stream;
                index1 = index1 + 1;
                if (index1==64) begin
                    generate_results();
                end
            end
            if(tx_out.Data_Out)begin
                out_data[index2] =  tx_out.Out_Stream;
                index2 = index2 + 1;
                if (index2==64) begin
                    compare();
                end
            end
        end
    endtask: run

    extern virtual function void generate_results; 
    extern virtual function void compare; 
        
endclass: fft_scoreboard

function void fft_scoreboard::compare;
    // Compare "out_data"  and "golden"
    for (int i = 0; i < 64; i++) begin
        `uvm_info(get_type_name(),$sformatf("Gold Out: %h, FFT Out: %h",golden[i], out_data[i]), UVM_DEBUG);
    end
    
endfunction

function void fft_scoreboard::generate_results;
    // Write a golden FFT 
    for (int i = 0; i < 64; i++) begin
        golden[i] = in_data[i];
    end
endfunction

endpackage: scoreboard
