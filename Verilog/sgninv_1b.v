module sgninv_1b(
A,
C_IN,
R,
P);

input A;
input C_IN;
output R;
output P;

assign R = A ^ C_IN;
assign P = A & C_IN;

endmodule 
