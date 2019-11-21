module mux_4_to_1(
input [31:0] D0,
input [31:0] D1,
input [31:0] D2,
input [31:0] D3,
input [1:0] sel,
output [31:0] Y);

always @(sel,D0,D1,D2,D3)
begin
	case(sel)
		2'b00 : Y = D0;
		2'b01 : Y = D1;
		2'b10 : Y = D2;
		2'b11 : Y = D3;
		default : Y = 32'bx;
	
	endcase
end

endmodule
