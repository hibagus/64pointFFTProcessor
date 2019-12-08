`default_nettype none

module ks_1_16b(
  input  wire i_c0,
  input  wire [15:0]i_a,
  input  wire [15:0]i_b,
  output wire [15:0]o_pk_1,
  output wire [15:0]o_gk_1,
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

endmodule
