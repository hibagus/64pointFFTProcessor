`default_nettype none

module ks_2_16b(
  input  wire        i_c0,
  input  wire [15:0] i_pk,
  input  wire [15:0] i_gk,
  output wire        o_c0,
  output wire [14:0] o_pk,
  output wire [15:0] o_gk,
  output wire [15:0] o_p_save
);

wire [15:0] gkj;
wire [14:0] pkj;

assign o_c0      = i_c0;
assign o_p_save  = i_pk[15:0];
assign gkj[0]    = i_c0;
assign gkj[15:1] = i_gk[14:0];
assign pkj       = i_pk[14:0];

grey_cell gc_0(gkj[0], i_pk[0], i_gk[0], o_gk[0]);
black_cell bc_0(pkj[0], gkj[1], i_pk[1], i_gk[1], o_gk[1], o_pk[0]);
black_cell bc_1(pkj[1], gkj[2], i_pk[2], i_gk[2], o_gk[2], o_pk[1]);
black_cell bc_2(pkj[2], gkj[3], i_pk[3], i_gk[3], o_gk[3], o_pk[2]);
black_cell bc_3(pkj[3], gkj[4], i_pk[4], i_gk[4], o_gk[4], o_pk[3]);
black_cell bc_4(pkj[4], gkj[5], i_pk[5], i_gk[5], o_gk[5], o_pk[4]);
black_cell bc_5(pkj[5], gkj[6], i_pk[6], i_gk[6], o_gk[6], o_pk[5]);
black_cell bc_6(pkj[6], gkj[7], i_pk[7], i_gk[7], o_gk[7], o_pk[6]);
black_cell bc_7(pkj[7], gkj[8], i_pk[8], i_gk[8], o_gk[8], o_pk[7]);
black_cell bc_8(pkj[8], gkj[9], i_pk[9], i_gk[9], o_gk[9], o_pk[8]);
black_cell bc_9(pkj[9], gkj[10], i_pk[10], i_gk[10], o_gk[10], o_pk[9]);
black_cell bc_10(pkj[10], gkj[11], i_pk[11], i_gk[11], o_gk[11], o_pk[10]);
black_cell bc_11(pkj[11], gkj[12], i_pk[12], i_gk[12], o_gk[12], o_pk[11]);
black_cell bc_12(pkj[12], gkj[13], i_pk[13], i_gk[13], o_gk[13], o_pk[12]);
black_cell bc_13(pkj[13], gkj[14], i_pk[14], i_gk[14], o_gk[14], o_pk[13]);
black_cell bc_14(pkj[14], gkj[15], i_pk[15], i_gk[15], o_gk[15], o_pk[14]);

endmodule
