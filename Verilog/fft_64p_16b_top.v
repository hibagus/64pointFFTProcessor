module complex_subst_ksa_32b(
In_Stream,
Mode,
Data_Start,
clk,
rst,
Out_Stream,
Data_Out);

input [31:0] In_Stream;
input Mode;
input Data_Start,clk,rst;
output Data_Out;
output [31:0] Out_Stream;

wire [31:0] input_circuit_data_0_out;
wire [31:0] input_circuit_data_1_out;
wire [31:0] input_circuit_data_2_out;
wire [31:0] input_circuit_data_3_out;
wire [31:0] input_circuit_data_4_out;
wire [31:0] input_circuit_data_5_out;
wire [31:0] input_circuit_data_6_out;
wire [31:0] input_circuit_data_7_out;
wire input_counter_mtrig_out;
wire [31:0] fft_8p_first_data_0_out;
wire [31:0] fft_8p_first_data_1_out;
wire [31:0] fft_8p_first_data_2_out;
wire [31:0] fft_8p_first_data_3_out;
wire [31:0] fft_8p_first_data_4_out;
wire [31:0] fft_8p_first_data_5_out;
wire [31:0] fft_8p_first_data_6_out;
wire [31:0] fft_8p_first_data_7_out;
wire [31:0] interdim_mult_data_0_out;
wire [31:0] interdim_mult_data_1_out;
wire [31:0] interdim_mult_data_2_out;
wire [31:0] interdim_mult_data_3_out;
wire [31:0] interdim_mult_data_4_out;
wire [31:0] interdim_mult_data_5_out;
wire [31:0] interdim_mult_data_6_out;
wire [31:0] interdim_mult_data_7_out;
wire [31:0] cb_circuit_data_0_out;
wire [31:0] cb_circuit_data_1_out;
wire [31:0] cb_circuit_data_2_out;
wire [31:0] cb_circuit_data_3_out;
wire [31:0] cb_circuit_data_4_out;
wire [31:0] cb_circuit_data_5_out;
wire [31:0] cb_circuit_data_6_out;
wire [31:0] cb_circuit_data_7_out;
wire [31:0] fft_8p_second_data_0_out;
wire [31:0] fft_8p_second_data_1_out;
wire [31:0] fft_8p_second_data_2_out;
wire [31:0] fft_8p_second_data_3_out;
wire [31:0] fft_8p_second_data_4_out;
wire [31:0] fft_8p_second_data_5_out;
wire [31:0] fft_8p_second_data_6_out;
wire [31:0] fft_8p_second_data_7_out;
wire [31:0] output_circuit_data_out;
wire output_counter_data_val;
wire master_out_hold_all_in;
wire master_out_hold_buf_3;
wire master_out_hold_buf_2;
wire master_out_hold_buf_1;
wire master_out_in_ctrl_buf_3;
wire master_out_in_ctrl_buf_2;
wire master_out_in_ctrl_buf_1;
wire master_out_pos_hold_ctrl;
wire [2:0] master_out_Shuf_Ctrl_1;
wire [2:0] master_out_Shuf_Ctrl_2;
wire [2:0] master_out_Shuf_Ctrl_3;
wire [2:0] master_out_Shuf_Ctrl_4;
wire [2:0] master_out_Shuf_Ctrl_5;
wire [2:0] master_out_Shuf_Ctrl_6;
wire [2:0] master_out_Shuf_Ctrl_7;
wire [2:0] master_out_Shuf_Ctrl_8;
wire [2:0] master_out_Type_Sel_1;
wire [2:0] master_out_Type_Sel_2;
wire [2:0] master_out_Type_Sel_3;
wire [2:0] master_out_Type_Sel_4;
wire [2:0] master_out_Type_Sel_5;
wire [2:0] master_out_Type_Sel_6;
wire [2:0] master_out_Type_Sel_7;
wire [2:0] master_out_Type_Sel_8;
wire [2:0] master_out_Bypass_Sel_0;
wire [2:0] master_out_Bypass_Sel_1;
wire [2:0] master_out_Bypass_Sel_2;
wire [2:0] master_out_Bypass_Sel_3;
wire [2:0] master_out_Bypass_Sel_4;
wire [2:0] master_out_Bypass_Sel_5;
wire [2:0] master_out_Bypass_Sel_6;
wire [2:0] master_out_Bypass_Sel_7;
wire [2:0] master_out_DeShuf_Ctrl_0;
wire [2:0] master_out_DeShuf_Ctrl_1;
wire [2:0] master_out_DeShuf_Ctrl_2;
wire [2:0] master_out_DeShuf_Ctrl_3;
wire [2:0] master_out_DeShuf_Ctrl_4;
wire [2:0] master_out_DeShuf_Ctrl_5;
wire [2:0] master_out_DeShuf_Ctrl_6;
wire [2:0] master_out_DeShuf_Ctrl_7;
wire  master_out_Bypass_EN_0;
wire  master_out_Bypass_EN_1;
wire  master_out_Bypass_EN_2;
wire  master_out_Bypass_EN_3;
wire  master_out_Bypass_EN_4;
wire  master_out_Bypass_EN_5;
wire  master_out_Bypass_EN_6;
wire  master_out_Bypass_EN_7;
wire  master_out_Hold_Ctrl_0;
wire  master_out_Hold_Ctrl_1;
wire  master_out_Hold_Ctrl_2;
wire  master_out_Hold_Ctrl_3;
wire  master_out_Hold_Ctrl_4;
wire  master_out_Hold_Ctrl_5;
wire  master_out_Hold_Ctrl_6;
wire  master_out_Hold_Ctrl_7;
wire  master_out_DFF_Ctrl_0;
wire  master_out_DFF_Ctrl_1;
wire  master_out_DFF_Ctrl_2;
wire  master_out_DFF_Ctrl_3;
wire  master_out_DFF_Ctrl_4;
wire  master_out_DFF_Ctrl_5;
wire  master_out_DFF_Ctrl_6;
wire  master_out_DFF_Ctrl_7;
wire  master_out_hold_seg_0;
wire  master_out_hold_seg_1;
wire  master_out_hold_seg_2;
wire  master_out_hold_seg_3;
wire  master_out_hold_seg_4;
wire  master_out_hold_seg_5;
wire  master_out_hold_seg_6;
wire  master_out_hold_seg_7;
wire  master_out_in_ctrl_all_cb;
wire  master_out_hold_all_out;
wire  master_out_in_ctrl_all_out;
wire  master_out_counter_en;


assign Out_Stream = output_circuit_data_out;
assign Data_Out = output_counter_data_val;

input_circuit input_unit(.D(In_Stream),.clk(clk),.hold_all_seg(master_out_hold_all_in),.hold_buf_1(master_out_hold_buf_1),.hold_buf_2(master_out_hold_buf_2),.hold_buf_3(master_out_hold_buf_3),.in_ctrl_buf_1(master_out_in_ctrl_buf_1),.in_ctrl_buf_2(master_out_in_ctrl_buf_2),.in_ctrl_buf_3(master_out_in_ctrl_buf_3),.pos_hold_ctrl(master_out_pos_hold_ctrl),.mode(Mode),.rst(rst),.Q0(input_circuit_data_0_out),.Q1(input_circuit_data_1_out),.Q2(input_circuit_data_2_out),.Q3(input_circuit_data_3_out),.Q4(input_circuit_data_4_out),.Q5(input_circuit_data_5_out),.Q6(input_circuit_data_6_out),.Q7(input_circuit_data_7_out));

input_counter in_count(.clk(clk), .rst(rst), .datastart(Data_start), .mastertrig(input_counter_mtrig_out));

endmodule
