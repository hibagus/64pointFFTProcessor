`include "uvm_macros.svh"
package sequences;

    import uvm_pkg::*;

    class fft_transaction_in extends uvm_sequence_item;
		`uvm_object_utils(fft_transaction_in)

        rand logic [31:0] In_Stream;
        rand logic Mode;
        rand logic Data_Start;
        rand logic rst;

        constraint c_mode {Mode == 0;}
        constraint c_Data_Start {Data_Start == 1;}
         
        // In Stream Constraint
        // -0.100097656250000    <   data   <   0.100097656250000
		constraint c_In_Stream_imag { (In_Stream[15 :0] >= 16'hFE66) || (In_Stream[15: 0] <= 16'h019A);} 
        constraint c_In_Stream_real { (In_Stream[31:16] >= 16'hFE66) || (In_Stream[31:16] <= 16'h019A);} 

        
        function new(string name = "");
            super.new(name);
        endfunction: new

    endclass: fft_transaction_in


    class fft_transaction_out extends uvm_sequence_item;
        `uvm_object_utils(fft_transaction_out)

        logic [31:0] Out_Stream;
        logic Data_Out;
        logic next_data;

        function new(string name = "");
            super.new(name);
        endfunction: new;

    endclass: fft_transaction_out

    class simple_seq extends uvm_sequence #(fft_transaction_in);
        `uvm_object_utils(simple_seq)

        function new(string name = "");
            super.new(name);
        endfunction: new

        logic [31:0] rom [0:63];

        function void init_data();
        	$readmemh("timeseries.hex", rom);
        endfunction : init_data
 
  		static int idx = 0;
        task body;
            fft_transaction_in tx;
            tx=fft_transaction_in::type_id::create("tx");
            //init_data();
            start_item(tx);
            assert(tx.randomize());
            tx.rst = 0;
            //tx.In_Stream = rom[idx];
            //idx++;
            finish_item(tx);
        endtask: body
    endclass: simple_seq

    class reset_seq extends uvm_sequence #(fft_transaction_in);
        `uvm_object_utils(reset_seq)

        function new(string name = "");
            super.new(name);
        endfunction: new

        task body;
            fft_transaction_in tx;
            tx=fft_transaction_in::type_id::create("tx");
            start_item(tx);
            assert(tx.randomize());
            tx.rst = 1;
            finish_item(tx);
        endtask: body
    endclass: reset_seq

    class seq_of_commands extends uvm_sequence #(fft_transaction_in);
        `uvm_object_utils(seq_of_commands)
        `uvm_declare_p_sequencer(uvm_sequencer#(fft_transaction_in))

        function new (string name = "");
            super.new(name);
        endfunction: new

        task body;
			repeat(5)
            begin
                reset_seq seqr;
                seqr = reset_seq::type_id::create("seqr");
                assert( seqr.randomize() );
                seqr.start(p_sequencer);
            end

            repeat(350)
            begin
                simple_seq seq;
                seq = simple_seq::type_id::create("seq");
                assert( seq.randomize() );
                seq.start(p_sequencer);
            end
        endtask: body

    endclass: seq_of_commands

endpackage: sequences
