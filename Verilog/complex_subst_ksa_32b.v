module complex_subst_ksa_32b(
  A32,
  B32,
  R32,
  C_OUT32
  );

  input  [31:0] A32;
  input  [31:0] B32;
  output [31:0] R32;
  output [1:0]  C_OUT32;

  wire   [31:0] A32;
  wire   [31:0] B32;
  wire   [31:0] R32;
  wire   [1:0]  C_OUT32;
  
  wire   [15:0] REAL_A32;
  wire   [15:0] REAL_B32;
  wire   [15:0] REAL_R32;
  wire   [15:0] IMAG_A32;
  wire   [15:0] IMAG_B32;
  wire   [15:0] IMAG_R32;

  assign REAL_A32   = A32[31:16];
  assign REAL_B32   = B32[31:16];
  assign IMAG_A32   = A32[15:0];
  assign IMAG_B32   = B32[15:0];
  assign R32[31:16] = REAL_R32;
  assign R32[15:0]  = IMAG_R32;

  sub_ksa_16b subt_ksa_16b_instreal (
    .A16(REAL_A32), 
    .B16(REAL_B32), 
    .R16(REAL_R32), 
    .COUT_16(C_OUT32[1])
  );
  
  sub_ksa_16b subt_ksa_16b_instimag (
    .A16(IMAG_A32), 
    .B16(IMAG_B32), 
    .R16(IMAG_R32), 
    .COUT_16(C_OUT32[0])
  );

endmodule
