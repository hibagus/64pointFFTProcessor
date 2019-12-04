module fft_8p_16b_top(
  xt0,
  xt1,
  xt2,
  xt3,
  xt4,
  xt5,
  xt6,
  xt7,
  xf0,
  xf1,
  xf2,
  xf3,
  xf4,
  xf5,
  xf6,
  xf7
  );

  input   [31:0] xt0;
  input   [31:0] xt1;
  input   [31:0] xt2;
  input   [31:0] xt3;
  input   [31:0] xt4;
  input   [31:0] xt5;
  input   [31:0] xt6;
  input   [31:0] xt7;
  output  [31:0] xf0;
  output  [31:0] xf1;
  output  [31:0] xf2;
  output  [31:0] xf3;
  output  [31:0] xf4;
  output  [31:0] xf5;
  output  [31:0] xf6;
  output  [31:0] xf7;

  wire    [31:0] xt0;
  wire    [31:0] xt1;
  wire    [31:0] xt2;
  wire    [31:0] xt3;
  wire    [31:0] xt4;
  wire    [31:0] xt5;
  wire    [31:0] xt6;
  wire    [31:0] xt7;
  wire    [31:0] xf0;
  wire    [31:0] xf1;
  wire    [31:0] xf2;
  wire    [31:0] xf3;
  wire    [31:0] xf4;
  wire    [31:0] xf5;
  wire    [31:0] xf6;
  wire    [31:0] xf7;
  
  wire    [31:0] cmult_wn0_0_out;
  wire    [31:0] cmult_wn0_1_out;
  wire    [31:0] cmult_wn0_2_out;
  wire    [31:0] cmult_wn0_3_out;
  wire    [31:0] cmult_wn0_4_out;
  wire    [31:0] cmult_wn0_5_out;
  wire    [31:0] cmult_wn0_6_out;
  wire    [31:0] cmult_wn1_0_out;
  wire    [31:0] cmult_wn2_0_out;
  wire    [31:0] cmult_wn2_1_out;
  wire    [31:0] cmult_wn2_2_out;
  wire    [31:0] cmult_wn3_0_out;
          
  wire    [31:0] cadder_0_out;
  wire    [31:0] cadder_1_out;
  wire    [31:0] cadder_2_out;
  wire    [31:0] cadder_3_out;
  wire    [31:0] cadder_4_out;
  wire    [31:0] cadder_5_out;
  wire    [31:0] cadder_6_out;
  wire    [31:0] cadder_7_out;
  wire    [31:0] cadder_8_out;
  wire    [31:0] cadder_9_out;
  wire    [31:0] cadder_10_out;
  wire    [31:0] cadder_11_out;
          
  wire    [31:0] csubtr_0_out;
  wire    [31:0] csubtr_1_out;
  wire    [31:0] csubtr_2_out;
  wire    [31:0] csubtr_3_out;
  wire    [31:0] csubtr_4_out;
  wire    [31:0] csubtr_5_out;
  wire    [31:0] csubtr_6_out;
  wire    [31:0] csubtr_7_out;
  wire    [31:0] csubtr_8_out;
  wire    [31:0] csubtr_9_out;
  wire    [31:0] csubtr_10_out;
  wire    [31:0] csubtr_11_out;
  
  assign xf0 = cadder_8_out;
  assign xf1 = cadder_9_out;
  assign xf2 = cadder_10_out;
  assign xf3 = cadder_11_out;
  assign xf4 = csubtr_8_out;
  assign xf5 = csubtr_9_out;
  assign xf6 = csubtr_10_out;
  assign xf7 = csubtr_11_out;

  complex_mult_twiddle_wn0_32b cmult_wn0_0 (
  .A32(xt4), 
  .R32(cmult_wn0_0_out)
  );
  
  complex_mult_twiddle_wn0_32b cmult_wn0_1 (
  .A32(xt6), 
  .R32(cmult_wn0_1_out)
  );
  
  complex_mult_twiddle_wn0_32b cmult_wn0_2 (
  .A32(xt5), 
  .R32(cmult_wn0_2_out)
  );
  
  complex_mult_twiddle_wn0_32b cmult_wn0_3 (
  .A32(xt7), 
  .R32(cmult_wn0_3_out)
  );
  
  complex_adder_ksa_32b cadder_0 (
  .A32(xt0), 
  .B32(cmult_wn0_0_out), 
  .R32(cadder_0_out)
  );
  
  complex_subst_ksa_32b csubtr_0 (
  .A32(xt0), 
  .B32(cmult_wn0_0_out), 
  .R32(csubtr_0_out)
  );
  
  complex_adder_ksa_32b cadder_1 (
  .A32(xt2), 
  .B32(cmult_wn0_1_out), 
  .R32(cadder_1_out)
  );
  
  complex_subst_ksa_32b csubtr_1 (
  .A32(xt2), 
  .B32(cmult_wn0_1_out), 
  .R32(csubtr_1_out)
  );
  
  complex_adder_ksa_32b cadder_2 (
  .A32(xt1), 
  .B32(cmult_wn0_2_out), 
  .R32(cadder_2_out)
  );
  
  complex_subst_ksa_32b csubtr_2 (
  .A32(xt1), 
  .B32(cmult_wn0_2_out), 
  .R32(csubtr_2_out)
  );
  
  complex_adder_ksa_32b cadder_3 (
  .A32(xt3), 
  .B32(cmult_wn0_3_out), 
  .R32(cadder_3_out)
  );
  
  complex_subst_ksa_32b csubtr_3 (
  .A32(xt3), 
  .B32(cmult_wn0_3_out), 
  .R32(csubtr_3_out)
  );
  
  complex_mult_twiddle_wn0_32b cmult_wn0_4 (
  .A32(cadder_1_out), 
  .R32(cmult_wn0_4_out)
  );
  
  complex_mult_twiddle_wn2_32b cmult_wn2_0 (
  .A32(csubtr_1_out), 
  .R32(cmult_wn2_0_out)
  );
  
  complex_mult_twiddle_wn0_32b cmult_wn0_5 (
  .A32(cadder_3_out), 
  .R32(cmult_wn0_5_out)
  );
  
  complex_mult_twiddle_wn2_32b cmult_wn2_1 (
  .A32(csubtr_3_out), 
  .R32(cmult_wn2_1_out)
  );
  
  complex_adder_ksa_32b cadder_4 (
  .A32(cadder_0_out), 
  .B32(cmult_wn0_4_out), 
  .R32(cadder_4_out)
  );
  
  complex_adder_ksa_32b cadder_5 (
  .A32(csubtr_0_out), 
  .B32(cmult_wn2_0_out), 
  .R32(cadder_5_out)
  );
  
  complex_subst_ksa_32b csubtr_4 (
  .A32(cadder_0_out), 
  .B32(cmult_wn0_4_out), 
  .R32(csubtr_4_out)
  );
  
  complex_subst_ksa_32b csubtr_5 (
  .A32(csubtr_0_out), 
  .B32(cmult_wn2_0_out), 
  .R32(csubtr_5_out)
  );
  
  complex_adder_ksa_32b cadder_6 (
  .A32(cadder_2_out), 
  .B32(cmult_wn0_5_out), 
  .R32(cadder_6_out)
  );
  
  complex_adder_ksa_32b cadder_7 (
  .A32(csubtr_2_out), 
  .B32(cmult_wn2_1_out), 
  .R32(cadder_7_out)
  );
  
  complex_subst_ksa_32b csubtr_6 (
  .A32(cadder_2_out), 
  .B32(cmult_wn0_5_out), 
  .R32(csubtr_6_out)
  );
  
  complex_subst_ksa_32b csubtr_7 (
  .A32(csubtr_2_out), 
  .B32(cmult_wn2_1_out), 
  .R32(csubtr_7_out)
  );
  
  complex_mult_twiddle_wn0_32b cmult_wn0_6 (
  .A32(cadder_6_out), 
  .R32(cmult_wn0_6_out)
  );
  
  complex_mult_twiddle_wn1_32b cmult_wn1_0 (
  .A32(cadder_7_out), 
  .R32(cmult_wn1_0_out)
  );
  
  complex_mult_twiddle_wn2_32b cmult_wn2_2 (
  .A32(csubtr_6_out), 
  .R32(cmult_wn2_2_out)
  );
  
  complex_mult_twiddle_wn3_32b cmult_wn3_0 (
  .A32(csubtr_7_out), 
  .R32(cmult_wn3_0_out)
  );
  
  complex_adder_ksa_32b cadder_8 (
  .A32(cadder_4_out), 
  .B32(cmult_wn0_6_out), 
  .R32(cadder_8_out)
  );
  
  complex_adder_ksa_32b cadder_9 (
  .A32(cadder_5_out), 
  .B32(cmult_wn1_0_out), 
  .R32(cadder_9_out)
  );
  
  complex_adder_ksa_32b cadder_10 (
  .A32(csubtr_4_out), 
  .B32(cmult_wn2_2_out), 
  .R32(cadder_10_out)
  );
  
  complex_adder_ksa_32b cadder_11 (
  .A32(csubtr_5_out), 
  .B32(cmult_wn3_0_out), 
  .R32(cadder_11_out)
  );
  
  complex_subst_ksa_32b csubtr_8 (
  .A32(cadder_4_out), 
  .B32(cmult_wn0_6_out), 
  .R32(csubtr_8_out)
  );
  
  complex_subst_ksa_32b csubtr_9 (
  .A32(cadder_5_out), 
  .B32(cmult_wn1_0_out), 
  .R32(csubtr_9_out)
  );
  
  complex_subst_ksa_32b csubtr_10 (
  .A32(csubtr_4_out), 
  .B32(cmult_wn2_2_out), 
  .R32(csubtr_10_out)
  );
  
  complex_subst_ksa_32b csubtr_11 (
  .A32(csubtr_5_out), 
  .B32(cmult_wn3_0_out), 
  .R32(csubtr_11_out)
  );

endmodule
