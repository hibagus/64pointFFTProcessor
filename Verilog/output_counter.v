module output_counter(
clk,
rst,
dataind,
counter_o,
datavalid);

input clk;
input rst;
input dataind;
output reg [5:0] counter_o;
output reg datavalid;

reg currentstate;
reg idle = 1'b0;
reg counting = 1'b1;

reg [5:0] counter;

always@(posedge clk)begin
	counter_o <= counter;
	if(rst)begin
		currentstate <= idle;
	end
	else begin
		case (currentstate)
		0:begin
			if(dataind)begin
				currentstate <= counting;
				counter <= 6'b0;
				datavalid <= 1'b0;
			end
			else begin
				currentstate <= currentstate;
				counter <= 6'b0;
				datavalid <= 1'b0;
			end
		end
		1:begin
			if(counter == 6'b111110)begin
				currentstate <= idle;
				counter <= counter + 1;
				datavalid <= 1;
			end
			else begin
				currentstate <= counting;
				counter <= counter + 1;
				datavalid <= 1;
			end
		end
		endcase
		currentstate <= currentstate;
	end
end
endmodule
