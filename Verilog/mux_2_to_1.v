module mux_2_to_1 (
  D0,
  D1,
  S,
  Y
  );
  
  parameter DATA_WIDTH = 1;
   
  input  [DATA_WIDTH-1:0] D0;
  input  [DATA_WIDTH-1:0] D1;
  input                   S;
  output [DATA_WIDTH-1:0] Y;
  
  wire   [DATA_WIDTH-1:0] D0;
  wire   [DATA_WIDTH-1:0] D1;
  wire                    S;
  wire   [DATA_WIDTH-1:0] Y;
  // S == 0 then Y = D0
  // S == 1 then Y = D1
  assign Y = S ? D1 : D0;
endmodule
