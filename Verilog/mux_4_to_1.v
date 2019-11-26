module mux_4_to_1 (
  D0,
  D1,
  D2,
  D3,
  S,
  Y
  );
  
  parameter DATA_WIDTH = 1;
   
  input  [DATA_WIDTH-1:0] D0;
  input  [DATA_WIDTH-1:0] D1;
  input  [DATA_WIDTH-1:0] D2;
  input  [DATA_WIDTH-1:0] D3;
  input  [1:0]            S;
  output [DATA_WIDTH-1:0] Y;
  
  wire   [DATA_WIDTH-1:0] D0;
  wire   [DATA_WIDTH-1:0] D1;
  wire   [DATA_WIDTH-1:0] D2;
  wire   [DATA_WIDTH-1:0] D3;
  wire   [1:0]            S;
  wire   [DATA_WIDTH-1:0] Y;
  // S == 00 then Y = D0
  // S == 01 then Y = D1
  // S == 10 then Y = D2
  // S == 11 then Y = D3
  assign Y = S[1] ? (S[0] ? D3 : D2 ) : (S[0] ? D1 : D0 );
endmodule
