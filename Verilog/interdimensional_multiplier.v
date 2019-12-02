module interdimensional multiplier(
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
Shuf_Ctrl_1,
Shuf_Ctrl_2,
Shuf_Ctrl_3,
Shuf_Ctrl_4,
Shuf_Ctrl_5,
Shuf_Ctrl_6,
Shuf_Ctrl_7,
Shuf_Ctrl_8,
Type_Sel_1,
Type_Sel_2,
Type_Sel_3,
Type_Sel_4,
Type_Sel_5,
Type_Sel_6,
Type_Sel_7,
Type_Sel_8,
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
Hold_Ctrl_1
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
SET_7_OUT);

input clk;
input rst;
input [31:0] SET_0_IN;
input [31:0] SET_1_IN;
input [31:0] SET_2_IN;
input [31:0] SET_3_IN;
input [31:0] SET_4_IN;
input [31:0] SET_5_IN;
input [31:0] SET_6_IN;
input [31:0] SET_7_IN;
input [2:0] Shuf_Ctrl_1;
input [2:0] Shuf_Ctrl_2;
input [2:0] Shuf_Ctrl_3;
input [2:0] Shuf_Ctrl_4;
input [2:0] Shuf_Ctrl_5;
input [2:0] Shuf_Ctrl_6;
input [2:0] Shuf_Ctrl_7;
input [2:0] Shuf_Ctrl_8;
input [2:0] Type_Sel_1;
input [2:0] Type_Sel_2;
input [2:0] Type_Sel_3;
input [2:0] Type_Sel_4;
input [2:0] Type_Sel_5;
input [2:0] Type_Sel_6;
input [2:0] Type_Sel_7;
input [2:0] Type_Sel_8;
input [2:0] Bypass_Sel_0;
input [2:0] Bypass_Sel_1;
input [2:0] Bypass_Sel_2;
input [2:0] Bypass_Sel_3;
input [2:0] Bypass_Sel_4;
input [2:0] Bypass_Sel_5;
input [2:0] Bypass_Sel_6;
input [2:0] Bypass_Sel_7;
input [2:0] DeShuf_Ctrl_0;
input [2:0] DeShuf_Ctrl_1;
input [2:0] DeShuf_Ctrl_2;
input [2:0] DeShuf_Ctrl_3;
input [2:0] DeShuf_Ctrl_4;
input [2:0] DeShuf_Ctrl_5;
input [2:0] DeShuf_Ctrl_6;
input [2:0] DeShuf_Ctrl_7;
input Bypass_EN_0;
input Bypass_EN_1;
input Bypass_EN_2;
input Bypass_EN_3;
input Bypass_EN_4;
input Bypass_EN_5;
input Bypass_EN_6;
input Bypass_EN_7;
input Hold_Ctrl_0;
input Hold_Ctrl_1;
input Hold_Ctrl_2;
input Hold_Ctrl_3;
input Hold_Ctrl_4;
input Hold_Ctrl_5;
input Hold_Ctrl_6;
input Hold_Ctrl_7;
input DFF_Ctrl_0;
input DFF_Ctrl_1;
input DFF_Ctrl_2;
input DFF_Ctrl_3;
input DFF_Ctrl_4;
input DFF_Ctrl_5;
input DFF_Ctrl_6;
input DFF_Ctrl_7;
output [31:0] SET_0_OUT;
output [31:0] SET_1_OUT;
output [31:0] SET_2_OUT;
output [31:0] SET_3_OUT;
output [31:0] SET_4_OUT;
output [31:0] SET_5_OUT;
output [31:0] SET_6_OUT;
output [31:0] SET_7_OUT;

wire [31:0] MUX_SHUFFLE_1_OUT;
wire [31:0] SIGNAL MUX_SHUFFLE_2_OUT;
wire [31:0] SIGNAL MUX_SHUFFLE_3_OUT;
wire [31:0] SIGNAL MUX_SHUFFLE_4_OUT;
wire [31:0] SIGNAL MUX_SHUFFLE_5_OUT;
wire [31:0] SIGNAL MUX_SHUFFLE_6_OUT;
wire [31:0] SIGNAL MUX_SHUFFLE_7_OUT;
wire [31:0] SIGNAL MUX_SHUFFLE_8_OUT;
wire [31:0] SIGNAL BLOCK_MULT_1_OUT;
wire [31:0] SIGNAL BLOCK_MULT_2_OUT;
wire [31:0] SIGNAL BLOCK_MULT_3_OUT;
wire [31:0] SIGNAL BLOCK_MULT_4_OUT;
wire [31:0] SIGNAL BLOCK_MULT_5_OUT;
wire [31:0] SIGNAL BLOCK_MULT_6_OUT;
wire [31:0] SIGNAL BLOCK_MULT_7_OUT;
wire [31:0] SIGNAL BLOCK_MULT_8_OUT;
wire [31:0] SIGNAL BLOCK_BYPASS_0_OUT;
wire [31:0] SIGNAL BLOCK_BYPASS_1_OUT;
wire [31:0] SIGNAL BLOCK_BYPASS_2_OUT;
wire [31:0] SIGNAL BLOCK_BYPASS_3_OUT;
wire [31:0] SIGNAL BLOCK_BYPASS_4_OUT;
wire [31:0] SIGNAL BLOCK_BYPASS_5_OUT;
wire [31:0] SIGNAL BLOCK_BYPASS_6_OUT;
wire [31:0] SIGNAL BLOCK_BYPASS_7_OUT;
wire [31:0] SIGNAL MUX_DESHUFFLE_0_OUT;
wire [31:0] SIGNAL MUX_DESHUFFLE_1_OUT;
wire [31:0] SIGNAL MUX_DESHUFFLE_2_OUT;
wire [31:0] SIGNAL MUX_DESHUFFLE_3_OUT;
wire [31:0] SIGNAL MUX_DESHUFFLE_4_OUT;
wire [31:0] SIGNAL MUX_DESHUFFLE_5_OUT;
wire [31:0] SIGNAL MUX_DESHUFFLE_6_OUT;
wire [31:0] SIGNAL MUX_DESHUFFLE_7_OUT;
wire [31:0] SIGNAL MUX_BYPASS_0_OUT;
wire [31:0] SIGNAL MUX_BYPASS_1_OUT;
wire [31:0] SIGNAL MUX_BYPASS_2_OUT;
wire [31:0] SIGNAL MUX_BYPASS_3_OUT;
wire [31:0] SIGNAL MUX_BYPASS_4_OUT;
wire [31:0] SIGNAL MUX_BYPASS_5_OUT;
wire [31:0] SIGNAL MUX_BYPASS_6_OUT;
wire [31:0] SIGNAL MUX_BYPASS_7_OUT;
wire [31:0] SIGNAL DFF_0_OUT;
wire [31:0] SIGNAL DFF_1_OUT;
wire [31:0] SIGNAL DFF_2_OUT;
wire [31:0] SIGNAL DFF_3_OUT;
wire [31:0] SIGNAL DFF_4_OUT;
wire [31:0] SIGNAL DFF_5_OUT;
wire [31:0] SIGNAL DFF_6_OUT;
wire [31:0] SIGNAL DFF_7_OUT;
wire [31:0] SIGNAL MUX_HOLD_0_OUT;
wire [31:0] SIGNAL MUX_HOLD_1_OUT;
wire [31:0] SIGNAL MUX_HOLD_2_OUT;
wire [31:0] SIGNAL MUX_HOLD_3_OUT;
wire [31:0] SIGNAL MUX_HOLD_4_OUT;
wire [31:0] SIGNAL MUX_HOLD_5_OUT;
wire [31:0] SIGNAL MUX_HOLD_6_OUT;
wire [31:0] SIGNAL MUX_HOLD_7_OUT;

assign SET_0_OUT = MUX_HOLD_0_OUT;
assign SET_1_OUT = MUX_HOLD_1_OUT;
assign SET_2_OUT = MUX_HOLD_2_OUT;
assign SET_3_OUT = MUX_HOLD_3_OUT;
assign SET_4_OUT = MUX_HOLD_4_OUT;
assign SET_5_OUT = MUX_HOLD_5_OUT;
assign SET_6_OUT = MUX_HOLD_6_OUT;
assign SET_7_OUT = MUX_HOLD_7_OUT;

mux_8to1_32b MUX_SHUFFLE_1(.D1(SET_0_IN), .D2(SET_1_IN), .D3(SET_2_IN), .D4(SET_3_IN), .D5(SET_4_IN), .D6(SET_5_IN), .D7(SET_6_IN), .D8(SET_7_IN), .Y(MUX_SHUFFLE_1_OUT), .S(Shuf_Ctrl_1));

mux_8to1_32b MUX_SHUFFLE_2(.D1(SET_0_IN), .D2(SET_1_IN), .D3(SET_2_IN), .D4(SET_3_IN), .D5(SET_4_IN), .D6(SET_5_IN), .D7(SET_6_IN), .D8(SET_7_IN), .Y(MUX_SHUFFLE_2_OUT), .S(Shuf_Ctrl_2));

mux_8to1_32b MUX_SHUFFLE_3(.D1(SET_0_IN), .D2(SET_1_IN), .D3(SET_2_IN), .D4(SET_3_IN), .D5(SET_4_IN), .D6(SET_5_IN), .D7(SET_6_IN), .D8(SET_7_IN), .Y(MUX_SHUFFLE_3_OUT), .S(Shuf_Ctrl_3));

mux_8to1_32b MUX_SHUFFLE_4(.D1(SET_0_IN), .D2(SET_1_IN), .D3(SET_2_IN), .D4(SET_3_IN), .D5(SET_4_IN), .D6(SET_5_IN), .D7(SET_6_IN), .D8(SET_7_IN), .Y(MUX_SHUFFLE_4_OUT), .S(Shuf_Ctrl_4));

mux_8to1_32b MUX_SHUFFLE_5(.D1(SET_0_IN), .D2(SET_1_IN), .D3(SET_2_IN), .D4(SET_3_IN), .D5(SET_4_IN), .D6(SET_5_IN), .D7(SET_6_IN), .D8(SET_7_IN), .Y(MUX_SHUFFLE_5_OUT), .S(Shuf_Ctrl_5));

mux_8to1_32b MUX_SHUFFLE_6(.D1(SET_0_IN), .D2(SET_1_IN), .D3(SET_2_IN), .D4(SET_3_IN), .D5(SET_4_IN), .D6(SET_5_IN), .D7(SET_6_IN), .D8(SET_7_IN), .Y(MUX_SHUFFLE_6_OUT), .S(Shuf_Ctrl_6));

mux_8to1_32b MUX_SHUFFLE_7(.D1(SET_0_IN), .D2(SET_1_IN), .D3(SET_2_IN), .D4(SET_3_IN), .D5(SET_4_IN), .D6(SET_5_IN), .D7(SET_6_IN), .D8(SET_7_IN), .Y(MUX_SHUFFLE_7_OUT), .S(Shuf_Ctrl_7));

mux_8to1_32b MUX_SHUFFLE_8(.D1(SET_0_IN), .D2(SET_1_IN), .D3(SET_2_IN), .D4(SET_3_IN), .D5(SET_4_IN), .D6(SET_5_IN), .D7(SET_6_IN), .D8(SET_7_IN), .Y(MUX_SHUFFLE_8_OUT), .S(Shuf_Ctrl_8));

parameter [15:0]  C_PLUS_S    = 16'b0001000101111110;
parameter [15:0]  C_ONLY     = 16'b0000111111101100;
parameter [15:0]  C_MIN_S    = 16'b0000111001011011;

generic_complex_mult_block #(C_PLUS_S, C_ONLY, C_MIN_S) BLOCK_MULT_1 (.A32(MUX_SHUFFLE_1_OUT), .TYPESEL(Type_Sel_1), .R32(BLOCK_MULT_1_OUT));
						
C_PLUS_S    = 16'b0001001011010000;
C_ONLY     = 16'b0000111110110001;
C_MIN_S    = 16'b0000110010010010;

generic_complex_mult_block #(C_PLUS_S, C_ONLY, C_MIN_S) BLOCK_MULT_2 (.A32(MUX_SHUFFLE_2_OUT), .TYPESEL(Type_Sel_2), .R32(BLOCK_MULT_2_OUT));

C_PLUS_S    = 16'b0001001011010000;
C_ONLY     = 16'b0000111110110001;
C_MIN_S    = 16'b0000110010010010;

generic_complex_mult_block #(C_PLUS_S, C_ONLY, C_MIN_S) BLOCK_MULT_3 (.A32(MUX_SHUFFLE_3_OUT), .TYPESEL(Type_Sel_3), .R32(BLOCK_MULT_3_OUT));
		
C_PLUS_S    = 16'b0001001111110101;
C_ONLY     = 16'b0000111101010000;
C_MIN_S    = 16'b0000101010101011;

generic_complex_mult_block #(C_PLUS_S, C_ONLY, C_MIN_S) BLOCK_MULT_4 (.A32(MUX_SHUFFLE_4_OUT), .TYPESEL(Type_Sel_4), .R32(BLOCK_MULT_4_OUT));
			
C_PLUS_S    = 16'b0001010011101000;
C_ONLY     = 16'b0000111011001000;
C_MIN_S    = 16'b0000100010101001;

generic_complex_mult_block #(C_PLUS_S, C_ONLY, C_MIN_S) BLOCK_MULT_5 (.A32(MUX_SHUFFLE_5_OUT), .TYPESEL(Type_Sel_5), .R32(BLOCK_MULT_5_OUT));
				
C_PLUS_S    = 16'b0001010110100111;
C_ONLY     = 16'b0000111000011100;
C_MIN_S    = 16'b0000011010010010;

generic_complex_mult_block #(C_PLUS_S, C_ONLY, C_MIN_S) BLOCK_MULT_6 (.A32(MUX_SHUFFLE_6_OUT), .TYPESEL(Type_Sel_6), .R32(BLOCK_MULT_6_OUT));

C_PLUS_S    = 16'b0001011000110001;
C_ONLY     = 16'b0000110101001110;
C_MIN_S    = 16'b0000010001101010;

generic_complex_mult_block #(C_PLUS_S, C_ONLY, C_MIN_S) BLOCK_MULT_7 (.A32(MUX_SHUFFLE_7_OUT), .TYPESEL(Type_Sel_7), .R32(BLOCK_MULT_7_OUT));
			
C_PLUS_S    = 16'b0001011010100001;
C_ONLY     = 16'b0000101101010000;
C_MIN_S    = 16'b0000000000000000;

generic_complex_mult_block #(C_PLUS_S, C_ONLY, C_MIN_S) BLOCK_MULT_8 (.A32(MUX_SHUFFLE_8_OUT), .TYPESEL(Type_Sel_8), .R32(BLOCK_MULT_8_OUT));

bypass_32b BLOCK_BYPASS_0 (.A32(SET_0_IN), .TYPESEL(Bypass_Sel_0), .R32(BLOCK_BYPASS_0));

bypass_32b BLOCK_BYPASS_1 (.A32(SET_0_IN), .TYPESEL(Bypass_Sel_1), .R32(BLOCK_BYPASS_1));

bypass_32b BLOCK_BYPASS_2 (.A32(SET_0_IN), .TYPESEL(Bypass_Sel_2), .R32(BLOCK_BYPASS_2));

bypass_32b BLOCK_BYPASS_3 (.A32(SET_0_IN), .TYPESEL(Bypass_Sel_3), .R32(BLOCK_BYPASS_3));

bypass_32b BLOCK_BYPASS_4 (.A32(SET_0_IN), .TYPESEL(Bypass_Sel_4), .R32(BLOCK_BYPASS_4));

bypass_32b BLOCK_BYPASS_5 (.A32(SET_0_IN), .TYPESEL(Bypass_Sel_5), .R32(BLOCK_BYPASS_5));

bypass_32b BLOCK_BYPASS_6 (.A32(SET_0_IN), .TYPESEL(Bypass_Sel_6), .R32(BLOCK_BYPASS_6));

bypass_32b BLOCK_BYPASS_7 (.A32(SET_0_IN), .TYPESEL(Bypass_Sel_7), .R32(BLOCK_BYPASS_7));

mux_8to1_32b MUX_DESHUFFLE_0 (.D1(BLOCK_MULT_1_OUT), .D2(BLOCK_MULT_2_OUT), .D3(BLOCK_MULT_3_OUT), .D4(BLOCK_MULT_4_OUT), .D5(BLOCK_MULT_5_OUT), .D6(BLOCK_MULT_6_OUT), .D7(BLOCK_MULT_7_OUT), .D8(BLOCK_MULT_8_OUT), .Y(MUX_DESHUFFLE_0_OUT), .S(DeShuf_Ctrl_0));

mux_8to1_32b MUX_DESHUFFLE_1 (.D1(BLOCK_MULT_1_OUT), .D2(BLOCK_MULT_2_OUT), .D3(BLOCK_MULT_3_OUT), .D4(BLOCK_MULT_4_OUT), .D5(BLOCK_MULT_5_OUT), .D6(BLOCK_MULT_6_OUT), .D7(BLOCK_MULT_7_OUT), .D8(BLOCK_MULT_8_OUT), .Y(MUX_DESHUFFLE_1_OUT), .S(DeShuf_Ctrl_1));

mux_8to1_32b MUX_DESHUFFLE_2 (.D1(BLOCK_MULT_1_OUT), .D2(BLOCK_MULT_2_OUT), .D3(BLOCK_MULT_3_OUT), .D4(BLOCK_MULT_4_OUT), .D5(BLOCK_MULT_5_OUT), .D6(BLOCK_MULT_6_OUT), .D7(BLOCK_MULT_7_OUT), .D8(BLOCK_MULT_8_OUT), .Y(MUX_DESHUFFLE_2_OUT), .S(DeShuf_Ctrl_2));

mux_8to1_32b MUX_DESHUFFLE_3 (.D1(BLOCK_MULT_1_OUT), .D2(BLOCK_MULT_2_OUT), .D3(BLOCK_MULT_3_OUT), .D4(BLOCK_MULT_4_OUT), .D5(BLOCK_MULT_5_OUT), .D6(BLOCK_MULT_6_OUT), .D7(BLOCK_MULT_7_OUT), .D8(BLOCK_MULT_8_OUT), .Y(MUX_DESHUFFLE_3_OUT), .S(DeShuf_Ctrl_3));

mux_8to1_32b MUX_DESHUFFLE_4 (.D1(BLOCK_MULT_1_OUT), .D2(BLOCK_MULT_2_OUT), .D3(BLOCK_MULT_3_OUT), .D4(BLOCK_MULT_4_OUT), .D5(BLOCK_MULT_5_OUT), .D6(BLOCK_MULT_6_OUT), .D7(BLOCK_MULT_7_OUT), .D8(BLOCK_MULT_8_OUT), .Y(MUX_DESHUFFLE_4_OUT), .S(DeShuf_Ctrl_4));

mux_8to1_32b MUX_DESHUFFLE_5 (.D1(BLOCK_MULT_1_OUT), .D2(BLOCK_MULT_2_OUT), .D3(BLOCK_MULT_3_OUT), .D4(BLOCK_MULT_4_OUT), .D5(BLOCK_MULT_5_OUT), .D6(BLOCK_MULT_6_OUT), .D7(BLOCK_MULT_7_OUT), .D8(BLOCK_MULT_8_OUT), .Y(MUX_DESHUFFLE_5_OUT), .S(DeShuf_Ctrl_5));

mux_8to1_32b MUX_DESHUFFLE_6 (.D1(BLOCK_MULT_1_OUT), .D2(BLOCK_MULT_2_OUT), .D3(BLOCK_MULT_3_OUT), .D4(BLOCK_MULT_4_OUT), .D5(BLOCK_MULT_5_OUT), .D6(BLOCK_MULT_6_OUT), .D7(BLOCK_MULT_7_OUT), .D8(BLOCK_MULT_8_OUT), .Y(MUX_DESHUFFLE_6_OUT), .S(DeShuf_Ctrl_6));

mux_8to1_32b MUX_DESHUFFLE_7 (.D1(BLOCK_MULT_1_OUT), .D2(BLOCK_MULT_2_OUT), .D3(BLOCK_MULT_3_OUT), .D4(BLOCK_MULT_4_OUT), .D5(BLOCK_MULT_5_OUT), .D6(BLOCK_MULT_6_OUT), .D7(BLOCK_MULT_7_OUT), .D8(BLOCK_MULT_8_OUT), .Y(MUX_DESHUFFLE_7_OUT), .S(DeShuf_Ctrl_7));
										mux_2to1_32b MUX_BYPASS_0 (.D1(MUX_DESHUFFLE_0_OUT), .D2(BLOCK_BYPASS_0_OUT), .Y(MUX_BYPASS_0_OUT), .S(Bypass_EN_0));

mux_2to1_32b MUX_BYPASS_1 (.D1(MUX_DESHUFFLE_1_OUT), .D2(BLOCK_BYPASS_1_OUT), .Y(MUX_BYPASS_1_OUT), .S(Bypass_EN_1));

mux_2to1_32b MUX_BYPASS_2 (.D1(MUX_DESHUFFLE_2_OUT), .D2(BLOCK_BYPASS_2_OUT), .Y(MUX_BYPASS_2_OUT), .S(Bypass_EN_2));

mux_2to1_32b MUX_BYPASS_3 (.D1(MUX_DESHUFFLE_3_OUT), .D2(BLOCK_BYPASS_3_OUT), .Y(MUX_BYPASS_3_OUT), .S(Bypass_EN_3));

mux_2to1_32b MUX_BYPASS_4 (.D1(MUX_DESHUFFLE_4_OUT), .D2(BLOCK_BYPASS_4_OUT), .Y(MUX_BYPASS_4_OUT), .S(Bypass_EN_4));

mux_2to1_32b MUX_BYPASS_5 (.D1(MUX_DESHUFFLE_5_OUT), .D2(BLOCK_BYPASS_5_OUT), .Y(MUX_BYPASS_5_OUT), .S(Bypass_EN_5));

mux_2to1_32b MUX_BYPASS_6 (.D1(MUX_DESHUFFLE_6_OUT), .D2(BLOCK_BYPASS_6_OUT), .Y(MUX_BYPASS_6_OUT), .S(Bypass_EN_6));

mux_2to1_32b MUX_BYPASS_7 (.D1(MUX_DESHUFFLE_7_OUT), .D2(BLOCK_BYPASS_7_OUT), .Y(MUX_BYPASS_7_OUT), .S(Bypass_EN_7));
	
dff_hold_sync_high_reset DFF0 (.D(MUX_BYPASS_0_OUT), .clk(clk), .hold(Hold_Ctrl_0), .rst(rst), .Q(DFF_0_OUT));

dff_hold_sync_high_reset DFF1 (.D(MUX_BYPASS_1_OUT), .clk(clk), .hold(Hold_Ctrl_1), .rst(rst), .Q(DFF_1_OUT));

dff_hold_sync_high_reset DFF2 (.D(MUX_BYPASS_2_OUT), .clk(clk), .hold(Hold_Ctrl_2), .rst(rst), .Q(DFF_2_OUT));

dff_hold_sync_high_reset DFF3 (.D(MUX_BYPASS_3_OUT), .clk(clk), .hold(Hold_Ctrl_3), .rst(rst), .Q(DFF_3_OUT));

dff_hold_sync_high_reset DFF4 (.D(MUX_BYPASS_4_OUT), .clk(clk), .hold(Hold_Ctrl_4), .rst(rst), .Q(DFF_4_OUT));

dff_hold_sync_high_reset DFF5 (.D(MUX_BYPASS_5_OUT), .clk(clk), .hold(Hold_Ctrl_5), .rst(rst), .Q(DFF_5_OUT));

dff_hold_sync_high_reset DFF6 (.D(MUX_BYPASS_6_OUT), .clk(clk), .hold(Hold_Ctrl_6), .rst(rst), .Q(DFF_6_OUT));

dff_hold_sync_high_reset DFF7 (.D(MUX_BYPASS_7_OUT), .clk(clk), .hold(Hold_Ctrl_7), .rst(rst), .Q(DFF_7_OUT));

mux_2to1_32b MUX_HOLD_0 (.D1(MUX_BYPASS_0_OUT), .D2(DFF_0_OUT), .Y(MUX_HOLD_0_OUT), .S(DFF_Ctrl_0));

mux_2to1_32b MUX_HOLD_1 (.D1(MUX_BYPASS_1_OUT), .D2(DFF_1_OUT), .Y(MUX_HOLD_1_OUT), .S(DFF_Ctrl_1));
										
mux_2to1_32b MUX_HOLD_2 (.D1(MUX_BYPASS_2_OUT), .D2(DFF_2_OUT), .Y(MUX_HOLD_2_OUT), .S(DFF_Ctrl_2));

mux_2to1_32b MUX_HOLD_3 (.D1(MUX_BYPASS_3_OUT), .D2(DFF_3_OUT), .Y(MUX_HOLD_3_OUT), .S(DFF_Ctrl_3));

mux_2to1_32b MUX_HOLD_4 (.D1(MUX_BYPASS_4_OUT), .D2(DFF_4_OUT), .Y(MUX_HOLD_4_OUT), .S(DFF_Ctrl_4));

mux_2to1_32b MUX_HOLD_5 (.D1(MUX_BYPASS_5_OUT), .D2(DFF_5_OUT), .Y(MUX_HOLD_5_OUT), .S(DFF_Ctrl_5));

mux_2to1_32b MUX_HOLD_6 (.D1(MUX_BYPASS_6_OUT), .D2(DFF_6_OUT), .Y(MUX_HOLD_6_OUT), .S(DFF_Ctrl_6));

mux_2to1_32b MUX_HOLD_7 (.D1(MUX_BYPASS_7_OUT), .D2(DFF_7_OUT), .Y(MUX_HOLD_7_OUT), .S(DFF_Ctrl_7));
			
endmodule									
