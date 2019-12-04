module complex_adder_ksa_32b (
  A32,
  B32,
  R32,
  COUT_32
  );
  
   
  input  [31:0] A32;
  input  [31:0] B32;
  output [31:0] R32;
  output [1:0]  COUT_32;
  
  wire   [31:0] A32;
  wire   [31:0] B32;
  wire   [31:0] R32;
  wire   [1:0]  COUT_32;


  wire [15:0] real_a32;
  wire [15:0] imag_a32;  
  wire [15:0] real_b32;
  wire [15:0] imag_b32;
  wire        cout_real;
  wire        cout_imag;
  wire [15:0] sum_real;
  wire [15:0] sum_imag;

  assign real_a32 = A32[31:16];
  assign imag_a32 = A32[15:0];
  assign real_b32 = B32[31:16];
  assign imag_b32 = B32[15:0];
  assign COUT_32  = {cout_real,cout_imag};
  assign R32      = {sum_real,sum_imag};
  
  ksa_top_16b ksa_top_16b_instreal(
    .c0(1'b0),
    .i_a(real_a32),
    .i_b(real_b32),
    .o_s(sum_real),
    .o_carry(cout_real)
  );
  
  ksa_top_16b ksa_top_16b_instimag(
    .c0(1'b0),
    .i_a(imag_a32),
    .i_b(imag_b32),
    .o_s(sum_imag),
    .o_carry(cout_imag)
  );

endmodule
