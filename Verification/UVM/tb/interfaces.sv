interface dut_in;
    logic           clk, rst;
    logic           Mode;
    logic           Data_Start;
    logic   [31:0]  In_Stream;
endinterface: dut_in


interface dut_out;
    logic	clk;
 //TODO: Complete the dut_out interface
    logic   [31:0] Out_Stream;
    logic   Data_Out, next_data;
endinterface: dut_out
