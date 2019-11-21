module mux_8_to_1(
input [31:0] D0, 
input [31:0] D1, 
input [31:0] D2, 
input [31:0] D3,
input [31:0] D4,
input [31:0] D5,
input [31:0] D6,
input [31:0] D7,
input [2:0] sel,
output [31:0] Y);

always @(sel,D0,D1,D2,D3,D4,D5,D6,D7)
begin
	case(sel)
		3'b000 : Y = D0;
		3'b001 : Y = D1;
		3'b010 : Y = D2;
		3'b011 : Y = D3;
		3'b100 : Y = D4;
		3'b101 : Y = D5;
		3'b110 : Y = D6;
		3'b111 : Y = D7;
		default : Y = 32'bx;
	endcase
end

endmodule
