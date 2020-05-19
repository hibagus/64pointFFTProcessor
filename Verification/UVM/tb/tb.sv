`timescale 1ns / 100ps
`include "uvm_macros.svh"
import uvm_pkg::*;
import modules_pkg::*;
import sequences::*;
import coverage::*;
import scoreboard::*;
import tests::*;

module dut(dut_in _in, dut_out _out);

wire [31:0] Out_Stream_fft_to_ifft;
wire        Data_Out_fft_to_ifft;

fft_64p_16b_top fft0(
    .In_Stream(_in.In_Stream), 
    .Mode(_in.Mode), 
    .Data_Start(_in.Data_Start), 
    .clk(_in.clk), 
    .rst(_in.rst), 
    //.next_data(_out.next_data),
    .Out_Stream(Out_Stream_fft_to_ifft), 
    .Data_Out(Data_Out_fft_to_ifft)
);

fft_64p_16b_top ifft0(
    .In_Stream(Out_Stream_fft_to_ifft),
    .Mode(1'b1),
    .Data_Start(Data_Out_fft_to_ifft),
    .clk(_in.clk),
    .rst(_in.rst),
    .next_data(_out.next_data),
    .Out_Stream(_out.Out_Stream),
    .Data_Out(_out.Data_Out)

);


endmodule: dut

module top;    
dut_in dut_in1();
dut_out dut_out1();

initial begin
    dut_in1.clk<=0;
    forever #50 dut_in1.clk<=~dut_in1.clk;
end

initial begin
    dut_out1.clk<=0;
    forever #50 dut_out1.clk<=~dut_out1.clk;
end

dut dut1(._in(dut_in1), ._out(dut_out1));

initial begin
    uvm_config_db #(virtual dut_in)::set(null,"uvm_test_top","dut_vi_in",dut_in1);
    uvm_config_db #(virtual dut_out)::set(null,"uvm_test_top","dut_vi_out",dut_out1);
    uvm_top.finish_on_completion=1;

    run_test("test1");
end

endmodule: top
