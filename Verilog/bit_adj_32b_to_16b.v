module bit_adj_32b_to_16b (
  Data_in,
  Data_out,
  );
  
   
  input  [31:0] Data_in;
  output [15:0] Data_out;


  wire [15:0] truncate_temp;
  wire [15:0] rounding_temp;  

  assign truncate_temp  = Data_in[27:12];
  assign rounding_temp = {15'b0,Data_in[11]};

  ksa_top_16b ks1(.c0(1'b0), .i_a(truncate_temp), .i_b(rounding_temp), o_s(Data_out), o_carry());


endmodule
