module const_mult_ksa_16b_sqrt2 (
  Data_in,
  Data_out
  );
  
   
  input  [15:0] Data_in;
  output [15:0] Data_out;

  wire [15:0] siginv_0_out;
  wire [15:0] mux_0_out;
  wire [31:0] lshift_0_out;
  wire [31:0] lshift_5_out;
  wire [31:0] lshift_7_out;
  wire [31:0] lshift_9_out;
  wire [31:0] lshift_10_out;
  wire [31:0] lshift_12_out;


  wire [31:0] adder_0_out;
  wire [31:0] adder_1_out;
  wire [31:0] adder_2_out;
  wire [31:0] adder_3_out;
  wire [31:0] adder_4_out;

  wire [15:0] bit_adj_out;
  wire [15:0] siginv_1_out;
  wire [15:0] mux_1_out;

  assign Data_out = mux_1_out;
  
  sgninv_16b sgninv0(.A16(Data_in) , .R16(siginv_0_out));
  mux_2_to_1 #(16) mux0 (.D0(Data_in), .D1(siginv_0_out) , .S(Data_in[15]), .Y(mux_0_out));
  lshifter #(16,0) lshift_0 (.D_in(mux_0_out), .D_out(lshift_0_out));
  lshifter #(16,5) lshift_5 (.D_in(mux_0_out), .D_out(lshift_5_out));
  lshifter #(16,7) lshift_7 (.D_in(mux_0_out), .D_out(lshift_7_out));
  lshifter #(16,9) lshift_9 (.D_in(mux_0_out), .D_out(lshift_9_out));
  lshifter #(16,10) lshift_10 (.D_in(mux_0_out), .D_out(lshift_10_out));
  lshifter #(16,12) lshift_12 (.D_in(mux_0_out), .D_out(lshift_12_out));

  ksa_top_32b adder_0(.c0(1'b0), .i_a(lshift_0_out), .i_b(lshift_5_out), .o_s(adder_0_out), .o_carry());
  ksa_top_32b adder_1(.c0(1'b0), .i_a(lshift_7_out), .i_b(lshift_9_out), .o_s(adder_1_out), .o_carry());
  ksa_top_32b adder_2(.c0(1'b0), .i_a(lshift_10_out), .i_b(lshift_12_out), .o_s(adder_2_out), .o_carry());
  ksa_top_32b adder_3(.c0(1'b0), .i_a(adder_0_out), .i_b(adder_1_out), .o_s(adder_3_out), .o_carry());
  ksa_top_32b adder_4(.c0(1'b0), .i_a(adder_3_out), .i_b(adder_2_out), .o_s(adder_4_out), .o_carry());
 
  bit_adj_32b_to_16b bit_adj (.Data_in(adder_4_out), .Data_out(bit_adj_out));
  
  sgninv_16b sgninv1(.A16(bit_adj_out) , .R16(siginv_1_out));
  mux_2_to_1 #(16) mux1 (.D0(bit_adj_out), .D1(siginv_1_out) , .S(Data_in[15]), .Y(mux_1_out));

endmodule
