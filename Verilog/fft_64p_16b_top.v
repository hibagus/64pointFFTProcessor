module fft_64p_16b_top(
  In_Stream,
  Mode,
  Data_Start,
  clk,
  rst,
  next_data,
  Out_Stream,
  Data_Out
  );
  
  input  [31:0] In_Stream;
  input         Mode;
  input         Data_Start;
  input         clk;
  input         rst;
  output        next_data;
  output        Data_Out;
  output [31:0] Out_Stream;

  wire   [31:0] In_Stream;
  wire          Mode;
  wire          Data_Start;
  wire          clk;
  wire          rst;
  wire          next_data;
  wire          Data_Out;
  wire   [31:0] Out_Stream;
  
  wire   [31:0] input_circuit_data_0_out;
  wire   [31:0] input_circuit_data_1_out;
  wire   [31:0] input_circuit_data_2_out;
  wire   [31:0] input_circuit_data_3_out;
  wire   [31:0] input_circuit_data_4_out;
  wire   [31:0] input_circuit_data_5_out;
  wire   [31:0] input_circuit_data_6_out;
  wire   [31:0] input_circuit_data_7_out;
  wire          input_counter_mtrig_out;
  wire          input_counter_counter_idle;
  wire   [31:0] fft_8p_first_data_0_out;
  wire   [31:0] fft_8p_first_data_1_out;
  wire   [31:0] fft_8p_first_data_2_out;
  wire   [31:0] fft_8p_first_data_3_out;
  wire   [31:0] fft_8p_first_data_4_out;
  wire   [31:0] fft_8p_first_data_5_out;
  wire   [31:0] fft_8p_first_data_6_out;
  wire   [31:0] fft_8p_first_data_7_out;
  wire   [31:0] interdim_mult_data_0_out;
  wire   [31:0] interdim_mult_data_1_out;
  wire   [31:0] interdim_mult_data_2_out;
  wire   [31:0] interdim_mult_data_3_out;
  wire   [31:0] interdim_mult_data_4_out;
  wire   [31:0] interdim_mult_data_5_out;
  wire   [31:0] interdim_mult_data_6_out;
  wire   [31:0] interdim_mult_data_7_out;
  wire   [31:0] intermediate_circ_data_0_out;
  wire   [31:0] intermediate_circ_data_1_out;
  wire   [31:0] intermediate_circ_data_2_out;
  wire   [31:0] intermediate_circ_data_3_out;
  wire   [31:0] intermediate_circ_data_4_out;
  wire   [31:0] intermediate_circ_data_5_out;
  wire   [31:0] intermediate_circ_data_6_out;
  wire   [31:0] intermediate_circ_data_7_out;
  wire   [31:0] cb_circuit_data_0_out;
  wire   [31:0] cb_circuit_data_1_out;
  wire   [31:0] cb_circuit_data_2_out;
  wire   [31:0] cb_circuit_data_3_out;
  wire   [31:0] cb_circuit_data_4_out;
  wire   [31:0] cb_circuit_data_5_out;
  wire   [31:0] cb_circuit_data_6_out;
  wire   [31:0] cb_circuit_data_7_out;
  wire   [31:0] fft_8p_second_data_0_out;
  wire   [31:0] fft_8p_second_data_1_out;
  wire   [31:0] fft_8p_second_data_2_out;
  wire   [31:0] fft_8p_second_data_3_out;
  wire   [31:0] fft_8p_second_data_4_out;
  wire   [31:0] fft_8p_second_data_5_out;
  wire   [31:0] fft_8p_second_data_6_out;
  wire   [31:0] fft_8p_second_data_7_out;
  wire   [31:0] output_circuit_data_out;
  wire          output_counter_data_val;
  wire          master_out_hold_all_in;
  wire          master_out_hold_buf_2;
  wire          master_out_hold_buf_1;
  wire          master_out_hold_buf_0;
  wire          master_out_in_ctrl_buf_2;
  wire          master_out_in_ctrl_buf_1;
  wire          master_out_in_ctrl_buf_0;
  wire          master_out_pos_hold_ctrl;
  wire    [2:0] master_out_Shuf_Ctrl_0;
  wire    [2:0] master_out_Shuf_Ctrl_1;
  wire    [2:0] master_out_Shuf_Ctrl_2;
  wire    [2:0] master_out_Shuf_Ctrl_3;
  wire    [2:0] master_out_Shuf_Ctrl_4;
  wire    [2:0] master_out_Shuf_Ctrl_5;
  wire    [2:0] master_out_Shuf_Ctrl_6;
  wire    [2:0] master_out_Shuf_Ctrl_7;
  wire    [2:0] master_out_Type_Sel_0;
  wire    [2:0] master_out_Type_Sel_1;
  wire    [2:0] master_out_Type_Sel_2;
  wire    [2:0] master_out_Type_Sel_3;
  wire    [2:0] master_out_Type_Sel_4;
  wire    [2:0] master_out_Type_Sel_5;
  wire    [2:0] master_out_Type_Sel_6;
  wire    [2:0] master_out_Type_Sel_7;
  wire    [2:0] master_out_Bypass_Sel_0;
  wire    [2:0] master_out_Bypass_Sel_1;
  wire    [2:0] master_out_Bypass_Sel_2;
  wire    [2:0] master_out_Bypass_Sel_3;
  wire    [2:0] master_out_Bypass_Sel_4;
  wire    [2:0] master_out_Bypass_Sel_5;
  wire    [2:0] master_out_Bypass_Sel_6;
  wire    [2:0] master_out_Bypass_Sel_7;
  wire    [2:0] master_out_DeShuf_Ctrl_0;
  wire    [2:0] master_out_DeShuf_Ctrl_1;
  wire    [2:0] master_out_DeShuf_Ctrl_2;
  wire    [2:0] master_out_DeShuf_Ctrl_3;
  wire    [2:0] master_out_DeShuf_Ctrl_4;
  wire    [2:0] master_out_DeShuf_Ctrl_5;
  wire    [2:0] master_out_DeShuf_Ctrl_6;
  wire    [2:0] master_out_DeShuf_Ctrl_7;
  wire          master_out_Bypass_EN_0;
  wire          master_out_Bypass_EN_1;
  wire          master_out_Bypass_EN_2;
  wire          master_out_Bypass_EN_3;
  wire          master_out_Bypass_EN_4;
  wire          master_out_Bypass_EN_5;
  wire          master_out_Bypass_EN_6;
  wire          master_out_Bypass_EN_7;
  wire          master_out_Hold_Ctrl_0;
  wire          master_out_Hold_Ctrl_1;
  wire          master_out_Hold_Ctrl_2;
  wire          master_out_Hold_Ctrl_3;
  wire          master_out_Hold_Ctrl_4;
  wire          master_out_Hold_Ctrl_5;
  wire          master_out_Hold_Ctrl_6;
  wire          master_out_Hold_Ctrl_7;
  wire          master_out_DFF_Ctrl_0;
  wire          master_out_DFF_Ctrl_1;
  wire          master_out_DFF_Ctrl_2;
  wire          master_out_DFF_Ctrl_3;
  wire          master_out_DFF_Ctrl_4;
  wire          master_out_DFF_Ctrl_5;
  wire          master_out_DFF_Ctrl_6;
  wire          master_out_DFF_Ctrl_7;
  wire          master_out_hold_seg_0;
  wire          master_out_hold_seg_1;
  wire          master_out_hold_seg_2;
  wire          master_out_hold_seg_3;
  wire          master_out_hold_seg_4;
  wire          master_out_hold_seg_5;
  wire          master_out_hold_seg_6;
  wire          master_out_hold_seg_7;
  wire          master_out_in_ctrl_all_cb;
  wire          master_out_next_data;
  wire          master_out_counter_en;
  wire          outputcounter_out_hold_all_out;
  wire          outputcounter_out_in_ctrl_all_out;
  
  assign Out_Stream = output_circuit_data_out;
  assign Data_Out   = output_counter_data_val;
  assign next_data  = master_out_next_data & input_counter_counter_idle;
  
  input_circuit input_unit(
  .D(In_Stream),
  .clk(clk),
  .hold_all_seg(master_out_hold_all_in),
  .hold_buf_0(master_out_hold_buf_0),
  .hold_buf_1(master_out_hold_buf_1),
  .hold_buf_2(master_out_hold_buf_2),
  .in_ctrl_buf_0(master_out_in_ctrl_buf_0),
  .in_ctrl_buf_1(master_out_in_ctrl_buf_1),
  .in_ctrl_buf_2(master_out_in_ctrl_buf_2),
  .pos_hold_ctrl(master_out_pos_hold_ctrl),
  .mode(Mode),
  .rst(rst),
  .Q0(input_circuit_data_0_out),
  .Q1(input_circuit_data_1_out),
  .Q2(input_circuit_data_2_out),
  .Q3(input_circuit_data_3_out),
  .Q4(input_circuit_data_4_out),
  .Q5(input_circuit_data_5_out),
  .Q6(input_circuit_data_6_out),
  .Q7(input_circuit_data_7_out)
  );
  
  input_counter in_count(
  .clk(clk), 
  .rst(rst), 
  .datastart(Data_Start), 
  .counter_idle(input_counter_counter_idle),
  .mastertrig(input_counter_mtrig_out)
  );
  
  fft_8p_16b_top fft_8p_firststage(
  .xt0(input_circuit_data_0_out),
  .xt1(input_circuit_data_1_out),
  .xt2(input_circuit_data_2_out), 
  .xt3(input_circuit_data_3_out), 
  .xt4(input_circuit_data_4_out), 
  .xt5(input_circuit_data_5_out), 
  .xt6(input_circuit_data_6_out), 
  .xt7(input_circuit_data_7_out),
  .xf0(fft_8p_first_data_0_out), 
  .xf1(fft_8p_first_data_1_out), 
  .xf2(fft_8p_first_data_2_out), 
  .xf3(fft_8p_first_data_3_out), 
  .xf4(fft_8p_first_data_4_out), 
  .xf5(fft_8p_first_data_5_out), 
  .xf6(fft_8p_first_data_6_out), 
  .xf7(fft_8p_first_data_7_out)
  );

  intermediate_circuit intermediate_circ(
  .clk(clk), 
  .rst(rst), 
  .hold(master_out_hold_all_in),
  .SET_0_IN(fft_8p_first_data_0_out), 
  .SET_1_IN(fft_8p_first_data_1_out), 
  .SET_2_IN(fft_8p_first_data_2_out), 
  .SET_3_IN(fft_8p_first_data_3_out), 
  .SET_4_IN(fft_8p_first_data_4_out), 
  .SET_5_IN(fft_8p_first_data_5_out), 
  .SET_6_IN(fft_8p_first_data_6_out), 
  .SET_7_IN(fft_8p_first_data_7_out), 
  .SET_0_OUT(intermediate_circ_data_0_out),
  .SET_1_OUT(intermediate_circ_data_1_out),
  .SET_2_OUT(intermediate_circ_data_2_out),
  .SET_3_OUT(intermediate_circ_data_3_out),
  .SET_4_OUT(intermediate_circ_data_4_out),
  .SET_5_OUT(intermediate_circ_data_5_out),
  .SET_6_OUT(intermediate_circ_data_6_out),
  .SET_7_OUT(intermediate_circ_data_7_out)
  );
  
  interdimensional_multiplier interdim_mult(
  .clk(clk), 
  .rst(rst), 
  .SET_0_IN(intermediate_circ_data_0_out), 
  .SET_1_IN(intermediate_circ_data_1_out), 
  .SET_2_IN(intermediate_circ_data_2_out), 
  .SET_3_IN(intermediate_circ_data_3_out), 
  .SET_4_IN(intermediate_circ_data_4_out), 
  .SET_5_IN(intermediate_circ_data_5_out), 
  .SET_6_IN(intermediate_circ_data_6_out), 
  .SET_7_IN(intermediate_circ_data_7_out), 
  .Shuf_Ctrl_0(master_out_Shuf_Ctrl_0), 
  .Shuf_Ctrl_1(master_out_Shuf_Ctrl_1), 
  .Shuf_Ctrl_2(master_out_Shuf_Ctrl_2), 
  .Shuf_Ctrl_3(master_out_Shuf_Ctrl_3), 
  .Shuf_Ctrl_4(master_out_Shuf_Ctrl_4), 
  .Shuf_Ctrl_5(master_out_Shuf_Ctrl_5), 
  .Shuf_Ctrl_6(master_out_Shuf_Ctrl_6), 
  .Shuf_Ctrl_7(master_out_Shuf_Ctrl_7), 
  .Type_Sel_0(master_out_Type_Sel_0), 
  .Type_Sel_1(master_out_Type_Sel_1), 
  .Type_Sel_2(master_out_Type_Sel_2), 
  .Type_Sel_3(master_out_Type_Sel_3), 
  .Type_Sel_4(master_out_Type_Sel_4), 
  .Type_Sel_5(master_out_Type_Sel_5), 
  .Type_Sel_6(master_out_Type_Sel_6), 
  .Type_Sel_7(master_out_Type_Sel_7), 
  .Bypass_Sel_0(master_out_Bypass_Sel_0), 
  .Bypass_Sel_1(master_out_Bypass_Sel_1), 
  .Bypass_Sel_2(master_out_Bypass_Sel_2), 
  .Bypass_Sel_3(master_out_Bypass_Sel_3), 
  .Bypass_Sel_4(master_out_Bypass_Sel_4), 
  .Bypass_Sel_5(master_out_Bypass_Sel_5), 
  .Bypass_Sel_6(master_out_Bypass_Sel_6), 
  .Bypass_Sel_7(master_out_Bypass_Sel_7), 
  .DeShuf_Ctrl_0(master_out_DeShuf_Ctrl_0), 
  .DeShuf_Ctrl_1(master_out_DeShuf_Ctrl_1), 
  .DeShuf_Ctrl_2(master_out_DeShuf_Ctrl_2), 
  .DeShuf_Ctrl_3(master_out_DeShuf_Ctrl_3), 
  .DeShuf_Ctrl_4(master_out_DeShuf_Ctrl_4), 
  .DeShuf_Ctrl_5(master_out_DeShuf_Ctrl_5), 
  .DeShuf_Ctrl_6(master_out_DeShuf_Ctrl_6), 
  .DeShuf_Ctrl_7(master_out_DeShuf_Ctrl_7), 
  .Bypass_EN_0(master_out_Bypass_EN_0), 
  .Bypass_EN_1(master_out_Bypass_EN_1), 
  .Bypass_EN_2(master_out_Bypass_EN_2), 
  .Bypass_EN_3(master_out_Bypass_EN_3), 
  .Bypass_EN_4(master_out_Bypass_EN_4), 
  .Bypass_EN_5(master_out_Bypass_EN_5), 
  .Bypass_EN_6(master_out_Bypass_EN_6), 
  .Bypass_EN_7(master_out_Bypass_EN_7), 
  .Hold_Ctrl_0(master_out_Hold_Ctrl_0), 
  .Hold_Ctrl_1(master_out_Hold_Ctrl_1), 
  .Hold_Ctrl_2(master_out_Hold_Ctrl_2), 
  .Hold_Ctrl_3(master_out_Hold_Ctrl_3), 
  .Hold_Ctrl_4(master_out_Hold_Ctrl_4), 
  .Hold_Ctrl_5(master_out_Hold_Ctrl_5), 
  .Hold_Ctrl_6(master_out_Hold_Ctrl_6), 
  .Hold_Ctrl_7(master_out_Hold_Ctrl_7), 
  .DFF_Ctrl_0(master_out_DFF_Ctrl_0), 
  .DFF_Ctrl_1(master_out_DFF_Ctrl_1), 
  .DFF_Ctrl_2(master_out_DFF_Ctrl_2), 
  .DFF_Ctrl_3(master_out_DFF_Ctrl_3), 
  .DFF_Ctrl_4(master_out_DFF_Ctrl_4),
  .DFF_Ctrl_5(master_out_DFF_Ctrl_5), 
  .DFF_Ctrl_6(master_out_DFF_Ctrl_6), 
  .DFF_Ctrl_7(master_out_DFF_Ctrl_7), 
  .SET_0_OUT(interdim_mult_data_0_out),
  .SET_1_OUT(interdim_mult_data_1_out),
  .SET_2_OUT(interdim_mult_data_2_out),
  .SET_3_OUT(interdim_mult_data_3_out),
  .SET_4_OUT(interdim_mult_data_4_out),
  .SET_5_OUT(interdim_mult_data_5_out),
  .SET_6_OUT(interdim_mult_data_6_out),
  .SET_7_OUT(interdim_mult_data_7_out)
  );
  
  
  cb_circuit cb_unit(
  .D0(interdim_mult_data_0_out),
  .D1(interdim_mult_data_1_out),
  .D2(interdim_mult_data_2_out),
  .D3(interdim_mult_data_3_out),
  .D4(interdim_mult_data_4_out),
  .D5(interdim_mult_data_5_out),
  .D6(interdim_mult_data_6_out),
  .D7(interdim_mult_data_7_out),
  .clk(clk),
  .hold_seg_0(master_out_hold_seg_0),
  .hold_seg_1(master_out_hold_seg_1),
  .hold_seg_2(master_out_hold_seg_2),
  .hold_seg_3(master_out_hold_seg_3),
  .hold_seg_4(master_out_hold_seg_4),
  .hold_seg_5(master_out_hold_seg_5),
  .hold_seg_6(master_out_hold_seg_6),
  .hold_seg_7(master_out_hold_seg_7),
  .in_ctrl_all_seg(master_out_in_ctrl_all_cb),
  .rst(rst),
  .Q0(cb_circuit_data_0_out),
  .Q1(cb_circuit_data_1_out),
  .Q2(cb_circuit_data_2_out),
  .Q3(cb_circuit_data_3_out),
  .Q4(cb_circuit_data_4_out),
  .Q5(cb_circuit_data_5_out),
  .Q6(cb_circuit_data_6_out),
  .Q7(cb_circuit_data_7_out)
  );
  
  
  fft_8p_16b_top fft_8p_secondstage(
  .xt0(cb_circuit_data_0_out),
  .xt1(cb_circuit_data_1_out),
  .xt2(cb_circuit_data_2_out),
  .xt3(cb_circuit_data_3_out),
  .xt4(cb_circuit_data_4_out),
  .xt5(cb_circuit_data_5_out),
  .xt6(cb_circuit_data_6_out),
  .xt7(cb_circuit_data_7_out),
  .xf0(fft_8p_second_data_0_out),
  .xf1(fft_8p_second_data_1_out),
  .xf2(fft_8p_second_data_2_out),
  .xf3(fft_8p_second_data_3_out),
  .xf4(fft_8p_second_data_4_out),
  .xf5(fft_8p_second_data_5_out),
  .xf6(fft_8p_second_data_6_out),
  .xf7(fft_8p_second_data_7_out)
  );
  
  
  output_circuit output_block(
  .D0(fft_8p_second_data_0_out),
  .D1(fft_8p_second_data_1_out),
  .D2(fft_8p_second_data_2_out),
  .D3(fft_8p_second_data_3_out),
  .D4(fft_8p_second_data_4_out),
  .D5(fft_8p_second_data_5_out),
  .D6(fft_8p_second_data_6_out),
  .D7(fft_8p_second_data_7_out),
  .clk(clk),
  .hold_all_seg(outputcounter_out_hold_all_out),
  .in_ctrl_all_seg(outputcounter_out_in_ctrl_all_out),
  .mode(Mode),
  .rst(rst),
  .Q(output_circuit_data_out)
   );
  
  output_counter out_count(
  .clk(clk),
  .rst(rst),
  .dataind(master_out_counter_en),
  .datavalid(output_counter_data_val),
  .in_ctrl_all_out(outputcounter_out_in_ctrl_all_out),
  .hold_all_out(outputcounter_out_hold_all_out)
  );
  
  master_control master_ctrl(
  .clk(clk),
  .rst(rst),
  .mastertrig(input_counter_mtrig_out),
  .hold_all_in(master_out_hold_all_in),
  .hold_buf_2(master_out_hold_buf_2),
  .hold_buf_1(master_out_hold_buf_1),
  .hold_buf_0(master_out_hold_buf_0),
  .in_ctrl_buf_2(master_out_in_ctrl_buf_2),
  .in_ctrl_buf_1(master_out_in_ctrl_buf_1),
  .in_ctrl_buf_0(master_out_in_ctrl_buf_0),
  .pos_hold_ctrl(master_out_pos_hold_ctrl),
  .Shuf_Ctrl_0(master_out_Shuf_Ctrl_0),
  .Shuf_Ctrl_1(master_out_Shuf_Ctrl_1),
  .Shuf_Ctrl_2(master_out_Shuf_Ctrl_2),
  .Shuf_Ctrl_3(master_out_Shuf_Ctrl_3),
  .Shuf_Ctrl_4(master_out_Shuf_Ctrl_4),
  .Shuf_Ctrl_5(master_out_Shuf_Ctrl_5),
  .Shuf_Ctrl_6(master_out_Shuf_Ctrl_6),
  .Shuf_Ctrl_7(master_out_Shuf_Ctrl_7),
  .Type_Sel_0(master_out_Type_Sel_0),
  .Type_Sel_1(master_out_Type_Sel_1),
  .Type_Sel_2(master_out_Type_Sel_2),
  .Type_Sel_3(master_out_Type_Sel_3),
  .Type_Sel_4(master_out_Type_Sel_4),
  .Type_Sel_5(master_out_Type_Sel_5),
  .Type_Sel_6(master_out_Type_Sel_6),
  .Type_Sel_7(master_out_Type_Sel_7),
  .Bypass_Sel_0(master_out_Bypass_Sel_0),
  .Bypass_Sel_1(master_out_Bypass_Sel_1),
  .Bypass_Sel_2(master_out_Bypass_Sel_2),
  .Bypass_Sel_3(master_out_Bypass_Sel_3),
  .Bypass_Sel_4(master_out_Bypass_Sel_4),
  .Bypass_Sel_5(master_out_Bypass_Sel_5),
  .Bypass_Sel_6(master_out_Bypass_Sel_6),
  .Bypass_Sel_7(master_out_Bypass_Sel_7),
  .DeShuf_Ctrl_0(master_out_DeShuf_Ctrl_0),
  .DeShuf_Ctrl_1(master_out_DeShuf_Ctrl_1),
  .DeShuf_Ctrl_2(master_out_DeShuf_Ctrl_2),
  .DeShuf_Ctrl_3(master_out_DeShuf_Ctrl_3),
  .DeShuf_Ctrl_4(master_out_DeShuf_Ctrl_4),
  .DeShuf_Ctrl_5(master_out_DeShuf_Ctrl_5),
  .DeShuf_Ctrl_6(master_out_DeShuf_Ctrl_6),
  .DeShuf_Ctrl_7(master_out_DeShuf_Ctrl_7),
  .Bypass_EN_0(master_out_Bypass_EN_0),
  .Bypass_EN_1(master_out_Bypass_EN_1),
  .Bypass_EN_2(master_out_Bypass_EN_2),
  .Bypass_EN_3(master_out_Bypass_EN_3),
  .Bypass_EN_4(master_out_Bypass_EN_4),
  .Bypass_EN_5(master_out_Bypass_EN_5),
  .Bypass_EN_6(master_out_Bypass_EN_6),
  .Bypass_EN_7(master_out_Bypass_EN_7),
  .Hold_Ctrl_0(master_out_Hold_Ctrl_0),
  .Hold_Ctrl_1(master_out_Hold_Ctrl_1),
  .Hold_Ctrl_2(master_out_Hold_Ctrl_2),
  .Hold_Ctrl_3(master_out_Hold_Ctrl_3),
  .Hold_Ctrl_4(master_out_Hold_Ctrl_4),
  .Hold_Ctrl_5(master_out_Hold_Ctrl_5),
  .Hold_Ctrl_6(master_out_Hold_Ctrl_6),
  .Hold_Ctrl_7(master_out_Hold_Ctrl_7),
  .DFF_Ctrl_0(master_out_DFF_Ctrl_0),
  .DFF_Ctrl_1(master_out_DFF_Ctrl_1),
  .DFF_Ctrl_2(master_out_DFF_Ctrl_2),
  .DFF_Ctrl_3(master_out_DFF_Ctrl_3),
  .DFF_Ctrl_4(master_out_DFF_Ctrl_4),
  .DFF_Ctrl_5(master_out_DFF_Ctrl_5),
  .DFF_Ctrl_6(master_out_DFF_Ctrl_6),
  .DFF_Ctrl_7(master_out_DFF_Ctrl_7),
  .hold_seg_0(master_out_hold_seg_0),
  .hold_seg_1(master_out_hold_seg_1),
  .hold_seg_2(master_out_hold_seg_2),
  .hold_seg_3(master_out_hold_seg_3),
  .hold_seg_4(master_out_hold_seg_4),
  .hold_seg_5(master_out_hold_seg_5),
  .hold_seg_6(master_out_hold_seg_6),
  .hold_seg_7(master_out_hold_seg_7),
  .in_ctrl_all_cb(master_out_in_ctrl_all_cb),
  .next_data(master_out_next_data),
  .counter_en(master_out_counter_en) 
  );
  
endmodule
