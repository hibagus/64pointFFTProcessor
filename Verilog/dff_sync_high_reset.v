module dff_sync_high_reset (
  clk,
  rst,
  D,
  Q);
  
  parameter DATA_WIDTH = 1;
  
  input                   clk;
  input                   rst;
  input  [DATA_WIDTH-1:0] D;
  output [DATA_WIDTH-1:0] Q;
  
  wire                    clk;
  wire                    rst;
  wire   [DATA_WIDTH-1:0] D;
  reg    [DATA_WIDTH-1:0] Q;
  
  always@(posedge clk)
  begin
    if(rst==1'b1) // active high reset 
      begin
        Q <= 0;
      end
    else
      begin
        Q <= D;
      end
  end
endmodule
