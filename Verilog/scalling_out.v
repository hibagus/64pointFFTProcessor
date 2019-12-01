module scalling_out(
A32,
Swap,
R32);

wire [15:0] real_a32;
wire [15:0] imag_a32;
wire [15:0] real_r32;
wire [15:0] imag_r32;
wire [15:0] mux0out;
wire [15:0] real_scale;
wire [15:0] imag_scale;
wire [15:0] temp_scale;

assign real_a32 = A32[31:16];
assign imag_a32 = A32[15:0];
assign real_r32 = real_scale;
assign imag_r32 = imag_scale;
assign temp_scale[31:16] = real_r32;
assign temp_scale[15:0] = imag_r32;

rshift_6_16b_to_16b scale_0(.Data_In(real_a32), .Data_Out(real_scale));
rshift_6_16b_to_16b scale_1(.Data_In(imag_a32), .Data_Out(imag_scale));
mux_2to1_32b mux_0(.D1(A32), .D2(temp_scale), .Y(R32), .S(Swap));

endmodule
