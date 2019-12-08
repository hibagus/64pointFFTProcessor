module lshifter(
  D_in,
  D_out
  );
  
  // Block Parameter 
  parameter DATA_WIDTH                   = 16;
  parameter LSHIFT_AMOUNT                = 8;
  
  // Block Input Port
  input  [DATA_WIDTH-1:0]                D_in; 
  
  // Block Output Port
  output [2*DATA_WIDTH-1:0]              D_out;
  
  // Block Input Wire/Reg
  wire   [DATA_WIDTH-1:0]                D_in;
  
  // Block Output Wire/Reg 
  wire   [2*DATA_WIDTH-1:0]              D_out;
  
  // Local Wire/Reg
  wire   [DATA_WIDTH-LSHIFT_AMOUNT-1:0]  prefix;
  wire   [LSHIFT_AMOUNT-1:0]             suffix;
  
  // Structural Definition
  assign prefix = 0;
  
  
  generate
   if(LSHIFT_AMOUNT==0) 
     begin : generate_no_lshift
       assign D_out = {prefix,D_in};
     end
   else 
     begin : generate_lshift
       assign D_out = {prefix,D_in,suffix};
       assign suffix = 0;
     end
  endgenerate
  
  // Behavioral Definition
endmodule
