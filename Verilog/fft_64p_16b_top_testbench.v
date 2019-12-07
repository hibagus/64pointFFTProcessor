module fft_64p_16b_top_testbench(
  In_Stream,
  Mode,
  Data_Start,
  clk,
  rst,
  next_data,
  Out_Stream,
  Data_Out
  );
  
  output  [31:0] In_Stream;
  output         Mode;
  output         Data_Start;
  output         clk;
  output         rst;
  output         next_data;
  output         Data_Out;
  output  [31:0] Out_Stream;

  reg     [31:0] In_Stream;
  wire           Mode;
  reg            Data_Start;
  reg            clk;
  reg            rst;
  wire           next_data;
  wire           Data_Out;
  wire    [31:0] Out_Stream;
  
  reg            stateread;
  reg            statewrite;
  reg     [5:0]  romindex;
  reg     [5:0]  ramindex;
  reg     [31:0] rom [0:63];
  reg     [31:0] ram [0:63];
  
  always @(posedge clk)  
  begin
    if(rst) 
      begin
        In_Stream    <= 32'b0; 
        Data_Start   <= 1'b0;
        romindex     <= 6'b0;
        stateread    <= 1'b0;
      end
    else 
      begin
        if(stateread==1'b0)
          begin
            if(romindex==6'b111111)
              begin
                In_Stream    <= rom[romindex];
                romindex     <= romindex + 1'b1;
                Data_Start   <= 1'b1;
                stateread    <= 1'b1;
              end
            else
              begin
                In_Stream    <= rom[romindex];
                romindex     <= romindex + 1'b1;
                Data_Start   <= 1'b1;
                stateread    <= 1'b0;
              end
          end
        else
          begin
            In_Stream    <= 32'b0;
            romindex     <= romindex;
            Data_Start   <= 1'b0;
          end 
      end
  end
  
  always @(posedge clk)  
  begin
    if(rst) 
      begin
        ramindex     <= 6'b0;
        statewrite   <= 1'b0;
      end
    else 
      begin
        if(statewrite==1'b0)
          begin
            if(Data_Out==1'b1)
              begin
                ram[ramindex]<= Out_Stream;
                ramindex     <= ramindex + 1'b1;
                statewrite   <= 1'b1;
              end
            else
              begin
                ram[ramindex]<= ram[ramindex];
                ramindex     <= 6'b000000;
                statewrite   <= 1'b0;
              end
          end
        else
          begin
            if(ramindex==6'b111111)
              begin
                ram[ramindex]<= Out_Stream;
                ramindex     <= ramindex + 1'b1;
                statewrite   <= 1'b0;
              end
            else
              begin
                ram[ramindex]<= Out_Stream;
                ramindex     <= ramindex + 1'b1;
                statewrite   <= 1'b1;
              end
          end 
      end
  end
  

 fft_64p_16b_top fft_64p_16b_top_inst0 (
  .In_Stream(In_Stream),
  .Mode(0),
  .Data_Start(Data_Start),
  .clk(clk),
  .rst(rst),
  .next_data(next_data),
  .Out_Stream(Out_Stream),
  .Data_Out(Data_Out)
  );

  // =======================================================//	
  // Clock Initialization                                   //
  // =======================================================//
  
  initial
    begin
      clk = 1'b0;
	end
  
    always
      #20 clk = ~clk;

  // =======================================================//	
  // Clear Initialization and Assertion                     //
  // =======================================================//
  // clear signal assertion
  
  initial
    begin
      rst = 1'b1;
      @(posedge clk); #1;
      @(posedge clk); #1;
      rst = 1'b0; 
    end
      

  // =======================================================//	
  // Simulation Stop Time                                   //
  // =======================================================//
  initial
  #7000 $finish;
  
  
  // =======================================================//	
  // Input Data Stream Reading                              //
  // =======================================================//
  initial begin
    $readmemh("timeseries.hex", rom);
  end
  
  // =======================================================//	
  // Output Data Stream Writing                             //
  // =======================================================//
  initial
  #6900 $writememh("freqseries.hex", ram);
endmodule
