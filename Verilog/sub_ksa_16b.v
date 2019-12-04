module sub_ksa_16b (
  A16,
  B16,
  R16,
  COUT_16
  );
  
  input  [15:0] A16;
  input  [15:0] B16;
  output        COUT_16;
  output [15:0] R16; 
  
  wire   [15:0] A16;
  wire   [15:0] B16;
  wire          COUT_16;
  wire   [15:0] R16; 

  wire   [15:0] B16neg;
  
  notgate # (
    .DATA_WIDTH(16)
  ) notgate_inst0 (
    .A(B16),
    .Y(B16neg)
  );
  
  ksa_top_16b ksa_top_16b_inst0(
    .c0(1'b1),
    .i_a(A16),
    .i_b(B16neg),
    .o_s(R16),
    .o_carry(COUT_16)
  );
  
endmodule
