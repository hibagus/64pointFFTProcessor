module bypass_32b (
  A32,
  TYPESEL,
  R32);

  input  [31:0]  A32;
  input  [2:0]   TYPESEL;
  output [31:0]  R32;
  
  wire   [31:0]  A32;
  wire   [2:0]   TYPESEL;
  wire   [31:0]  R32;
  
  wire   [15:0] real_a32;
  wire   [15:0] imag_a32;
  wire   [15:0] real_r32;
  wire   [15:0] imag_r32;
  wire   [15:0] mux0out;
  wire   [15:0] mux1out;
  wire   [15:0] mux2out;
  wire   [15:0] mux3out;
  wire   [15:0] sgninv_0_out;
  wire   [15:0] sgninv_1_out;
  
  assign real_a32   = A32[31:16];
  assign imag_a32   = A32[15:0];
  assign real_r32   = mux2out;
  assign imag_r32   = mux3out;
  assign R32[31:16] = real_r32;
  assign R32[15:0]  = imag_r32;
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst0 (
    .D0(real_a32),
    .D1(imag_a32),
    .S(TYPESEL[2]),
    .Y(mux0out)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst1 (
    .D0(imag_a32),
    .D1(real_a32),
    .S(TYPESEL[2]),
    .Y(mux1out)
  ); 
  
  sgninv_16b sgninv_16b_inst0 (
    .A16(mux0out), 
    .R16(sgninv_0_out)
  );
  
  sgninv_16b sgninv_16b_inst1 (
    .A16(mux1out), 
    .R16(sgninv_1_out)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst2 (
    .D0(mux0out),
    .D1(sgninv_0_out),
    .S(TYPESEL[1]),
    .Y(mux2out)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst3 (
    .D0(mux1out),
    .D1(sgninv_1_out),
    .S(TYPESEL[0]),
    .Y(mux3out)
  ); 
  
endmodule
