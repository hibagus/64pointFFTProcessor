module mux_2_to_1(
input [31:0] D0, 
input [31:0] D1,
input sel,
output [31:0] Y);

always @(sel,D0,D1)
begin
	case(sel)
		1'b0 : Y = D0;
		1'b1 : Y = D1;
		default : Y = 32'bx;
	endcase
end


endmodule
