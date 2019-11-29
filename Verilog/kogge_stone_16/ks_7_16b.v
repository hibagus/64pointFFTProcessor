`default_nettype none

module ks_7_16b(
  input  wire        i_c0,
  input  wire [15:0] i_pk,
  input  wire [15:0] i_gk,
  input  wire i_p_addn,
  output wire [15:0] o_s,
  output wire        o_carry
);

assign o_carry   = i_gk[15] | i_c0  & i_p_addn;
assign o_s[0]    = i_c0 ^ i_pk[0];
assign o_s[15:1] = i_gk[14:0] ^ i_pk[15:1];

endmodule
