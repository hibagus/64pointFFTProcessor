module mux_8_to_1 (
  D0,
  D1,
  D2,
  D3,
  D4,
  D5,
  D6,
  D7,
  S,
  Y
  );
  
  parameter DATA_WIDTH = 3;
   
  input  [DATA_WIDTH-1:0] D0;
  input  [DATA_WIDTH-1:0] D1;
  input  [DATA_WIDTH-1:0] D2;
  input  [DATA_WIDTH-1:0] D3;
  input  [DATA_WIDTH-1:0] D4;
  input  [DATA_WIDTH-1:0] D5;
  input  [DATA_WIDTH-1:0] D6;
  input  [DATA_WIDTH-1:0] D7;
  input  [2:0]            S;
  output [DATA_WIDTH-1:0] Y;
  
  wire   [DATA_WIDTH-1:0] D0;
  wire   [DATA_WIDTH-1:0] D1;
  wire   [DATA_WIDTH-1:0] D2;
  wire   [DATA_WIDTH-1:0] D3;
  wire   [DATA_WIDTH-1:0] D4;
  wire   [DATA_WIDTH-1:0] D5;
  wire   [DATA_WIDTH-1:0] D6;
  wire   [DATA_WIDTH-1:0] D7;
  wire   [2:0]            S;
  wire   [DATA_WIDTH-1:0] Y;
  // S == 000 then Y = D0
  // S == 001 then Y = D1
  // S == 010 then Y = D2
  // S == 011 then Y = D3
  // S == 100 then Y = D4
  // S == 101 then Y = D5
  // S == 110 then Y = D6
  // S == 111 then Y = D7
  assign Y = S[2] ? 
               (S[1] ?
                  (S[0] ? D7 : D6) :
                  (S[0] ? D5 : D4)
                ) :
                (S[1] ?
                  (S[0] ? D3 : D2) :
                  (S[0] ? D1 : D0)
                );
endmodule
