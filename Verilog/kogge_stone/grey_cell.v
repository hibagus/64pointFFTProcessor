`default_nettype none

module grey_cell(
  input  wire i_gj,
  input  wire i_pk,
  input  wire i_gk,
  output wire o_g
);

assign o_g = i_gk | (i_gj & i_pk);

endmodule
