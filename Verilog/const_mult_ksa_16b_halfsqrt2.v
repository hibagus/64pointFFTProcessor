module complex_mult_ksa_16b_halfsqrt2 (
  Data_in,
  Data_out
  );
  
   
  input  [15:0] Data_in;
  output [15:0] Data_out;

  wire [15:0] siginv_0_out;
  wire [15:0] mux_0_out;
  wire [31:0] lshift_4_out;
  wire [31:0] lshift_6_out;
  wire [31:0] lshift_8_out;
  wire [31:0] lshift_9_out;
  wire [31:0] lshift_11_out;


  wire [31:0] adder_0_out;
  wire [31:0] adder_1_out;
  wire [31:0] adder_2_out;
  wire [31:0] adder_3_out;
  wire [31:0] adder_4_out;

  wire [15:0] bit_adj_out;
  wire [15:0] siginv_1_out;
  wire [15:0] mux_1_out;

  assign Data_out = mux_1_out;
  
  sgninv_16b(.A16(Data_in) , .R16(siginv_0_out));
  mux_2_to_1 #(16) mux0 (.D0(Data_in), .D1(siginv_0_out) , .S(Data_in[15]), .Y(mux_0_out));
  l_shifter #(16,4) lshift_4 (.D_in(mux_0_out), .D_out(lshift_4_out));
  l_shifter #(16,6) lshift_6 (.D_in(mux_0_out), .D_out(lshift_6_out));
  l_shifter #(16,8) lshift_8 (.D_in(mux_0_out), .D_out(lshift_8_out));
  l_shifter #(16,9) lshift_9 (.D_in(mux_0_out), .D_out(lshift_9_out));
  l_shifter #(16,11) lshift_11 (.D_in(mux_0_out), .D_out(lshift_11_out));

  ksa_top_32b adder_0(.c0(1'b0), .i_a(lshift_6_out), .i_b(lshift_8_out), o_s(adder_0_out), o_carry());
  ksa_top_32b adder_1(.c0(1'b0), .i_a(lshift_9_out), .i_b(lshift_11_out), o_s(adder_1_out), o_carry());
  ksa_top_32b adder_2(.c0(1'b0), .i_a(lshift_4_out), .i_b(adder_0_out), o_s(adder_2_out), o_carry());
  ksa_top_32b adder_3(.c0(1'b0), .i_a(adder_1_out), .i_b(adder_2_out), o_s(adder_3_out), o_carry());
 
  bit_adj_32b_to_16b bit_adj (.Data_in(adder_3_out), .Data_out(bit_adj_out));
  
  sgninv_16b(.A16(bit_adj_out) , .R16(siginv_1_out));
  mux_2_to_1 #(16) mux0 (.D0(bit_adj_out), .D1(siginv_1_out) , .S(Data_in[15]), .Y(mux_1_out));

endmodule
