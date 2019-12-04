module scalling_out(
  A32,
  Swap,
  R32
  );
  
  input   [31:0] A32;
  input          Swap;
  output  [31:0] R32;
  
  wire    [31:0] A32;
  wire           Swap;
  wire    [31:0] R32;
  
  wire    [15:0] real_a32;
  wire    [15:0] imag_a32;
  wire    [15:0] real_r32;
  wire    [15:0] imag_r32;
  wire    [15:0] mux0out;
  wire    [15:0] real_scale;
  wire    [15:0] imag_scale;
  wire    [31:0] temp_scale;
  
  assign real_a32          = A32[31:16];
  assign imag_a32          = A32[15:0];
  assign real_r32          = real_scale;
  assign imag_r32          = imag_scale;
  assign temp_scale[31:16] = real_r32;
  assign temp_scale[15:0]  = imag_r32;
  
  rshift_6_16b_to_16b rshift_6_16b_to_16b_inst0 (
    .Data_In(real_a32), 
    .Data_Out(real_scale)
  );
  
  rshift_6_16b_to_16b rshift_6_16b_to_16b_inst1 (
    .Data_In(imag_a32), 
    .Data_Out(imag_scale)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_inst0 (
    .D0(A32),
    .D1(temp_scale),
    .S(Swap),
    .Y(R32)
  ); 
  
endmodule
