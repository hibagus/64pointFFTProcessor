module generic_mult_16b(
  D_in,
  D_out
  );
  
  // Block Parameter 
  parameter  [15:0] CONST    = 16'b1111111111111111;
  
  input      [15:0] D_in;
  output     [15:0] D_out;
  
  wire       [15:0] D_in;
  wire       [15:0] D_out;

  wire       [15:0] mux_0_out;
  wire       [15:0] mux_1_out;
  wire       [15:0] siginv_0_out;

  wire       [31:0] lshift_0_out;
  wire       [31:0] lshift_1_out;
  wire       [31:0] lshift_2_out;
  wire       [31:0] lshift_3_out;
  wire       [31:0] lshift_4_out;
  wire       [31:0] lshift_5_out;
  wire       [31:0] lshift_6_out;
  wire       [31:0] lshift_7_out;
  wire       [31:0] lshift_8_out;
  wire       [31:0] lshift_9_out;
  wire       [31:0] lshift_10_out;
  wire       [31:0] lshift_11_out;
  wire       [31:0] lshift_12_out;
  wire       [31:0] lshift_13_out;
  wire       [31:0] lshift_14_out;
  wire       [31:0] lshift_15_out;

  wire       [31:0] adder_0_out;
  wire       [31:0] adder_1_out;
  wire       [31:0] adder_2_out;
  wire       [31:0] adder_3_out;
  wire       [31:0] adder_4_out;
  wire       [31:0] adder_5_out;
  wire       [31:0] adder_6_out;
  wire       [31:0] adder_7_out;
  wire       [31:0] adder_8_out;
  wire       [31:0] adder_9_out;
  wire       [31:0] adder_10_out;
  wire       [31:0] adder_11_out;
  wire       [31:0] adder_12_out;
  wire       [31:0] adder_13_out;
  wire       [31:0] adder_14_out;

  wire       [15:0] bit_adj_out;
  wire       [15:0] siginv_1_out;

  assign D_out = mux_1_out;
  
  sgninv_16b sgninv_16b_inst0 (
    .A16(D_in), 
    .R16(siginv_0_out)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst0 (
    .D0(D_in),
    .D1(siginv_0_out),
    .S(D_in[15]),
    .Y(mux_0_out)
  ); 
  
  generate 
  // Shifter Group
  if(CONST[0] == 1'b1) 
    begin 
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(0)
      ) lshift_0_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_0_out)
      );
    end
          
  if(CONST[1] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(1)
      ) lshift_1_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_1_out)
      );
    end
    
  if(CONST[2] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(2)
      ) lshift_2_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_2_out)
      );
    end

  if(CONST[3] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(3)
      ) lshift_3_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_3_out)
      );
    end
    
  if(CONST[4] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(4)
      ) lshift_4_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_4_out)
      );
    end
    
  if(CONST[5] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(5)
      ) lshift_5_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_5_out)
      );
    end
    
  if(CONST[6] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(6)
      ) lshift_6_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_6_out)
      );
    end  
    
  if(CONST[7] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(7)
      ) lshift_7_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_7_out)
      );
    end
    
  if(CONST[8] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(8)
      ) lshift_8_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_8_out)
      );
    end 
    
  if(CONST[9] == 1'b1)
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(9)
      ) lshift_9_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_9_out)
      );
    end
    
  if(CONST[10] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(10)
      ) lshift_10_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_10_out)
      );
    end
    
  if(CONST[11] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(11)
      ) lshift_11_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_11_out)
      );
    end 
    
  if(CONST[12] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(12)
      ) lshift_12_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_12_out)
      );
    end

  if(CONST[13] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(13)
      ) lshift_13_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_13_out)
      );
    end 

  if(CONST[14] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(14)
      ) lshift_14_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_14_out)
      );
    end

  if(CONST[15] == 1'b1) 
    begin
      lshifter # (
        .DATA_WIDTH(16),
        .LSHIFT_AMOUNT(15)
      ) lshift_15_inst0 (
        .D_in(mux_0_out), 
        .D_out(lshift_15_out)
      );
    end
  
  // First-level of Adder
  if((CONST[0] == 1'b1) && (CONST[1] == 1'b1)) 
    begin
      ksa_top_32b ksa_top_32b_inst0 (
        .c0(1'b0), 
        .i_a(lshift_0_out), 
        .i_b(lshift_1_out), 
        .o_s(adder_0_out), 
        .o_carry()
      );
    end
  else if((CONST[0] == 1'b1) && (CONST[1] == 1'b0)) 
    begin
      assign adder_0_out = lshift_0_out;
    end
  else if((CONST[0] == 1'b0) && (CONST[1] == 1'b1)) 
    begin
      assign adder_0_out = lshift_1_out;
    end
  else
    begin
      //assign adder_0_out = 32'b0;
    end
  
  if((CONST[2] == 1'b1) && (CONST[3] == 1'b1)) 
    begin
      ksa_top_32b ksa_top_32b_inst1 (
        .c0(1'b0), 
        .i_a(lshift_2_out), 
        .i_b(lshift_3_out), 
        .o_s(adder_1_out), 
        .o_carry()
      );
    end 
  else if ((CONST[2] == 1'b1) && (CONST[3] == 1'b0)) 
    begin 
      assign adder_1_out = lshift_2_out;
    end
  else if((CONST[2] == 1'b0) && (CONST[3] == 1'b1)) 
    begin
      assign adder_1_out = lshift_3_out;
    end
  else
    begin
      //assign adder_1_out = 32'b0;
    end

  if((CONST[4] == 1'b1) && (CONST[5] == 1'b1)) 
    begin
      ksa_top_32b ksa_top_32b_inst2 (
        .c0(1'b0), 
        .i_a(lshift_4_out), 
        .i_b(lshift_5_out), 
        .o_s(adder_2_out), 
        .o_carry()
      );
    end
  else if((CONST[4] == 1'b1) && (CONST[5] == 1'b0)) 
    begin
      assign adder_2_out = lshift_4_out;
    end
  else if((CONST[4] == 1'b0) && (CONST[5] == 1'b1)) 
    begin
      assign adder_2_out = lshift_5_out;
    end
  else
    begin
      //assign adder_2_out = 32'b0;
    end

  if((CONST[6] == 1'b1) && (CONST[7] == 1'b1)) 
    begin
      ksa_top_32b ksa_top_32b_inst3 (
        .c0(1'b0), 
        .i_a(lshift_6_out), 
        .i_b(lshift_7_out), 
        .o_s(adder_3_out), 
        .o_carry()
      );
    end
  else if((CONST[6] == 1'b1) && (CONST[7] == 1'b0)) 
    begin 
      assign adder_3_out = lshift_6_out;
    end
  else if((CONST[6] == 1'b0) && (CONST[7] == 1'b1)) 
    begin
      assign adder_3_out = lshift_7_out;
    end
  else
    begin
      //assign adder_3_out = 32'b0;
    end

  if((CONST[8] == 1'b1) && (CONST[9] == 1'b1)) 
    begin
      ksa_top_32b ksa_top_32b_inst4 (
        .c0(1'b0), 
        .i_a(lshift_8_out), 
        .i_b(lshift_9_out), 
        .o_s(adder_4_out), 
        .o_carry()
      );
    end
  else if((CONST[8] == 1'b1) && (CONST[9] == 1'b0)) 
    begin
      assign adder_4_out = lshift_8_out;
    end
  else if((CONST[8] == 1'b0) && (CONST[9] == 1'b1)) 
    begin 
      assign adder_4_out = lshift_9_out;
    end
  else
    begin
      //assign adder_4_out = 32'b0;
    end

  if((CONST[10] == 1'b1) && (CONST[11] == 1'b1)) 
    begin 
      ksa_top_32b ksa_top_32b_inst5 (
        .c0(1'b0), 
        .i_a(lshift_10_out), 
        .i_b(lshift_11_out), 
        .o_s(adder_5_out), 
        .o_carry()
      );
    end
  else if((CONST[10] == 1'b1) && (CONST[11] == 1'b0)) 
    begin
      assign adder_5_out = lshift_10_out;
    end
  else if((CONST[10] == 1'b0) && (CONST[11] == 1'b1)) 
    begin
      assign adder_5_out = lshift_11_out;
    end
  else
    begin
      //assign adder_5_out = 32'b0;
    end

  if((CONST[12] == 1'b1) && (CONST[13] == 1'b1)) 
    begin
      ksa_top_32b ksa_top_32b_inst6 (
        .c0(1'b0), 
        .i_a(lshift_12_out), 
        .i_b(lshift_13_out), 
        .o_s(adder_6_out), 
        .o_carry()
      );
    end
  else if((CONST[12] == 1'b1) && (CONST[13] == 1'b0)) 
    begin
      assign adder_6_out = lshift_12_out;
    end
  else if((CONST[12] == 1'b0) && (CONST[13] == 1'b1)) 
    begin 
      assign adder_6_out = lshift_13_out;
    end
  else
    begin
      //assign adder_6_out = 32'b0;
    end

  if((CONST[14] == 1'b1) && (CONST[15] == 1)) 
    begin
      ksa_top_32b ksa_top_32b_inst7 (
        .c0(1'b0), 
        .i_a(lshift_14_out), 
        .i_b(lshift_15_out), 
        .o_s(adder_7_out), 
        .o_carry()
      );
    end
  else if((CONST[14] == 1'b1) && (CONST[15] == 1'b0)) 
    begin
      assign adder_7_out = lshift_14_out;
    end
  else if((CONST[14] == 1'b0) && (CONST[15] == 1'b1)) 
    begin
      assign adder_7_out = lshift_15_out;
    end
  else
    begin
      //assign adder_7_out = 32'b0;
    end


  // Second-level of Adder
  if(((CONST[0] == 1'b1) || (CONST[1] == 1'b1)) && ((CONST[2] == 1'b1) || (CONST[3] == 1'b1))) 
    begin
      ksa_top_32b ksa_top_32b_inst8 (
        .c0(1'b0), 
        .i_a(adder_0_out), 
        .i_b(adder_1_out), 
        .o_s(adder_8_out), 
        .o_carry()
      );
    end
  else if(((CONST[0] == 1'b1) || (CONST[1] == 1'b1)) && ((CONST[2] == 1'b0) && (CONST[3] == 1'b0))) 
    begin
      assign adder_8_out = adder_0_out;
    end
  else if(((CONST[0] == 1'b0) && (CONST[1] == 1'b0)) && ((CONST[2] == 1'b1) || (CONST[3] == 1'b1)))  
    begin
      assign adder_8_out = adder_1_out;
    end
  else
    begin
      //assign adder_8_out = 32'b0;
    end

  if(((CONST[4] == 1'b1) || (CONST[5] == 1'b1)) && ((CONST[6] == 1'b1) || (CONST[7] == 1'b1))) 
    begin 
      ksa_top_32b ksa_top_32b_inst9 (
        .c0(1'b0), 
        .i_a(adder_2_out), 
        .i_b(adder_3_out), 
        .o_s(adder_9_out), 
        .o_carry()
      );
    end
  else if(((CONST[4] == 1'b1) || (CONST[5] == 1'b1)) && ((CONST[6] == 1'b0) && (CONST[7] == 1'b0))) 
    begin
      assign adder_9_out = adder_2_out;
    end
  else if(((CONST[4] == 1'b0) && (CONST[5] == 1'b0)) && ((CONST[6] == 1'b1) || (CONST[7] == 1'b1)))  
    begin
      assign adder_9_out = adder_3_out;
    end
  else
    begin
      //assign adder_9_out = 32'b0;
    end

  if(((CONST[8] == 1'b1) || (CONST[9] == 1'b1)) && ((CONST[10] == 1'b1) || (CONST[11] == 1'b1))) 
    begin
      ksa_top_32b ksa_top_32b_inst10 (
        .c0(1'b0), 
        .i_a(adder_4_out), 
        .i_b(adder_5_out), 
        .o_s(adder_10_out), 
        .o_carry()
      );
    end
  else if(((CONST[8] == 1'b1) || (CONST[9] == 1'b1)) && ((CONST[10] == 1'b0) && (CONST[11] == 1'b0)))  
    begin
      assign adder_10_out = adder_4_out;
    end
  else if(((CONST[8] == 1'b0) && (CONST[9] == 1'b0)) && ((CONST[10] == 1'b1) || (CONST[11] == 1'b1))) 
    begin
      assign adder_10_out = adder_5_out;
    end
  else
    begin
      //assign adder_10_out = 32'b0;
    end

  if(((CONST[12] == 1'b1) || (CONST[13] == 1'b1)) && ((CONST[14] == 1'b1) || (CONST[15] == 1'b1))) 
    begin
      ksa_top_32b ksa_top_32b_inst11 (
        .c0(1'b0), 
        .i_a(adder_6_out), 
        .i_b(adder_7_out), 
        .o_s(adder_11_out), 
        .o_carry()
      );
    end
  else if(((CONST[12] == 1'b1) || (CONST[13] == 1'b1)) && ((CONST[14] == 1'b0) && (CONST[15] == 1'b0)))  
    begin
      assign adder_11_out = adder_6_out;
    end
  else if(((CONST[12] == 1'b0) && (CONST[13] == 1'b0)) && ((CONST[14] == 1'b1) || (CONST[15] == 1'b1))) 
    begin
      assign adder_11_out = adder_7_out;
    end
  else
    begin
      //assign adder_11_out = 32'b0;
    end

  // Third-level of Adder
  if(((CONST[0] == 1'b1) || (CONST[1] == 1'b1) || (CONST[2] == 1'b1) || (CONST[3] == 1'b1)) && ((CONST[4] == 1'b1) || (CONST[5] == 1'b1) || (CONST[6] == 1'b1) || (CONST[7] == 1'b1))) 
    begin 
      ksa_top_32b ksa_top_32b_inst12 (
        .c0(1'b0), 
        .i_a(adder_8_out), 
        .i_b(adder_9_out), 
        .o_s(adder_12_out), 
        .o_carry()
      );
    end
  else if(((CONST[0] == 1'b1) || (CONST[1] == 1'b1) || (CONST[2] == 1'b1) || (CONST[3] == 1'b1)) && ((CONST[4] == 1'b0) && (CONST[5] == 1'b0) && (CONST[6] == 1'b0) && (CONST[7] == 1'b0))) 
    begin
      assign adder_12_out = adder_8_out;
    end
  else if(((CONST[0] == 1'b0) && (CONST[1] == 1'b0) && (CONST[2] == 1'b0) && (CONST[3] == 1'b0)) && ((CONST[4] == 1'b1) || (CONST[5] == 1'b1) || (CONST[6] == 1'b1) || (CONST[7] == 1'b1))) 
    begin
      assign adder_12_out = adder_9_out;
    end
  else
    begin
      //assign adder_12_out = 32'b0;
    end

  if(((CONST[8] == 1'b1) || (CONST[9] == 1'b1) || (CONST[10] == 1'b1) || (CONST[11] == 1'b1)) && ((CONST[12] == 1'b1) || (CONST[13] == 1'b1) || (CONST[14] == 1'b1) || (CONST[15] == 1'b1))) 
    begin
      ksa_top_32b ksa_top_32b_inst13 (
        .c0(1'b0), 
        .i_a(adder_10_out), 
        .i_b(adder_11_out), 
        .o_s(adder_13_out), 
        .o_carry()
      );
    end
  else if(((CONST[8] == 1'b1) || (CONST[9] == 1'b1) || (CONST[10] == 1'b1) || (CONST[11] == 1'b1)) && ((CONST[12] == 1'b0) && (CONST[13] == 1'b0) && (CONST[14] == 1'b0) && (CONST[15] == 1'b0))) 
    begin
      assign adder_13_out = adder_10_out;
    end
  else if(((CONST[8] == 1'b0) && (CONST[9] == 1'b0) && (CONST[10] == 1'b0) && (CONST[11] == 1'b0)) && ((CONST[12] == 1'b1) || (CONST[13] == 1'b1) || (CONST[14] == 1'b1) || (CONST[15] == 1'b1))) 
    begin
      assign adder_13_out = adder_11_out;
    end
  else
    begin
      //assign adder_13_out = 32'b0;
    end

  // Fourth-level of Adder
  if(((CONST[0] == 1'b1) || (CONST[1] == 1'b1) || (CONST[2] == 1'b1) || (CONST[3] == 1'b1) || (CONST[4] == 1'b1) || (CONST[5] == 1'b1) || (CONST[6] == 1'b1) || (CONST[7] == 1'b1)) && ((CONST[8] == 1'b1) || (CONST[9] == 1'b1) || (CONST[10] == 1'b1) || (CONST[11] == 1'b1) || (CONST[12] == 1'b1) || (CONST[13] == 1'b1) || (CONST[14] == 1'b1) || (CONST[15] == 1'b1))) 
    begin
      ksa_top_32b ksa_top_32b_inst14 (
        .c0(1'b0), 
        .i_a(adder_12_out), 
        .i_b(adder_13_out), 
        .o_s(adder_14_out), 
        .o_carry()
      );
    end
  else if(((CONST[0] == 1'b1) || (CONST[1] == 1'b1) || (CONST[2] == 1'b1) || (CONST[3] == 1'b1) || (CONST[4] == 1'b1) || (CONST[5] == 1'b1) || (CONST[6] == 1'b1) || (CONST[7] == 1'b1)) && ((CONST[8] == 1'b0) && (CONST[9] == 1'b0) && (CONST[10] == 1'b0) || (CONST[11] == 1'b0) && (CONST[12] == 1'b0) && (CONST[13] == 1'b0) && (CONST[14] == 1'b0) && (CONST[15] == 1'b0))) 
    begin
      assign adder_14_out = adder_12_out;
    end
  else if(((CONST[0] == 1'b0) && (CONST[1] == 1'b0) && (CONST[2] == 1'b0) && (CONST[3] == 1'b0) && (CONST[4] == 1'b0) && (CONST[5] == 1'b0) && (CONST[6] == 1'b0) && (CONST[7] == 1'b0)) && ((CONST[8] == 1'b1) || (CONST[9] == 1'b1) || (CONST[10] == 1'b1) || (CONST[11] == 1'b1) || (CONST[12] == 1'b1) || (CONST[13] == 1'b1) || (CONST[14] == 1'b1) || (CONST[15] == 1'b1)))  
    begin
      assign adder_14_out = adder_13_out;
    end
  else
    begin
     assign adder_14_out = 32'b0;
    end
  endgenerate

  bit_adj_32b_to_16b bit_adj_32b_to_16b_inst0 (
    .Data_in(adder_14_out), 
    .Data_out(bit_adj_out)
  );
  
  sgninv_16b sgninv_16b_inst1 (
    .A16(bit_adj_out), 
    .R16(siginv_1_out)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(16)
  ) mux_2_to_1_inst1 (
    .D0(bit_adj_out),
    .D1(siginv_1_out),
    .S(D_in[15]),
    .Y(mux_1_out)
  ); 
endmodule
  