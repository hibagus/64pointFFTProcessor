module ks_5_16b(
  input  wire        i_c0,
  input  wire [8:0] i_pk,
  input  wire [15:0] i_gk,
  input  wire [15:0] i_p_save,
  output wire        o_c0,
  output wire  [15:0] o_pk,
  output wire [15:0] o_gk,
  output wire  o_p_addn
);

wire [8:0] gkj;
wire  pkj;

assign o_c0      = i_c0;
assign o_pk  = i_p_save[15:0];
assign gkj[0]    = i_c0;
assign gkj[8:1] = i_gk[7:0];
assign pkj       = i_pk[0];
assign o_gk[6:0] = i_gk[6:0];

grey_cell gc_0(gkj[0], i_pk[0], i_gk[7], o_gk[7]);
grey_cell gc_1(gkj[1], i_pk[1], i_gk[8], o_gk[8]);
grey_cell gc_2(gkj[2], i_pk[2], i_gk[9], o_gk[9]);
grey_cell gc_3(gkj[3], i_pk[3], i_gk[10], o_gk[10]);
grey_cell gc_4(gkj[4], i_pk[4], i_gk[11], o_gk[11]);
grey_cell gc_5(gkj[5], i_pk[5], i_gk[12], o_gk[12]);
grey_cell gc_6(gkj[6], i_pk[6], i_gk[13], o_gk[13]);
grey_cell gc_7(gkj[7], i_pk[7], i_gk[14], o_gk[14]);
black_cell bc_0(pkj, gkj[8], i_pk[8], i_gk[15], o_gk[15], o_p_addn);

endmodule
