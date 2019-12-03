module notgate (
  A,
  Y
  );
  
  parameter DATA_WIDTH = 1;
   
  input  [DATA_WIDTH-1:0] A;
  output [DATA_WIDTH-1:0] Y;
  
  wire   [DATA_WIDTH-1:0] A;
  wire   [DATA_WIDTH-1:0] Y;
  
  assign Y = ~A;
endmodule
