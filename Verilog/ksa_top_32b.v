`default_nettype none

module ksa_top_32b(
  input  wire        c0,
  input  wire [31:0] i_a,
  input  wire [31:0] i_b,
  output wire [31:0] o_s,
  output wire        o_carry
);

wire [31:0] p1;
wire [31:0] g1;
wire        c1;

wire [30:0] p2;
wire [31:0] g2;
wire        c2;
wire [31:0] ps1;

wire [28:0] p3;
wire [31:0] g3;
wire        c3;
wire [31:0] ps2;

wire [24:0] p4;
wire [31:0] g4;
wire        c4;
wire [31:0] ps3;

wire [16:0] p5;
wire [31:0] g5;
wire        c5;
wire [31:0] ps4;

wire [31:0] p6;
wire [31:0] g6;
wire        c6;

ks_1_32b s1(c0, i_a, i_b, p1, g1, c1);
ks_2_32b s2(c1, p1, g1, c2, p2, g2, ps1);
ks_3_32b s3(c2, p2, g2, ps1, c3, p3, g3, ps2);
ks_4_32b s4(c3, p3, g3, ps2, c4, p4, g4, ps3);
ks_5_32b s5(c4, p4, g4, ps3, c5, p5, g5, ps4);
ks_6_32b s6(c5, p5, g5, ps4, c6, p6, g6);
ks_7_32b s7(c6, p6, g6, o_s, o_carry);

endmodule
