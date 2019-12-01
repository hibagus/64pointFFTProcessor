module generic_mult_16b(
  D_in,
  D_out
  );
  
  // Block Parameter 
  parameter [15:0]  CONST    = 16'b0;
  
  input [15:0] D_in;
  output [15:0] D_out;

  wire [15:0] mux_0_out;
  wire [15:0] mux_1_out;
  wire [15:0] siginv_0_out;


  wire [31:0] lshift_0_out;
  wire [31:0] lshift_1_out;
  wire [31:0] lshift_2_out;
  wire [31:0] lshift_3_out;
  wire [31:0] lshift_4_out;
  wire [31:0] lshift_5_out;
  wire [31:0] lshift_6_out;
  wire [31:0] lshift_7_out;
  wire [31:0] lshift_8_out;
  wire [31:0] lshift_9_out;
  wire [31:0] lshift_10_out;
  wire [31:0] lshift_11_out;
  wire [31:0] lshift_12_out;
  wire [31:0] lshift_13_out;
  wire [31:0] lshift_14_out;
  wire [31:0] lshift_15_out;


  wire [31:0] adder_0_out;
  wire [31:0] adder_1_out;
  wire [31:0] adder_2_out;
  wire [31:0] adder_3_out;
  wire [31:0] adder_4_out;
  wire [31:0] adder_5_out;
  wire [31:0] adder_6_out;
  wire [31:0] adder_7_out;
  wire [31:0] adder_8_out;
  wire [31:0] adder_9_out;
  wire [31:0] adder_10_out;
  wire [31:0] adder_11_out;
  wire [31:0] adder_12_out;
  wire [31:0] adder_13_out;
  wire [31:0] adder_14_out;


  wire [31:0] bit_adj_out;
  wire [31:0] siginv_1_out;

assign D_out = mux_1_out;
  

  sgninv_16b sgninv0(.A16(D_in) , .R16(siginv_0_out));
  mux_2_to_1 #(16) mux0 (.D0(Data_in), .D1(siginv_0_out) , .S(Data_in[15]), .Y(mux_0_out));


  generate 
  if(CONST[0] == 1) lshifter lshift_0(.D_in(mux_0_out), .D_out(lshift_0_out));
  if(CONST[1] == 1) lshifter lshift_1(.D_in(mux_0_out), .D_out(lshift_1_out));
  if(CONST[2] == 1) lshifter lshift_2(.D_in(mux_0_out), .D_out(lshift_2_out));
  if(CONST[3] == 1) lshifter lshift_3(.D_in(mux_0_out), .D_out(lshift_3_out));
  if(CONST[4] == 1) lshifter lshift_4(.D_in(mux_0_out), .D_out(lshift_4_out));
  if(CONST[5] == 1) lshifter lshift_5(.D_in(mux_0_out), .D_out(lshift_5_out));
  if(CONST[6] == 1) lshifter lshift_6(.D_in(mux_0_out), .D_out(lshift_6_out));
  if(CONST[7] == 1) lshifter lshift_7(.D_in(mux_0_out), .D_out(lshift_7_out));
  if(CONST[8] == 1) lshifter lshift_8(.D_in(mux_0_out), .D_out(lshift_8_out));
  if(CONST[9] == 1) lshifter lshift_9(.D_in(mux_0_out), .D_out(lshift_9_out));
  if(CONST[10] == 1) lshifter lshift_10(.D_in(mux_0_out), .D_out(lshift_10_out));
  if(CONST[11] == 1) lshifter lshift_11(.D_in(mux_0_out), .D_out(lshift_11_out));
  if(CONST[12] == 1) lshifter lshift_12(.D_in(mux_0_out), .D_out(lshift_12_out));
  if(CONST[13] == 1) lshifter lshift_13(.D_in(mux_0_out), .D_out(lshift_13_out));
  if(CONST[14] == 1) lshifter lshift_14(.D_in(mux_0_out), .D_out(lshift_14_out));
  if(CONST[15] == 1) lshifter lshift_15(.D_in(mux_0_out), .D_out(lshift_15_out));



  if((CONST[0] == 1) && (CONST[1] == 1)) ksa_top_32b adder_0_both(.c0(1'b0), .i_a(lshift_0_out), .i_b(lshift_1_out), .o_s(adder_0_out), .o_carry());
  if((CONST[0] == 1) && (CONST[1] == 0)) assign adder_0_out = lshift_0_out;
  if((CONST[0] == 0) && (CONST[1] == 1)) assign adder_0_out = lshift_1_out;

  if((CONST[2] == 1) && (CONST[3] == 1)) ksa_top_32b adder_1_both(.c0(1'b0), .i_a(lshift_2_out), .i_b(lshift_3_out), .o_s(adder_1_out), .o_carry());
  if((CONST[2] == 1) && (CONST[3] == 0)) assign adder_1_out = lshift_2_out;
  if((CONST[2] == 0) && (CONST[3] == 1)) assign adder_1_out = lshift_3_out;

  if((CONST[4] == 1) && (CONST[5] == 1)) ksa_top_32b adder_2_both(.c0(1'b0), .i_a(lshift_4_out), .i_b(lshift_5_out), .o_s(adder_2_out), .o_carry());
  if((CONST[4] == 1) && (CONST[5] == 0)) assign adder_2_out = lshift_4_out;
  if((CONST[4] == 0) && (CONST[5] == 1)) assign adder_2_out = lshift_5_out;

  if((CONST[6] == 1) && (CONST[7] == 1)) ksa_top_32b adder_3_both(.c0(1'b0), .i_a(lshift_6_out), .i_b(lshift_7_out), .o_s(adder_3_out), .o_carry());
  if((CONST[6] == 1) && (CONST[7] == 0)) assign adder_3_out = lshift_6_out;
  if((CONST[6] == 0) && (CONST[7] == 1)) assign adder_3_out = lshift_7_out;

  if((CONST[8] == 1) && (CONST[9] == 1)) ksa_top_32b adder_4_both(.c0(1'b0), .i_a(lshift_8_out), .i_b(lshift_9_out), .o_s(adder_4_out), .o_carry());
  if((CONST[8] == 1) && (CONST[9] == 0)) assign adder_4_out = lshift_8_out;
  if((CONST[8] == 0) && (CONST[9] == 1)) assign adder_4_out = lshift_9_out;

  if((CONST[10] == 1) && (CONST[11] == 1)) ksa_top_32b adder_5_both(.c0(1'b0), .i_a(lshift_10_out), .i_b(lshift_11_out), .o_s(adder_5_out), .o_carry());
  if((CONST[10] == 1) && (CONST[11] == 0)) assign adder_5_out = lshift_10_out;
  if((CONST[10] == 0) && (CONST[11] == 1)) assign adder_5_out = lshift_11_out;

  if((CONST[12] == 1) && (CONST[13] == 1)) ksa_top_32b adder_6_both(.c0(1'b0), .i_a(lshift_12_out), .i_b(lshift_13_out), .o_s(adder_6_out), .o_carry());
  if((CONST[12] == 1) && (CONST[13] == 0)) assign adder_6_out = lshift_12_out;
  if((CONST[12] == 0) && (CONST[13] == 1)) assign adder_6_out = lshift_13_out;

  if((CONST[14] == 1) && (CONST[15] == 1)) ksa_top_32b adder_7_both(.c0(1'b0), .i_a(lshift_14_out), .i_b(lshift_15_out), .o_s(adder_7_out), .o_carry());
  if((CONST[14] == 1) && (CONST[15] == 0)) assign adder_7_out = lshift_14_out;
  if((CONST[14] == 0) && (CONST[15] == 1)) assign adder_7_out = lshift_15_out;


  if((CONST[0] == 1) && (CONST[1] == 1) && (CONST[2] == 1) && (CONST[3] == 1)) ksa_top_32b adder_8_both(.c0(1'b0), .i_a(adder_0_out), .i_b(adder_1_out), .o_s(adder_8_out), .o_carry());
  if((CONST[0] == 1) && (CONST[1] == 1) && (CONST[2] == 0) && (CONST[3] == 0)) assign adder_8_out = adder_0_out;
  if((CONST[0] == 0) && (CONST[1] == 0) && (CONST[2] == 1) && (CONST[3] == 1)) assign adder_8_out = adder_1_out;

  if((CONST[4] == 1) && (CONST[5] == 1) && (CONST[6] == 1) && (CONST[7] == 1)) ksa_top_32b adder_9_both(.c0(1'b0), .i_a(adder_2_out), .i_b(adder_3_out), .o_s(adder_9_out), .o_carry());
  if((CONST[4] == 1) && (CONST[5] == 1) && (CONST[6] == 0) && (CONST[7] == 0)) assign adder_9_out = adder_2_out;
  if((CONST[4] == 0) && (CONST[5] == 0) && (CONST[6] == 1) && (CONST[7] == 1)) assign adder_9_out = adder_3_out;

  if((CONST[8] == 1) && (CONST[9] == 1) && (CONST[10] == 1) && (CONST[11] == 1)) ksa_top_32b adder_10_both(.c0(1'b0), .i_a(adder_4_out), .i_b(adder_5_out), .o_s(adder_10_out), .o_carry());
  if((CONST[8] == 1) && (CONST[9] == 1) && (CONST[10] == 0) && (CONST[11] == 0)) assign adder_10_out = adder_4_out;
  if((CONST[8] == 0) && (CONST[9] == 0) && (CONST[10] == 1) && (CONST[11] == 1)) assign adder_10_out = adder_5_out;

  if((CONST[12] == 1) && (CONST[13] == 1) && (CONST[14] == 1) && (CONST[15] == 1)) ksa_top_32b adder_11_both(.c0(1'b0), .i_a(adder_6_out), .i_b(adder_7_out), .o_s(adder_11_out), .o_carry());
  if((CONST[12] == 1) && (CONST[13] == 1) && (CONST[14] == 0) && (CONST[15] == 0)) assign adder_11_out = adder_6_out;
  if((CONST[12] == 0) && (CONST[13] == 0) && (CONST[14] == 1) && (CONST[15] == 1)) assign adder_11_out = adder_7_out;


  if((CONST[0] == 1) && (CONST[1] == 1) && (CONST[2] == 1) && (CONST[3] == 1) && (CONST[4] == 1) && (CONST[5] == 1) && (CONST[6] == 1) && (CONST[7] == 1)) ksa_top_32b adder_12_both(.c0(1'b0), .i_a(adder_8_out), .i_b(adder_9_out), .o_s(adder_12_out), .o_carry());
  if((CONST[0] == 1) && (CONST[1] == 1) && (CONST[2] == 1) && (CONST[3] == 1) && (CONST[4] == 0) && (CONST[5] == 0) && (CONST[6] == 0) && (CONST[7] == 0)) assign adder_12_out = adder_8_out;
  if((CONST[0] == 0) && (CONST[1] == 0) && (CONST[2] == 0) && (CONST[3] == 0) && (CONST[4] == 1) && (CONST[5] == 1) && (CONST[6] == 1) && (CONST[7] == 1)) assign adder_12_out = adder_9_out;

  if((CONST[8] == 1) && (CONST[9] == 1) && (CONST[10] == 1) && (CONST[11] == 1) && (CONST[12] == 1) && (CONST[13] == 1) && (CONST[14] == 1) && (CONST[15] == 1)) ksa_top_32b adder_13_both(.c0(1'b0), .i_a(adder_10_out), .i_b(adder_11_out), .o_s(adder_13_out), .o_carry());
  if((CONST[8] == 1) && (CONST[9] == 1) && (CONST[10] == 1) && (CONST[11] == 1) && (CONST[12] == 0) && (CONST[13] == 0) && (CONST[14] == 0) && (CONST[15] == 0)) assign adder_13_out = adder_10_out;
  if((CONST[8] == 0) && (CONST[9] == 0) && (CONST[10] == 0) && (CONST[11] == 0) && (CONST[12] == 1) && (CONST[13] == 1) && (CONST[14] == 1) && (CONST[15] == 1)) assign adder_13_out = adder_11_out;



  if((CONST[0] == 1) && (CONST[1] == 1) && (CONST[2] == 1) && (CONST[3] == 1) && (CONST[4] == 1) && (CONST[5] == 1) && (CONST[6] == 1) && (CONST[7] == 1) && (CONST[8] == 1) && (CONST[9] == 1) && (CONST[10] == 1) && (CONST[11] == 1) && (CONST[12] == 1) && (CONST[13] == 1) && (CONST[14] == 1) && (CONST[15] == 1)) ksa_top_32b adder_14_both(.c0(1'b0), .i_a(adder_12_out), .i_b(adder_13_out), .o_s(adder_14_out), .o_carry());

  if((CONST[0] == 1) && (CONST[1] == 1) && (CONST[2] == 1) && (CONST[3] == 1) && (CONST[4] == 1) && (CONST[5] == 1) && (CONST[6] == 1) && (CONST[7] == 1) && (CONST[8] == 0) && (CONST[9] == 0) && (CONST[10] == 0) && (CONST[11] == 0) && (CONST[12] == 0) && (CONST[13] == 0) && (CONST[14] == 0) && (CONST[15] == 0)) assign adder_14_out = adder_12_out;

  if((CONST[0] == 0) && (CONST[1] == 0) && (CONST[2] == 0) && (CONST[3] == 0) && (CONST[4] == 0) && (CONST[5] == 0) && (CONST[6] == 0) && (CONST[7] == 0) && (CONST[8] == 1) && (CONST[9] == 1) && (CONST[10] == 1) && (CONST[11] == 1) && (CONST[12] == 1) && (CONST[13] == 1) && (CONST[14] == 1) && (CONST[15] == 1)) assign adder_14_out = adder_13_out;

  if((CONST[0] == 0) && (CONST[1] == 0) && (CONST[2] == 0) && (CONST[3] == 0) && (CONST[4] == 0) && (CONST[5] == 0) && (CONST[6] == 0) && (CONST[7] == 0) && (CONST[8] == 0) && (CONST[9] == 0) && (CONST[10] == 0) && (CONST[11] == 0) && (CONST[12] == 0) && (CONST[13] == 0) && (CONST[14] == 0) && (CONST[15] == 0)) assign adder_14_out = 32'b0;

  endgenerate

  bit_adj_32b_to_16b bit_adj(.Data_in(adder_14_out) , .Data_out(bit_adj_out));
  sgninv_16b sgninv1(.A16(bit_adj_out) , .R16(siginv_1_out));
  mux_2_to_1 #(16) mux1 (.D0(bit_adj_out), .D1(siginv_1_out) , .S(Data_in[15]), .Y(mux_1_out));


endmodule
