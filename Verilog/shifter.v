module shifter( 
input [15:0] D_in, 
input [3:0] shift,
output [31:0] D_in);

always @(shift,D_in)
begin
	case(shift)
		4'b0000 :D_out =  {{16{1'b0}},D_in};
		4'b0001 :D_out =  {{15{1'b0}},D_in,{1{1'b0}}};
		4'b0010 :D_out =  {{14{1'b0}},D_in,{2{1'b0}}};
		4'b0011 :D_out =  {{13{1'b0}},D_in,{3{1'b0}}};
		4'b0100 :D_out =  {{12{1'b0}},D_in,{4{1'b0}}};
		4'b0101 :D_out =  {{11{1'b0}},D_in,{5{1'b0}}};
		4'b0110 :D_out =  {{10{1'b0}},D_in,{6{1'b0}}};
		4'b0111 :D_out =  {{9{1'b0}},D_in,{7{1'b0}}};
		4'b1000 :D_out =  {{8{1'b0}},D_in,{8{1'b0}}};
		4'b1001 :D_out =  {{7{1'b0}},D_in,{9{1'b0}}};
		4'b1010 :D_out =  {{6{1'b0}},D_in,{10{1'b0}}};
		4'b1011 :D_out =  {{5{1'b0}},D_in,{11{1'b0}}};
		4'b1100 :D_out =  {{4{1'b0}},D_in,{12{1'b0}}};
		4'b1101 :D_out =  {{3{1'b0}},D_in,{13{1'b0}}};
		4'b1110 :D_out =  {{2{1'b0}},D_in,{14{1'b0}}};
		4'b1111 :D_out =  {{1{1'b0}},D_in,{15{1'b0}}};
	endcase
end
endmodule
