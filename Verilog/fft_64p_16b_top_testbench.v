module fft_64p_16b_top_testbench(
  In_Stream,
  Mode,
  Data_Start,
  clk,
  rst,
  Out_Stream,
  Data_Out
  );
  
  output  [31:0] In_Stream;
  output         Mode;
  output         Data_Start;
  output         clk;
  output         rst;
  input        Data_Out;
  input [31:0] Out_Stream;

  reg   [31:0] In_Stream;
  wire          Mode;
  reg          Data_Start;
  wire          clk;
  reg          rst;
  wire          Data_Out;
  wire   [31:0] Out_Stream;


  reg [1:0] rst_counter;
  reg [5:0] state_count;
  reg [1:0] state;
  reg clock;

  always @(posedge clock)  
  begin
    if(rst) begin
      In_Stream <= 32'b0; 
      state <= 2'b1;
      Data_Start <= 1'b0;
      rst_counter <= 2'b0;
      state_count <= 6'b0;
    end
    else begin
      if(state == 2'b1) begin
       Data_Start <= 1'b0;
       rst_counter <= rst_counter +1;
        In_Stream <= 32'b0;
       if(rst_counter == 3) begin
         state <= 2'b10;
       end
      end
      else if(state == 2'b10) begin
        if(state_count == 6'b0) begin
         In_Stream <= 32'h00290000;
        end
	else begin
         //In_Stream <= 32'h0;
         In_Stream <= 32'h00290000;
        end
        
        state_count <= state_count +1;
        Data_Start <= 1'b1;
        if(state_count == 6'b111111) begin
          state <= 2'b0;
          Data_Start <= 1'b1;
          In_Stream <= 32'h00290000;
        end
      end
      else if(state == 2'b0) begin
          Data_Start <= 1'b0;
          In_Stream <= 32'b0;
          state <= state;
      end
    
    end
  end

 fft_64p_16b_top(
  .In_Stream(In_Stream),
  .Mode(0),
  .Data_Start(Data_Start),
  .clk(clock),
  .rst(rst),
  .Out_Stream(Out_Stream),
  .Data_Out(Data_Out));

 

       always
        #20 clock = ~clock;

        initial
        #7000 $finish;

       initial begin
                clock = 1'b0;
                rst = 1'b1;
           #80 rst = 1'b0;
       end 

 
endmodule
