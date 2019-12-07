`default_nettype none

module pg(
  input  wire i_a,
  input  wire i_b,
  output wire o_p,
  output wire o_g
);

assign o_p = i_a ^ i_b;
assign o_g = i_a & i_b;

endmodule
