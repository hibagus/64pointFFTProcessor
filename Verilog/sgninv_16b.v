module sgninv_16b(
  A16,
  R16,
  COUT);
  
  input  [15:0] A16;
  output [15:0] R16;
  output        COUT;
  
  wire   [15:0] A16;
  wire   [15:0] R16;
  wire          COUT;
  
  wire   [15:0] A16neg;
  
  notgate # (
    .DATA_WIDTH(16)
  ) notgate_inst0 (
    .A(A16),
    .Y(A16neg)
  );
  
  ksa_top_16b ksa_top_16b_inst0(
    .c0(1'b1),
    .i_a(A16neg),
    .i_b(16'b0000000000000000),
    .o_s(R16),
    .o_carry(COUT)
  );

endmodule
