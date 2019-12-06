module interdimensional_multiplier(
  clk,
  rst,
  SET_0_IN,
  SET_1_IN,
  SET_2_IN,
  SET_3_IN,
  SET_4_IN,
  SET_5_IN,
  SET_6_IN,
  SET_7_IN,
  Shuf_Ctrl_0,
  Shuf_Ctrl_1,
  Shuf_Ctrl_2,
  Shuf_Ctrl_3,
  Shuf_Ctrl_4,
  Shuf_Ctrl_5,
  Shuf_Ctrl_6,
  Shuf_Ctrl_7,
  Type_Sel_0,
  Type_Sel_1,
  Type_Sel_2,
  Type_Sel_3,
  Type_Sel_4,
  Type_Sel_5,
  Type_Sel_6,
  Type_Sel_7,
  Bypass_Sel_0,
  Bypass_Sel_1,
  Bypass_Sel_2,
  Bypass_Sel_3,
  Bypass_Sel_4,
  Bypass_Sel_5,
  Bypass_Sel_6,
  Bypass_Sel_7,
  DeShuf_Ctrl_0,
  DeShuf_Ctrl_1,
  DeShuf_Ctrl_2,
  DeShuf_Ctrl_3,
  DeShuf_Ctrl_4,
  DeShuf_Ctrl_5,
  DeShuf_Ctrl_6,
  DeShuf_Ctrl_7,
  Bypass_EN_0,
  Bypass_EN_1,
  Bypass_EN_2,
  Bypass_EN_3,
  Bypass_EN_4,
  Bypass_EN_5,
  Bypass_EN_6,
  Bypass_EN_7,
  Hold_Ctrl_0,
  Hold_Ctrl_1,
  Hold_Ctrl_2,
  Hold_Ctrl_3,
  Hold_Ctrl_4,
  Hold_Ctrl_5,
  Hold_Ctrl_6,
  Hold_Ctrl_7,
  DFF_Ctrl_0,
  DFF_Ctrl_1,
  DFF_Ctrl_2,
  DFF_Ctrl_3,
  DFF_Ctrl_4,
  DFF_Ctrl_5,
  DFF_Ctrl_6,
  DFF_Ctrl_7,
  SET_0_OUT,
  SET_1_OUT,
  SET_2_OUT,
  SET_3_OUT,
  SET_4_OUT,
  SET_5_OUT,
  SET_6_OUT,
  SET_7_OUT
  );

  input         clk;
  input         rst;
  input [31:0]  SET_0_IN;
  input [31:0]  SET_1_IN;
  input [31:0]  SET_2_IN;
  input [31:0]  SET_3_IN;
  input [31:0]  SET_4_IN;
  input [31:0]  SET_5_IN;
  input [31:0]  SET_6_IN;
  input [31:0]  SET_7_IN;
  input [2:0]   Shuf_Ctrl_0;
  input [2:0]   Shuf_Ctrl_1;
  input [2:0]   Shuf_Ctrl_2;
  input [2:0]   Shuf_Ctrl_3;
  input [2:0]   Shuf_Ctrl_4;
  input [2:0]   Shuf_Ctrl_5;
  input [2:0]   Shuf_Ctrl_6;
  input [2:0]   Shuf_Ctrl_7;
  input [2:0]   Type_Sel_0;
  input [2:0]   Type_Sel_1;
  input [2:0]   Type_Sel_2;
  input [2:0]   Type_Sel_3;
  input [2:0]   Type_Sel_4;
  input [2:0]   Type_Sel_5;
  input [2:0]   Type_Sel_6;
  input [2:0]   Type_Sel_7;
  input [2:0]   Bypass_Sel_0;
  input [2:0]   Bypass_Sel_1;
  input [2:0]   Bypass_Sel_2;
  input [2:0]   Bypass_Sel_3;
  input [2:0]   Bypass_Sel_4;
  input [2:0]   Bypass_Sel_5;
  input [2:0]   Bypass_Sel_6;
  input [2:0]   Bypass_Sel_7;
  input [2:0]   DeShuf_Ctrl_0;
  input [2:0]   DeShuf_Ctrl_1;
  input [2:0]   DeShuf_Ctrl_2;
  input [2:0]   DeShuf_Ctrl_3;
  input [2:0]   DeShuf_Ctrl_4;
  input [2:0]   DeShuf_Ctrl_5;
  input [2:0]   DeShuf_Ctrl_6;
  input [2:0]   DeShuf_Ctrl_7;
  input         Bypass_EN_0;
  input         Bypass_EN_1;
  input         Bypass_EN_2;
  input         Bypass_EN_3;
  input         Bypass_EN_4;
  input         Bypass_EN_5;
  input         Bypass_EN_6;
  input         Bypass_EN_7;
  input         Hold_Ctrl_0;
  input         Hold_Ctrl_1;
  input         Hold_Ctrl_2;
  input         Hold_Ctrl_3;
  input         Hold_Ctrl_4;
  input         Hold_Ctrl_5;
  input         Hold_Ctrl_6;
  input         Hold_Ctrl_7;
  input         DFF_Ctrl_0;
  input         DFF_Ctrl_1;
  input         DFF_Ctrl_2;
  input         DFF_Ctrl_3;
  input         DFF_Ctrl_4;
  input         DFF_Ctrl_5;
  input         DFF_Ctrl_6;
  input         DFF_Ctrl_7;
  output [31:0] SET_0_OUT;
  output [31:0] SET_1_OUT;
  output [31:0] SET_2_OUT;
  output [31:0] SET_3_OUT;
  output [31:0] SET_4_OUT;
  output [31:0] SET_5_OUT;
  output [31:0] SET_6_OUT;
  output [31:0] SET_7_OUT;
  
  wire          clk;
  wire          rst;
  wire   [31:0] SET_0_IN;
  wire   [31:0] SET_1_IN;
  wire   [31:0] SET_2_IN;
  wire   [31:0] SET_3_IN;
  wire   [31:0] SET_4_IN;
  wire   [31:0] SET_5_IN;
  wire   [31:0] SET_6_IN;
  wire   [31:0] SET_7_IN;
  wire   [2:0]  Shuf_Ctrl_0;
  wire   [2:0]  Shuf_Ctrl_1;
  wire   [2:0]  Shuf_Ctrl_2;
  wire   [2:0]  Shuf_Ctrl_3;
  wire   [2:0]  Shuf_Ctrl_4;
  wire   [2:0]  Shuf_Ctrl_5;
  wire   [2:0]  Shuf_Ctrl_6;
  wire   [2:0]  Shuf_Ctrl_7;
  wire   [2:0]  Type_Sel_0;
  wire   [2:0]  Type_Sel_1;
  wire   [2:0]  Type_Sel_2;
  wire   [2:0]  Type_Sel_3;
  wire   [2:0]  Type_Sel_4;
  wire   [2:0]  Type_Sel_5;
  wire   [2:0]  Type_Sel_6;
  wire   [2:0]  Type_Sel_7;
  wire   [2:0]  Bypass_Sel_0;
  wire   [2:0]  Bypass_Sel_1;
  wire   [2:0]  Bypass_Sel_2;
  wire   [2:0]  Bypass_Sel_3;
  wire   [2:0]  Bypass_Sel_4;
  wire   [2:0]  Bypass_Sel_5;
  wire   [2:0]  Bypass_Sel_6;
  wire   [2:0]  Bypass_Sel_7;
  wire   [2:0]  DeShuf_Ctrl_0;
  wire   [2:0]  DeShuf_Ctrl_1;
  wire   [2:0]  DeShuf_Ctrl_2;
  wire   [2:0]  DeShuf_Ctrl_3;
  wire   [2:0]  DeShuf_Ctrl_4;
  wire   [2:0]  DeShuf_Ctrl_5;
  wire   [2:0]  DeShuf_Ctrl_6;
  wire   [2:0]  DeShuf_Ctrl_7;
  wire          Bypass_EN_0;
  wire          Bypass_EN_1;
  wire          Bypass_EN_2;
  wire          Bypass_EN_3;
  wire          Bypass_EN_4;
  wire          Bypass_EN_5;
  wire          Bypass_EN_6;
  wire          Bypass_EN_7;
  wire          Hold_Ctrl_0;
  wire          Hold_Ctrl_1;
  wire          Hold_Ctrl_2;
  wire          Hold_Ctrl_3;
  wire          Hold_Ctrl_4;
  wire          Hold_Ctrl_5;
  wire          Hold_Ctrl_6;
  wire          Hold_Ctrl_7;
  wire          DFF_Ctrl_0;
  wire          DFF_Ctrl_1;
  wire          DFF_Ctrl_2;
  wire          DFF_Ctrl_3;
  wire          DFF_Ctrl_4;
  wire          DFF_Ctrl_5;
  wire          DFF_Ctrl_6;
  wire          DFF_Ctrl_7;
  wire   [31:0] SET_0_OUT;
  wire   [31:0] SET_1_OUT;
  wire   [31:0] SET_2_OUT;
  wire   [31:0] SET_3_OUT;
  wire   [31:0] SET_4_OUT;
  wire   [31:0] SET_5_OUT;
  wire   [31:0] SET_6_OUT;
  wire   [31:0] SET_7_OUT;
  
  wire   [31:0] MUX_SHUFFLE_0_OUT;
  wire   [31:0] MUX_SHUFFLE_1_OUT;
  wire   [31:0] MUX_SHUFFLE_2_OUT;
  wire   [31:0] MUX_SHUFFLE_3_OUT;
  wire   [31:0] MUX_SHUFFLE_4_OUT;
  wire   [31:0] MUX_SHUFFLE_5_OUT;
  wire   [31:0] MUX_SHUFFLE_6_OUT;
  wire   [31:0] MUX_SHUFFLE_7_OUT;
  wire   [31:0] BLOCK_MULT_0_OUT;
  wire   [31:0] BLOCK_MULT_1_OUT;
  wire   [31:0] BLOCK_MULT_2_OUT;
  wire   [31:0] BLOCK_MULT_3_OUT;
  wire   [31:0] BLOCK_MULT_4_OUT;
  wire   [31:0] BLOCK_MULT_5_OUT;
  wire   [31:0] BLOCK_MULT_6_OUT;
  wire   [31:0] BLOCK_MULT_7_OUT;
  wire   [31:0] BLOCK_BYPASS_0_OUT;
  wire   [31:0] BLOCK_BYPASS_1_OUT;
  wire   [31:0] BLOCK_BYPASS_2_OUT;
  wire   [31:0] BLOCK_BYPASS_3_OUT;
  wire   [31:0] BLOCK_BYPASS_4_OUT;
  wire   [31:0] BLOCK_BYPASS_5_OUT;
  wire   [31:0] BLOCK_BYPASS_6_OUT;
  wire   [31:0] BLOCK_BYPASS_7_OUT;
  wire   [31:0] MUX_DESHUFFLE_0_OUT;
  wire   [31:0] MUX_DESHUFFLE_1_OUT;
  wire   [31:0] MUX_DESHUFFLE_2_OUT;
  wire   [31:0] MUX_DESHUFFLE_3_OUT;
  wire   [31:0] MUX_DESHUFFLE_4_OUT;
  wire   [31:0] MUX_DESHUFFLE_5_OUT;
  wire   [31:0] MUX_DESHUFFLE_6_OUT;
  wire   [31:0] MUX_DESHUFFLE_7_OUT;
  wire   [31:0] MUX_BYPASS_0_OUT;
  wire   [31:0] MUX_BYPASS_1_OUT;
  wire   [31:0] MUX_BYPASS_2_OUT;
  wire   [31:0] MUX_BYPASS_3_OUT;
  wire   [31:0] MUX_BYPASS_4_OUT;
  wire   [31:0] MUX_BYPASS_5_OUT;
  wire   [31:0] MUX_BYPASS_6_OUT;
  wire   [31:0] MUX_BYPASS_7_OUT;
  wire   [31:0] DFF_0_OUT;
  wire   [31:0] DFF_1_OUT;
  wire   [31:0] DFF_2_OUT;
  wire   [31:0] DFF_3_OUT;
  wire   [31:0] DFF_4_OUT;
  wire   [31:0] DFF_5_OUT;
  wire   [31:0] DFF_6_OUT;
  wire   [31:0] DFF_7_OUT;
  wire   [31:0] MUX_HOLD_0_OUT;
  wire   [31:0] MUX_HOLD_1_OUT;
  wire   [31:0] MUX_HOLD_2_OUT;
  wire   [31:0] MUX_HOLD_3_OUT;
  wire   [31:0] MUX_HOLD_4_OUT;
  wire   [31:0] MUX_HOLD_5_OUT;
  wire   [31:0] MUX_HOLD_6_OUT;
  wire   [31:0] MUX_HOLD_7_OUT;
  
  assign SET_0_OUT = MUX_HOLD_0_OUT;
  assign SET_1_OUT = MUX_HOLD_1_OUT;
  assign SET_2_OUT = MUX_HOLD_2_OUT;
  assign SET_3_OUT = MUX_HOLD_3_OUT;
  assign SET_4_OUT = MUX_HOLD_4_OUT;
  assign SET_5_OUT = MUX_HOLD_5_OUT;
  assign SET_6_OUT = MUX_HOLD_6_OUT;
  assign SET_7_OUT = MUX_HOLD_7_OUT;
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instshuffle0 (
    .D0(SET_0_IN),
    .D1(SET_1_IN),
    .D2(SET_2_IN),
    .D3(SET_3_IN),
    .D4(SET_4_IN),
    .D5(SET_5_IN),
    .D6(SET_6_IN),
    .D7(SET_7_IN),
    .S(Shuf_Ctrl_0),
    .Y(MUX_SHUFFLE_0_OUT)
  ); 
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instshuffle1 (
    .D0(SET_0_IN),
    .D1(SET_1_IN),
    .D2(SET_2_IN),
    .D3(SET_3_IN),
    .D4(SET_4_IN),
    .D5(SET_5_IN),
    .D6(SET_6_IN),
    .D7(SET_7_IN),
    .S(Shuf_Ctrl_1),
    .Y(MUX_SHUFFLE_1_OUT)
  );
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instshuffle2 (
    .D0(SET_0_IN),
    .D1(SET_1_IN),
    .D2(SET_2_IN),
    .D3(SET_3_IN),
    .D4(SET_4_IN),
    .D5(SET_5_IN),
    .D6(SET_6_IN),
    .D7(SET_7_IN),
    .S(Shuf_Ctrl_2),
    .Y(MUX_SHUFFLE_2_OUT)
  );
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instshuffle3 (
    .D0(SET_0_IN),
    .D1(SET_1_IN),
    .D2(SET_2_IN),
    .D3(SET_3_IN),
    .D4(SET_4_IN),
    .D5(SET_5_IN),
    .D6(SET_6_IN),
    .D7(SET_7_IN),
    .S(Shuf_Ctrl_3),
    .Y(MUX_SHUFFLE_3_OUT)
  );

  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instshuffle4 (
    .D0(SET_0_IN),
    .D1(SET_1_IN),
    .D2(SET_2_IN),
    .D3(SET_3_IN),
    .D4(SET_4_IN),
    .D5(SET_5_IN),
    .D6(SET_6_IN),
    .D7(SET_7_IN),
    .S(Shuf_Ctrl_4),
    .Y(MUX_SHUFFLE_4_OUT)
  );

  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instshuffle5 (
    .D0(SET_0_IN),
    .D1(SET_1_IN),
    .D2(SET_2_IN),
    .D3(SET_3_IN),
    .D4(SET_4_IN),
    .D5(SET_5_IN),
    .D6(SET_6_IN),
    .D7(SET_7_IN),
    .S(Shuf_Ctrl_5),
    .Y(MUX_SHUFFLE_5_OUT)
  );

  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instshuffle6 (
    .D0(SET_0_IN),
    .D1(SET_1_IN),
    .D2(SET_2_IN),
    .D3(SET_3_IN),
    .D4(SET_4_IN),
    .D5(SET_5_IN),
    .D6(SET_6_IN),
    .D7(SET_7_IN),
    .S(Shuf_Ctrl_6),
    .Y(MUX_SHUFFLE_6_OUT)
  );

  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instshuffle7 (
    .D0(SET_0_IN),
    .D1(SET_1_IN),
    .D2(SET_2_IN),
    .D3(SET_3_IN),
    .D4(SET_4_IN),
    .D5(SET_5_IN),
    .D6(SET_6_IN),
    .D7(SET_7_IN),
    .S(Shuf_Ctrl_7),
    .Y(MUX_SHUFFLE_7_OUT)
  );
    
  generic_complex_mult_block # (
    .C_PLUS_S(16'b0001000101111110), 
    .C_ONLY(16'b0000111111101100), 
    .C_MIN_S(16'b0000111001011011)
  ) generic_complex_mult_block_inst0 (
    .A32(MUX_SHUFFLE_0_OUT),
    .TYPESEL(Type_Sel_0), 
    .R32(BLOCK_MULT_0_OUT)
  );
  						  
  generic_complex_mult_block # (
    .C_PLUS_S(16'b0001001011010000), 
    .C_ONLY(16'b0000111110110001), 
    .C_MIN_S(16'b0000110010010010)
  ) generic_complex_mult_block_inst1 (
    .A32(MUX_SHUFFLE_1_OUT),
    .TYPESEL(Type_Sel_1), 
    .R32(BLOCK_MULT_1_OUT)
  );
    
  generic_complex_mult_block # (
    .C_PLUS_S(16'b0001001111110101), 
    .C_ONLY(16'b0000111101010000), 
    .C_MIN_S(16'b0000101010101011)
  ) generic_complex_mult_block_inst2 (
    .A32(MUX_SHUFFLE_2_OUT),
    .TYPESEL(Type_Sel_2), 
    .R32(BLOCK_MULT_2_OUT)
  );
    		  
  generic_complex_mult_block # (
    .C_PLUS_S(16'b0001010011101000), 
    .C_ONLY(16'b0000111011001000), 
    .C_MIN_S(16'b0000100010101001)
  ) generic_complex_mult_block_inst3 (
    .A32(MUX_SHUFFLE_3_OUT),
    .TYPESEL(Type_Sel_3), 
    .R32(BLOCK_MULT_3_OUT)
  );
  
  generic_complex_mult_block # (
    .C_PLUS_S(16'b0001010110100111), 
    .C_ONLY(16'b0000111000011100), 
    .C_MIN_S(16'b0000011010010010)
  ) generic_complex_mult_block_inst4 (
    .A32(MUX_SHUFFLE_4_OUT),
    .TYPESEL(Type_Sel_4), 
    .R32(BLOCK_MULT_4_OUT)
  );
    				 
  generic_complex_mult_block # (
    .C_PLUS_S(16'b0001011000110001), 
    .C_ONLY(16'b0000110101001110), 
    .C_MIN_S(16'b0000010001101010)
  ) generic_complex_mult_block_inst5 (
    .A32(MUX_SHUFFLE_5_OUT),
    .TYPESEL(Type_Sel_5), 
    .R32(BLOCK_MULT_5_OUT)
  );
  
  generic_complex_mult_block # (
    .C_PLUS_S(16'b0001011010000101), 
    .C_ONLY(16'b0000110001011110), 
    .C_MIN_S(16'b0000001000111000)
  ) generic_complex_mult_block_inst6 (
    .A32(MUX_SHUFFLE_6_OUT),
    .TYPESEL(Type_Sel_6), 
    .R32(BLOCK_MULT_6_OUT)
  );
     
  generic_complex_mult_block # (
    .C_PLUS_S(16'b0001011010100001), 
    .C_ONLY(16'b0000101101010000), 
    .C_MIN_S(16'b0000000000000000)
  ) generic_complex_mult_block_inst7 (
    .A32(MUX_SHUFFLE_7_OUT),
    .TYPESEL(Type_Sel_7), 
    .R32(BLOCK_MULT_7_OUT)
  );
    
  bypass_32b bypass_32b_inst0 (
    .A32(SET_0_IN), 
    .TYPESEL(Bypass_Sel_0), 
    .R32(BLOCK_BYPASS_0_OUT)
  );
  
  bypass_32b bypass_32b_inst1 (
    .A32(SET_1_IN), 
    .TYPESEL(Bypass_Sel_1), 
    .R32(BLOCK_BYPASS_1_OUT)
  );
  
  bypass_32b bypass_32b_inst2 (
    .A32(SET_2_IN), 
    .TYPESEL(Bypass_Sel_2), 
    .R32(BLOCK_BYPASS_2_OUT)
  );
  
  bypass_32b bypass_32b_inst3 (
    .A32(SET_3_IN), 
    .TYPESEL(Bypass_Sel_3), 
    .R32(BLOCK_BYPASS_3_OUT)
  );
  
  bypass_32b bypass_32b_inst4 (
    .A32(SET_4_IN), 
    .TYPESEL(Bypass_Sel_4), 
    .R32(BLOCK_BYPASS_4_OUT)
  );
  
  bypass_32b bypass_32b_inst5 (
    .A32(SET_5_IN), 
    .TYPESEL(Bypass_Sel_5), 
    .R32(BLOCK_BYPASS_5_OUT)
  );
  
  bypass_32b bypass_32b_inst6 (
    .A32(SET_6_IN), 
    .TYPESEL(Bypass_Sel_6), 
    .R32(BLOCK_BYPASS_6_OUT)
  );
  
  bypass_32b bypass_32b_inst7 (
    .A32(SET_7_IN), 
    .TYPESEL(Bypass_Sel_7), 
    .R32(BLOCK_BYPASS_7_OUT)
  );

  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instdeshuffle0 (
    .D0(BLOCK_MULT_0_OUT),
    .D1(BLOCK_MULT_1_OUT),
    .D2(BLOCK_MULT_2_OUT),
    .D3(BLOCK_MULT_3_OUT),
    .D4(BLOCK_MULT_4_OUT),
    .D5(BLOCK_MULT_5_OUT),
    .D6(BLOCK_MULT_6_OUT),
    .D7(BLOCK_MULT_7_OUT),
    .S(DeShuf_Ctrl_0),
    .Y(MUX_DESHUFFLE_0_OUT)
  );
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instdeshuffle1 (
    .D0(BLOCK_MULT_0_OUT),
    .D1(BLOCK_MULT_1_OUT),
    .D2(BLOCK_MULT_2_OUT),
    .D3(BLOCK_MULT_3_OUT),
    .D4(BLOCK_MULT_4_OUT),
    .D5(BLOCK_MULT_5_OUT),
    .D6(BLOCK_MULT_6_OUT),
    .D7(BLOCK_MULT_7_OUT),
    .S(DeShuf_Ctrl_1),
    .Y(MUX_DESHUFFLE_1_OUT)
  );
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instdeshuffle2 (
    .D0(BLOCK_MULT_0_OUT),
    .D1(BLOCK_MULT_1_OUT),
    .D2(BLOCK_MULT_2_OUT),
    .D3(BLOCK_MULT_3_OUT),
    .D4(BLOCK_MULT_4_OUT),
    .D5(BLOCK_MULT_5_OUT),
    .D6(BLOCK_MULT_6_OUT),
    .D7(BLOCK_MULT_7_OUT),
    .S(DeShuf_Ctrl_2),
    .Y(MUX_DESHUFFLE_2_OUT)
  );

  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instdeshuffle3 (
    .D0(BLOCK_MULT_0_OUT),
    .D1(BLOCK_MULT_1_OUT),
    .D2(BLOCK_MULT_2_OUT),
    .D3(BLOCK_MULT_3_OUT),
    .D4(BLOCK_MULT_4_OUT),
    .D5(BLOCK_MULT_5_OUT),
    .D6(BLOCK_MULT_6_OUT),
    .D7(BLOCK_MULT_7_OUT),
    .S(DeShuf_Ctrl_3),
    .Y(MUX_DESHUFFLE_3_OUT)
  );
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instdeshuffle4 (
    .D0(BLOCK_MULT_0_OUT),
    .D1(BLOCK_MULT_1_OUT),
    .D2(BLOCK_MULT_2_OUT),
    .D3(BLOCK_MULT_3_OUT),
    .D4(BLOCK_MULT_4_OUT),
    .D5(BLOCK_MULT_5_OUT),
    .D6(BLOCK_MULT_6_OUT),
    .D7(BLOCK_MULT_7_OUT),
    .S(DeShuf_Ctrl_4),
    .Y(MUX_DESHUFFLE_4_OUT)
  );
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instdeshuffle5 (
    .D0(BLOCK_MULT_0_OUT),
    .D1(BLOCK_MULT_1_OUT),
    .D2(BLOCK_MULT_2_OUT),
    .D3(BLOCK_MULT_3_OUT),
    .D4(BLOCK_MULT_4_OUT),
    .D5(BLOCK_MULT_5_OUT),
    .D6(BLOCK_MULT_6_OUT),
    .D7(BLOCK_MULT_7_OUT),
    .S(DeShuf_Ctrl_5),
    .Y(MUX_DESHUFFLE_5_OUT)
  );
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instdeshuffle6 (
    .D0(BLOCK_MULT_0_OUT),
    .D1(BLOCK_MULT_1_OUT),
    .D2(BLOCK_MULT_2_OUT),
    .D3(BLOCK_MULT_3_OUT),
    .D4(BLOCK_MULT_4_OUT),
    .D5(BLOCK_MULT_5_OUT),
    .D6(BLOCK_MULT_6_OUT),
    .D7(BLOCK_MULT_7_OUT),
    .S(DeShuf_Ctrl_6),
    .Y(MUX_DESHUFFLE_6_OUT)
  );
  
  mux_8_to_1 # (
    .DATA_WIDTH(32)
  ) mux_8_to_1_instdeshuffle7 (
    .D0(BLOCK_MULT_0_OUT),
    .D1(BLOCK_MULT_1_OUT),
    .D2(BLOCK_MULT_2_OUT),
    .D3(BLOCK_MULT_3_OUT),
    .D4(BLOCK_MULT_4_OUT),
    .D5(BLOCK_MULT_5_OUT),
    .D6(BLOCK_MULT_6_OUT),
    .D7(BLOCK_MULT_7_OUT),
    .S(DeShuf_Ctrl_7),
    .Y(MUX_DESHUFFLE_7_OUT)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_instbypass0 (
    .D0(MUX_DESHUFFLE_0_OUT),
    .D1(BLOCK_BYPASS_0_OUT),
    .S(Bypass_EN_0),
    .Y(MUX_BYPASS_0_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_instbypass1 (
    .D0(MUX_DESHUFFLE_1_OUT),
    .D1(BLOCK_BYPASS_1_OUT),
    .S(Bypass_EN_1),
    .Y(MUX_BYPASS_1_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_instbypass2 (
    .D0(MUX_DESHUFFLE_2_OUT),
    .D1(BLOCK_BYPASS_2_OUT),
    .S(Bypass_EN_2),
    .Y(MUX_BYPASS_2_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_instbypass3 (
    .D0(MUX_DESHUFFLE_3_OUT),
    .D1(BLOCK_BYPASS_3_OUT),
    .S(Bypass_EN_3),
    .Y(MUX_BYPASS_3_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_instbypass4 (
    .D0(MUX_DESHUFFLE_4_OUT),
    .D1(BLOCK_BYPASS_4_OUT),
    .S(Bypass_EN_4),
    .Y(MUX_BYPASS_4_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_instbypass5 (
    .D0(MUX_DESHUFFLE_5_OUT),
    .D1(BLOCK_BYPASS_5_OUT),
    .S(Bypass_EN_5),
    .Y(MUX_BYPASS_5_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_instbypass6 (
    .D0(MUX_DESHUFFLE_6_OUT),
    .D1(BLOCK_BYPASS_6_OUT),
    .S(Bypass_EN_6),
    .Y(MUX_BYPASS_6_OUT)
  ); 

  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_instbypass7 (
    .D0(MUX_DESHUFFLE_7_OUT),
    .D1(BLOCK_BYPASS_7_OUT),
    .S(Bypass_EN_7),
    .Y(MUX_BYPASS_7_OUT)
  ); 
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst0 (
    .clk(clk),
    .rst(rst),
	.hold(Hold_Ctrl_0),
    .D(MUX_BYPASS_0_OUT),
    .Q(DFF_0_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst1 (
    .clk(clk),
    .rst(rst),
	.hold(Hold_Ctrl_1),
    .D(MUX_BYPASS_1_OUT),
    .Q(DFF_1_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst2 (
    .clk(clk),
    .rst(rst),
	.hold(Hold_Ctrl_2),
    .D(MUX_BYPASS_2_OUT),
    .Q(DFF_2_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst3 (
    .clk(clk),
    .rst(rst),
	.hold(Hold_Ctrl_3),
    .D(MUX_BYPASS_3_OUT),
    .Q(DFF_3_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst4 (
    .clk(clk),
    .rst(rst),
	.hold(Hold_Ctrl_4),
    .D(MUX_BYPASS_4_OUT),
    .Q(DFF_4_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst5 (
    .clk(clk),
    .rst(rst),
	.hold(Hold_Ctrl_5),
    .D(MUX_BYPASS_5_OUT),
    .Q(DFF_5_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst6 (
    .clk(clk),
    .rst(rst),
	.hold(Hold_Ctrl_6),
    .D(MUX_BYPASS_6_OUT),
    .Q(DFF_6_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst7 (
    .clk(clk),
    .rst(rst),
	.hold(Hold_Ctrl_7),
    .D(MUX_BYPASS_7_OUT),
    .Q(DFF_7_OUT)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_insthold0 (
    .D0(MUX_BYPASS_0_OUT),
    .D1(DFF_0_OUT),
    .S(DFF_Ctrl_0),
    .Y(MUX_HOLD_0_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_insthold1 (
    .D0(MUX_BYPASS_1_OUT),
    .D1(DFF_1_OUT),
    .S(DFF_Ctrl_1),
    .Y(MUX_HOLD_1_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_insthold2 (
    .D0(MUX_BYPASS_2_OUT),
    .D1(DFF_2_OUT),
    .S(DFF_Ctrl_2),
    .Y(MUX_HOLD_2_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_insthold3 (
    .D0(MUX_BYPASS_3_OUT),
    .D1(DFF_3_OUT),
    .S(DFF_Ctrl_3),
    .Y(MUX_HOLD_3_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_insthold4 (
    .D0(MUX_BYPASS_4_OUT),
    .D1(DFF_4_OUT),
    .S(DFF_Ctrl_4),
    .Y(MUX_HOLD_4_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_insthold5 (
    .D0(MUX_BYPASS_5_OUT),
    .D1(DFF_5_OUT),
    .S(DFF_Ctrl_5),
    .Y(MUX_HOLD_5_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_insthold6 (
    .D0(MUX_BYPASS_6_OUT),
    .D1(DFF_6_OUT),
    .S(DFF_Ctrl_6),
    .Y(MUX_HOLD_6_OUT)
  ); 
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_insthold7 (
    .D0(MUX_BYPASS_7_OUT),
    .D1(DFF_7_OUT),
    .S(DFF_Ctrl_7),
    .Y(MUX_HOLD_7_OUT)
  ); 
  			
endmodule									
