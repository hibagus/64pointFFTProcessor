`include "uvm_macros.svh"
package coverage;
import sequences::*;
import uvm_pkg::*;

class fft_subscriber_in extends uvm_subscriber #(fft_transaction_in);
    `uvm_component_utils(fft_subscriber_in)

    logic [31:0] In_Stream;
    logic        Mode;
    logic        Data_Start;

    covergroup inputs;
        cp_In_Stream: coverpoint In_Stream
        {
        bins cornerIn1 = {32'hFFFF_FFFF};
        bins cornerIn2 = {32'h8888_8888};
        }

        cp_Mode: coverpoint Mode
        {
        bins M0 = {1'b0};
        bins M1 = {1'b1};
        }

        cp_Data_Start: coverpoint Data_Start
        {
        bins D0 = {1'b0};
        bins D1 = {1'b1};
        }

    endgroup: inputs
    

    function new(string name, uvm_component parent);
        super.new(name,parent);
        inputs=new;
    endfunction: new

    function void write(fft_transaction_in t);
        In_Stream={t.In_Stream};
        Mode={t.Mode};
        Data_Start={t.Data_Start};
        inputs.sample();
    endfunction: write

endclass: fft_subscriber_in

class fft_subscriber_out extends uvm_subscriber #(fft_transaction_out);
    `uvm_component_utils(fft_subscriber_out)

    logic [31:0] Out_Stream;
    logic Data_Out;
    logic next_data;
    
    covergroup outputs;
        cp_Out_Stream: coverpoint Out_Stream
        {
        bins corner_Out1 = {32'hFFFF_FFFF};
        bins corner_Out2 = {32'd0};
        }

        cp_Data_Out: coverpoint Data_Out
        {
        bins D0 = {1'b0};
        bins D1 = {1'b1};
        }

        cp_next_data: coverpoint next_data
        {
        bins n0 = {1'b0};
        bins n1 = {1'b1};
        }  
    endgroup: outputs
    

function new(string name, uvm_component parent);
    super.new(name,parent);
    outputs=new;
endfunction: new

function void write(fft_transaction_out t);
    Out_Stream={t.Out_Stream};
    Data_Out={t.Data_Out};
    next_data={t.next_data};
    outputs.sample();
endfunction: write
endclass: fft_subscriber_out

endpackage: coverage
