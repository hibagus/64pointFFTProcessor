module complex_mult_twiddle_wn2_32b(
  A32,
  R32
  );
  
  input  [31:0] A32;
  output [31:0] R32;

  wire   [31:0] A32;
  wire   [31:0] R32;

  wire   [15:0] real_a32;
  wire   [15:0] imag_a32;
  wire   [15:0] real_r32;
  wire   [15:0] imag_r32;
  wire   [15:0] siginvout;


  assign real_a32 = A32[31:16];
  assign imag_a32 = A32[15:0];
  assign real_r32 = imag_a32;
  assign imag_r32 = siginvout;
  assign R32      = {real_r32,imag_r32};

  sgninv_16b sgninv_16b_inst0 (
    .A16(real_a32), 
    .R16(siginvout)
  );

endmodule
