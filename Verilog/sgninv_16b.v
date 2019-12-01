module sgninv_16b(
A16,
R16);

input [15:0] A16;
output [15:0] R16;

wire [15:0] A16neg;

assign A16neg = ~A16;
assign R16 = A16neg + 16'b1;

endmodule
