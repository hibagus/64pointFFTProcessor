`default_nettype none

module black_cell(
  input  wire i_pj,
  input  wire i_gj,
  input  wire i_pk,
  input  wire i_gk,
  output wire o_g,
  output wire o_p
);

assign o_g = i_gk | (i_gj & i_pk);
assign o_p = i_pk & i_pj;

endmodule
