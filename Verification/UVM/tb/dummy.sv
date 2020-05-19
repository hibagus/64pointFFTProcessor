module FFT ( In_Stream, Mode, Data_Start, clk, rst, next_data, Out_Stream, Data_Out );
  input      [31:0] In_Stream;
  output reg [31:0] Out_Stream;
  input             Mode, Data_Start, clk, rst;
  output reg        next_data, Data_Out;

  reg  [31:0] rom [0:63];
  reg  [5:0]  romindex;
  reg         state;
  reg  [3:0]  cycles;

  always @(posedge clk) begin
    if(rst) begin
      Out_Stream    <= 0; 
      next_data     <= 0;
      romindex      <= 0;
      Data_Out      <= 0;
      state         <= 0;
      cycles        <= 0;
    end
    else begin
      if(state==0) begin
        if(Data_Start && (romindex==0)) begin
          rom[romindex] <= In_Stream;
          romindex      <= romindex + 1;
          state         <= 0;
        end
        else if(romindex>0) begin
          rom[romindex] <= In_Stream;
          romindex      <= (romindex==63) ? 0: romindex + 1;
          state         <= (romindex==63) ? 1: 0;
        end
      end
      else if(state==1) begin
        if(cycles<14) begin
            cycles <= cycles+1;
        end
        else begin
          Data_Out      <= 1'b1;
          Out_Stream    <= rom[romindex] + 5;
          romindex      <= romindex + 1;
          if(romindex==63)begin
            next_data <= 1;
            state     <= 2;
          end
          else begin
            next_data <= 0;
            state     <= 1;
          end
        end
      end
      else begin
        state     <= 2;
      end 
    end
  end

endmodule : FFT