module subt_ksa_16b(
input [15:0] A16,
input [15:0] B16,
output COUT_16,
output [15:0] R16); 

  ksa_top_16b ks0(.c0(1'b1), .i_a(A16), .i_b(~B16), .o_s(R16), .o_carry(COUT_16));


endmodule
