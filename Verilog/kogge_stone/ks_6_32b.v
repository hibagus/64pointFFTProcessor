`default_nettype none

module ks_6_32b(
  input  wire        i_c0,
  input  wire [16:0] i_pk,
  input  wire [31:0] i_gk,
  input  wire [31:0] i_p_save,
  output wire        o_c0,
  output wire [31:0] o_pk,
  output wire [31:0] o_gk
);

wire [16:0] gkj;

assign o_c0       = i_c0;
assign o_pk       = i_p_save[31:0];
assign gkj[0]     = i_c0;
assign gkj[16:1]  = i_gk[15:0];
assign o_gk[14:0] = i_gk[14:0];

grey_cell gc_0(gkj[0], i_pk[0], i_gk[15], o_gk[15]);
grey_cell gc_1(gkj[1], i_pk[1], i_gk[16], o_gk[16]);
grey_cell gc_2(gkj[2], i_pk[2], i_gk[17], o_gk[17]);
grey_cell gc_3(gkj[3], i_pk[3], i_gk[18], o_gk[18]);
grey_cell gc_4(gkj[4], i_pk[4], i_gk[19], o_gk[19]);
grey_cell gc_5(gkj[5], i_pk[5], i_gk[20], o_gk[20]);
grey_cell gc_6(gkj[6], i_pk[6], i_gk[21], o_gk[21]);
grey_cell gc_7(gkj[7], i_pk[7], i_gk[22], o_gk[22]);
grey_cell gc_8(gkj[8], i_pk[8], i_gk[23], o_gk[23]);
grey_cell gc_9(gkj[9], i_pk[9], i_gk[24], o_gk[24]);
grey_cell gc_10(gkj[10], i_pk[10], i_gk[25], o_gk[25]);
grey_cell gc_11(gkj[11], i_pk[11], i_gk[26], o_gk[26]);
grey_cell gc_12(gkj[12], i_pk[12], i_gk[27], o_gk[27]);
grey_cell gc_13(gkj[13], i_pk[13], i_gk[28], o_gk[28]);
grey_cell gc_14(gkj[14], i_pk[14], i_gk[29], o_gk[29]);
grey_cell gc_15(gkj[15], i_pk[15], i_gk[30], o_gk[30]);
grey_cell gc_16(gkj[16], i_pk[16], i_gk[31], o_gk[31]);

endmodule
