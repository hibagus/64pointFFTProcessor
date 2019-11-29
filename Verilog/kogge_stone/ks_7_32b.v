`default_nettype none

module ks_7_32b(
  input  wire        i_c0,
  input  wire [31:0] i_pk,
  input  wire [31:0] i_gk,
  output wire [31:0] o_s,
  output wire        o_carry
);

assign o_carry   = i_gk[31];
assign o_s[0]    = i_c0 ^ i_pk[0];
assign o_s[31:1] = i_gk[30:0] ^ i_pk[31:1];

endmodule
