`default_nettype none

module ks_1_32b(
  input  wire i_c0,
  input  wire [31:0]i_a,
  input  wire [31:0]i_b,
  output wire [31:0]o_pk_1,
  output wire [31:0]o_gk_1,
  output wire o_c0_1
);

assign o_c0_1 = i_c0;

pg pg_0(i_a[0], i_b[0], o_pk_1[0], o_gk_1[0]);
pg pg_1(i_a[1], i_b[1], o_pk_1[1], o_gk_1[1]);
pg pg_2(i_a[2], i_b[2], o_pk_1[2], o_gk_1[2]);
pg pg_3(i_a[3], i_b[3], o_pk_1[3], o_gk_1[3]);
pg pg_4(i_a[4], i_b[4], o_pk_1[4], o_gk_1[4]);
pg pg_5(i_a[5], i_b[5], o_pk_1[5], o_gk_1[5]);
pg pg_6(i_a[6], i_b[6], o_pk_1[6], o_gk_1[6]);
pg pg_7(i_a[7], i_b[7], o_pk_1[7], o_gk_1[7]);
pg pg_8(i_a[8], i_b[8], o_pk_1[8], o_gk_1[8]);
pg pg_9(i_a[9], i_b[9], o_pk_1[9], o_gk_1[9]);
pg pg_10(i_a[10], i_b[10], o_pk_1[10], o_gk_1[10]);
pg pg_11(i_a[11], i_b[11], o_pk_1[11], o_gk_1[11]);
pg pg_12(i_a[12], i_b[12], o_pk_1[12], o_gk_1[12]);
pg pg_13(i_a[13], i_b[13], o_pk_1[13], o_gk_1[13]);
pg pg_14(i_a[14], i_b[14], o_pk_1[14], o_gk_1[14]);
pg pg_15(i_a[15], i_b[15], o_pk_1[15], o_gk_1[15]);
pg pg_16(i_a[16], i_b[16], o_pk_1[16], o_gk_1[16]);
pg pg_17(i_a[17], i_b[17], o_pk_1[17], o_gk_1[17]);
pg pg_18(i_a[18], i_b[18], o_pk_1[18], o_gk_1[18]);
pg pg_19(i_a[19], i_b[19], o_pk_1[19], o_gk_1[19]);
pg pg_20(i_a[20], i_b[20], o_pk_1[20], o_gk_1[20]);
pg pg_21(i_a[21], i_b[21], o_pk_1[21], o_gk_1[21]);
pg pg_22(i_a[22], i_b[22], o_pk_1[22], o_gk_1[22]);
pg pg_23(i_a[23], i_b[23], o_pk_1[23], o_gk_1[23]);
pg pg_24(i_a[24], i_b[24], o_pk_1[24], o_gk_1[24]);
pg pg_25(i_a[25], i_b[25], o_pk_1[25], o_gk_1[25]);
pg pg_26(i_a[26], i_b[26], o_pk_1[26], o_gk_1[26]);
pg pg_27(i_a[27], i_b[27], o_pk_1[27], o_gk_1[27]);
pg pg_28(i_a[28], i_b[28], o_pk_1[28], o_gk_1[28]);
pg pg_29(i_a[29], i_b[29], o_pk_1[29], o_gk_1[29]);
pg pg_30(i_a[30], i_b[30], o_pk_1[30], o_gk_1[30]);
pg pg_31(i_a[31], i_b[31], o_pk_1[31], o_gk_1[31]);

endmodule
