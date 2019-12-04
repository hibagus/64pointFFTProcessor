module generic_complex_mult_16b (
  REAL_A32,
  IMAG_A32,
  REAL_R32,
  IMAG_R32
  );
  
  parameter [15:0]  C_PLUS_S   = 16'b0;
  parameter [15:0]  C_ONLY     = 16'b0;
  parameter [15:0]  C_MIN_S    = 16'b0;
   
  input     [15:0]  REAL_A32;
  input     [15:0]  IMAG_A32;
  output    [15:0]  REAL_R32;
  output    [15:0]  IMAG_R32;

  wire      [15:0]  REAL_A32;
  wire      [15:0]  IMAG_A32;
  wire      [15:0]  REAL_R32;
  wire      [15:0]  IMAG_R32;
  
  wire      [15:0] adder_1_out;
  wire      [15:0] mult_c_plus_s_out;
  wire      [15:0] mult_c_min_s_out;
  wire      [15:0] mult_c_out;
  wire      [15:0] subtr_0_out;
  wire      [15:0] subtr_1_out;

  assign REAL_R32 = adder_1_out;
  assign IMAG_R32 = subtr_1_out;

  generic_mult_16b # (
    .CONST(C_PLUS_S)
  ) generic_mult_16b_c_plus_s (
    .D_in(REAL_A32), 
    .D_out(mult_c_plus_s_out)
  );
  
  generic_mult_16b # (
    .CONST(C_MIN_S) 
  ) generic_mult_16b_c_min_s (
    .D_in(IMAG_A32), 
    .D_out(mult_c_min_s_out)
  );
  
  sub_ksa_16b sub_ksa_16b_inst0 (
    .A16(REAL_A32), 
    .B16(IMAG_A32), 
    .R16(subtr_0_out)
  );
  
  generic_mult_16b # (
    .CONST(C_ONLY)
  ) generic_mult_16b_c_only (
    .D_in(subtr_0_out), 
    .D_out(mult_c_out)
  );
  
  sub_ksa_16b sub_ksa_16b_inst1 (
    .A16(mult_c_plus_s_out), 
    .B16(mult_c_out), 
    .R16(subtr_1_out)
  );
  
  ksa_top_16b ksa_top_16b_inst0 (
    .c0(1'b0), 
    .i_a(mult_c_min_s_out), 
    .i_b(mult_c_out), 
    .o_s(adder_1_out), 
    .o_carry()
  );

endmodule
