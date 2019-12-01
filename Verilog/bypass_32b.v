module bypass_32b(
A32,
TYPESEL,
R32);

input [31:0] A32;
input [2:0] TYPESEL;
output [31:0] R32;

wire [15:0] real_a32;
wire [15:0] imag_a32;
wire [15:0] real_r32;
wire [15:0] imag_r32;
wire [15:0] mux0out;
wire [15:0] mux1out;
wire [15:0] mux2out;
wire [15:0] mux3out;
wire [15:0] sgninv_0_out;
wire [15:0] sgninv_1_out;

assign real_a32 = A32[31:16];
assign imag_a32 = A32[15:0];
assign real_r32 = mux2out;
assign imag_r32 = mux3out;
assign R32[31:16] = real_r32;
assign R32[15:0] = imag_r32;

mux_2to1_16b mux0(.D1(real_a32), .D2(imag_a32), .Y(mux0out), .S(TYPESEL[2]));
mux_2to1_16b mux1(.D1(imag_a32), .D2(real_a32), .Y(mux1out), .S(TYPESEL[2]));

sgninv_16b sgninv0(.A16(mux0out), .R16(sgninv_0_out));
sgninv_16b sgninv1(.A16(mux1out), .R16(sgninv_1_out));

mux_2to1_16b mux2(.D1(mux0out), .D2(sgninv_0_out), .Y(mux2out), .S(TYPESEL[1]));
mux_2to1_16b mux3(.D1(mux1out), .D2(sgninv_1_out), .Y(mux3out), .S(TYPESEL[0]));

endmodule
