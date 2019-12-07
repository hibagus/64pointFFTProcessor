`default_nettype none

module ks_3_32b(
  input  wire        i_c0,
  input  wire [30:0] i_pk,
  input  wire [31:0] i_gk,
  input  wire [31:0] i_p_save,
  output wire        o_c0,
  output wire [28:0] o_pk,
  output wire [31:0] o_gk,
  output wire [31:0] o_p_save
);

wire [30:0] gkj;
wire [28:0] pkj;

assign o_c0      = i_c0;
assign o_p_save  = i_p_save[31:0];
assign gkj[0]    = i_c0;
assign gkj[30:1] = i_gk[29:0];
assign pkj       = i_pk[28:0];
assign o_gk[0]   = i_gk[0];

grey_cell gc_0(gkj[0], i_pk[0], i_gk[1], o_gk[1]);
grey_cell gc_1(gkj[1], i_pk[1], i_gk[2], o_gk[2]);
black_cell bc_0(pkj[0], gkj[2], i_pk[2], i_gk[3], o_gk[3], o_pk[0]);
black_cell bc_1(pkj[1], gkj[3], i_pk[3], i_gk[4], o_gk[4], o_pk[1]);
black_cell bc_2(pkj[2], gkj[4], i_pk[4], i_gk[5], o_gk[5], o_pk[2]);
black_cell bc_3(pkj[3], gkj[5], i_pk[5], i_gk[6], o_gk[6], o_pk[3]);
black_cell bc_4(pkj[4], gkj[6], i_pk[6], i_gk[7], o_gk[7], o_pk[4]);
black_cell bc_5(pkj[5], gkj[7], i_pk[7], i_gk[8], o_gk[8], o_pk[5]);
black_cell bc_6(pkj[6], gkj[8], i_pk[8], i_gk[9], o_gk[9], o_pk[6]);
black_cell bc_7(pkj[7], gkj[9], i_pk[9], i_gk[10], o_gk[10], o_pk[7]);
black_cell bc_8(pkj[8], gkj[10], i_pk[10], i_gk[11], o_gk[11], o_pk[8]);
black_cell bc_9(pkj[9], gkj[11], i_pk[11], i_gk[12], o_gk[12], o_pk[9]);
black_cell bc_10(pkj[10], gkj[12], i_pk[12], i_gk[13], o_gk[13], o_pk[10]);
black_cell bc_11(pkj[11], gkj[13], i_pk[13], i_gk[14], o_gk[14], o_pk[11]);
black_cell bc_12(pkj[12], gkj[14], i_pk[14], i_gk[15], o_gk[15], o_pk[12]);
black_cell bc_13(pkj[13], gkj[15], i_pk[15], i_gk[16], o_gk[16], o_pk[13]);
black_cell bc_14(pkj[14], gkj[16], i_pk[16], i_gk[17], o_gk[17], o_pk[14]);
black_cell bc_15(pkj[15], gkj[17], i_pk[17], i_gk[18], o_gk[18], o_pk[15]);
black_cell bc_16(pkj[16], gkj[18], i_pk[18], i_gk[19], o_gk[19], o_pk[16]);
black_cell bc_17(pkj[17], gkj[19], i_pk[19], i_gk[20], o_gk[20], o_pk[17]);
black_cell bc_18(pkj[18], gkj[20], i_pk[20], i_gk[21], o_gk[21], o_pk[18]);
black_cell bc_19(pkj[19], gkj[21], i_pk[21], i_gk[22], o_gk[22], o_pk[19]);
black_cell bc_20(pkj[20], gkj[22], i_pk[22], i_gk[23], o_gk[23], o_pk[20]);
black_cell bc_21(pkj[21], gkj[23], i_pk[23], i_gk[24], o_gk[24], o_pk[21]);
black_cell bc_22(pkj[22], gkj[24], i_pk[24], i_gk[25], o_gk[25], o_pk[22]);
black_cell bc_23(pkj[23], gkj[25], i_pk[25], i_gk[26], o_gk[26], o_pk[23]);
black_cell bc_24(pkj[24], gkj[26], i_pk[26], i_gk[27], o_gk[27], o_pk[24]);
black_cell bc_25(pkj[25], gkj[27], i_pk[27], i_gk[28], o_gk[28], o_pk[25]);
black_cell bc_26(pkj[26], gkj[28], i_pk[28], i_gk[29], o_gk[29], o_pk[26]);
black_cell bc_27(pkj[27], gkj[29], i_pk[29], i_gk[30], o_gk[30], o_pk[27]);
black_cell bc_28(pkj[28], gkj[30], i_pk[30], i_gk[31], o_gk[31], o_pk[28]);

endmodule
