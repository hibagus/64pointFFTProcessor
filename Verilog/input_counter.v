module input_counter(
clk,
rst,
datastart,
counter_o,
mastertrig);

input clk;
input rst;
input datastart;
output [5:0] counter_o;
output mastertrig;

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
			if(datastart)begin
				currentstate <= counting;
				counter <= 6'b0;
				mastertrig <= 1'b0;
			end
			else begin
				currentstate <= currentstate;
				counter <= 6'b0;
				mastertrig <= 1'b0;
			end
		1:begin
			if(counter == 6'b110101)begin
				currentstate <= counting;
				counter <= counter + 1;
				mastertrig <= 1;
			end
			else if(counter == 6'b111110)begin
				currentstate <= idle;
				counter <= counter + 1;
				mastertrig <= 0;
			end
			else begin
				currentstate <= counting;
				counter <= counter + 1;
				mastertrig <= 0;
			end
		endcase
		currentstate <= currentstate;
	end
endmodule
