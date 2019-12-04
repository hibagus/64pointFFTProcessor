module generic_complex_mult_block (
  A32,
  TYPESEL,
  R32
  );
  
  parameter [15:0]  C_PLUS_S   = 16'b0;
  parameter [15:0]  C_ONLY     = 16'b0;
  parameter [15:0]  C_MIN_S    = 16'b0;
   
  input     [31:0]  A32;
  input     [2:0]   TYPESEL;
  output    [31:0]  R32;

  wire      [31:0]  A32;
  wire      [2:0]   TYPESEL;
  wire      [31:0]  R32;

  wire      [15:0] REAL_A32;
  wire      [15:0] IMAG_A32;
  wire      [15:0] REAL_R32;
  wire      [15:0] IMAG_R32;
  wire      [15:0] REAL_MULT_OUT;
  wire      [15:0] IMAG_MULT_OUT;
  wire      [15:0] MUX_0_OUT;
  wire      [15:0] MUX_1_OUT;
  wire      [15:0] MUX_2_OUT;
  wire      [15:0] MUX_3_OUT;
  wire      [15:0] MUX_4_OUT;
  wire      [15:0] MUX_5_OUT;

  wire      [15:0] SIGINV_0_OUT;
  wire      [15:0] SIGINV_1_OUT;
  wire      [15:0] SIGINV_2_OUT;
  wire      [15:0] SIGINV_3_OUT;

  wire MUX_4_SELECTOR;
  wire MUX_5_SELECTOR;

  assign REAL_A32 = A32[31:16];
  assign IMAG_A32 = A32[15:0];
  assign REAL_R32 = MUX_4_OUT;
  assign IMAG_R32 = MUX_5_OUT;
  assign R32 = {REAL_R32, IMAG_R32};
  assign MUX_4_SELECTOR = ( TYPESEL[2] & ~(TYPESEL[1] ^ TYPESEL[0]));
  assign MUX_5_SELECTOR = (~TYPESEL[2] &  (TYPESEL[1] ^ TYPESEL[0]));
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst0 (
    .D0(REAL_A32),
    .D1(IMAG_A32),
    .S(TYPESEL[2]),
    .Y(MUX_0_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst1 (
    .D0(IMAG_A32),
    .D1(REAL_A32),
    .S(TYPESEL[2]),
    .Y(MUX_1_OUT)
  ); 
  
  sgninv_16b sgninv_16b_inst0 ( 
    .A16(MUX_0_OUT), 
    .R16(SIGINV_0_OUT)
  );
  
  sgninv_16b sgninv_16b_inst1 ( 
    .A16(MUX_1_OUT), 
    .R16(SIGINV_1_OUT)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst2 (
    .D0(MUX_0_OUT),
    .D1(SIGINV_0_OUT),
    .S(TYPESEL[1]),
    .Y(MUX_2_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst3 (
    .D0(MUX_1_OUT),
    .D1(SIGINV_1_OUT),
    .S(TYPESEL[0]),
    .Y(MUX_3_OUT)
  ); 

  generic_complex_mult_16b # (
    .C_PLUS_S(C_PLUS_S), 
    .C_ONLY(C_ONLY), 
    .C_MIN_S(C_MIN_S)
  ) generic_complex_mult_16b_inst0 (
    .REAL_A32(MUX_2_OUT), 
    .IMAG_A32(MUX_3_OUT), 
    .REAL_R32(REAL_MULT_OUT), 
    .IMAG_R32(IMAG_MULT_OUT)
  );
  
  sgninv_16b sgninv_16b_inst2 (
    .A16(REAL_MULT_OUT), 
    .R16(SIGINV_2_OUT)
  );
  
  sgninv_16b sgninv_16b_inst3 (
    .A16(IMAG_MULT_OUT), 
    .R16(SIGINV_3_OUT)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst4 (
    .D0(REAL_MULT_OUT),
    .D1(SIGINV_2_OUT),
    .S(MUX_4_SELECTOR),
    .Y(MUX_4_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst5 (
    .D0(IMAG_MULT_OUT),
    .D1(SIGINV_3_OUT),
    .S(MUX_5_SELECTOR),
    .Y(MUX_5_OUT)
  );
  
endmodule
