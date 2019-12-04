module rshift_6_16b_to_16b(
  Data_In,
  Data_Out
  );
  
  input  [15:0] Data_In;
  output [15:0] Data_Out;
  wire   [15:0] Data_In;
  wire   [15:0] Data_Out;
  
  assign Data_Out[15] = Data_In[15]; 
  assign Data_Out[14] = Data_In[15]; 
  assign Data_Out[13] = Data_In[15]; 
  assign Data_Out[12] = Data_In[15]; 
  assign Data_Out[11] = Data_In[15]; 
  assign Data_Out[10:0] = Data_In[15:6];

endmodule
