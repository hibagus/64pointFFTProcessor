module real_imaginary_interchange(
input [31:0] IN32,
input swap,
output [31:0] OUT32); 

always @(swap,IN32)
begin
	case(swap)
		1'b0 : OUT32 = IN32;
		1'b1 : OUT32 = {IN32[15:0],IN32[31:16]};
	endcase
end

endmodule
