module complex_mult_twiddle_wn3_32b(
  A32,
  R32
  );
  
  input  [31:0] A32;
  output [31:0] R32;
  
  wire   [31:0] A32;
  wire   [31:0] R32;

  wire   [15:0] real_a32;
  wire   [15:0] imag_a32;        
  wire   [15:0] mult_0_out;
  wire   [15:0] subt_0_out;
  wire   [15:0] subt_1_out;
  wire   [15:0] halfmult_0_out;
  wire   [15:0] adder_0_out;
  wire   [15:0] sgninv_0_out;
  wire   [15:0] sgninv_1_out;

  assign real_a32 = A32[31:16];
  assign imag_a32 = A32[15:0];
  assign R32 = {sgninv_1_out, subt_1_out};

  sgninv_16b sgninv_16b_inst0 (
    .A16(mult_0_out), 
    .R16(sgninv_0_out)
  );
  
  const_mult_ksa_16b_sqrt2 const_mult_ksa_16b_sqrt2_inst0 (
    .Data_in(real_a32), 
    .Data_out(mult_0_out)
  );
  
  sub_ksa_16b sub_ksa_16b_inst0 (
    .A16(real_a32), 
    .B16(imag_a32), 
    .R16(subt_0_out)
  );
  
  const_mult_ksa_16b_halfsqrt2 const_mult_ksa_16b_halfsqrt2_inst0 (
    .Data_in(subt_0_out), 
    .Data_out(halfmult_0_out)
  );
  
  sgninv_16b sgninv_16b_inst1 (
    .A16(halfmult_0_out), 
    .R16(sgninv_1_out)
  );
  
  sub_ksa_16b sub_ksa_16b_inst1 (
    .A16(sgninv_0_out), 
    .B16(sgninv_1_out), 
    .R16(subt_1_out)
  );
  
endmodule
