module real_imaginary_interchange(
  A32,
  Swap,
  R32
  );
  
  input   [31:0]  A32;
  input           Swap;
  output  [31:0]  R32;
  
  wire    [31:0]  A32;
  wire            Swap;
  wire    [31:0]  R32;
  
  wire    [15:0]  real_a32;
  wire    [15:0]  imag_a32;
  wire    [15:0]  real_r32;
  wire    [15:0]  imag_r32;
  wire    [15:0]  mux0out;
  wire    [15:0]  mux1out;
  
  assign real_a32   = A32[31:16];
  assign imag_a32   = A32[15:0];
  assign real_r32   = mux0out;
  assign imag_r32   = mux1out;
  assign R32[31:16] = real_r32;
  assign R32[15:0]  = imag_r32;
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst0 (
    .D0(real_a32),
    .D1(imag_a32),
    .S(Swap),
    .Y(mux0out)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst1 (
    .D0(imag_a32),
    .D1(real_a32),
    .S(Swap),
    .Y(mux1out)
  ); 
  

endmodule
