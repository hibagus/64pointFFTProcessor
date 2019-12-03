module input_circuit(
  D,
  clk,
  hold_all_seg,
  hold_buf_1,
  hold_buf_2,
  hold_buf_3,
  in_ctrl_buf_1,
  in_ctrl_buf_2,
  in_ctrl_buf_3,
  pos_hold_ctrl,
  mode,
  rst,
  Q0,
  Q1,
  Q2,
  Q3,
  Q4,
  Q5,
  Q6,
  Q7
  );
  
  // Block Parameter 
  input [31:0] D;
  input clk, hold_all_seg, hold_buf_1, hold_buf_2, hold_buf_3, in_ctrl_buf_1, in_ctrl_buf_2, in_ctrl_buf_3, pos_hold_ctrl, mode, rst;
  output [31:0] Q0;
  output [31:0] Q1;
  output [31:0] Q2;
  output [31:0] Q3;
  output [31:0] Q4;
  output [31:0] Q5;
  output [31:0] Q6;
  output [31:0] Q7;

  wire [31:0] swap_out;
  wire [31:0] buf_1_out;
  wire [31:0] buf_2_out;
  wire [31:0] buf_3_out;
  wire [31:0] mux_out;
  wire [31:0] segment_0_out;
  wire [31:0] segment_1_out;
  wire [31:0] segment_2_out;
  wire [31:0] segment_3_out;
  wire [31:0] segment_4_out;
  wire [31:0] segment_5_out;
  wire [31:0] segment_6_out;
  wire [31:0] segment_7_out;
  wire [31:0] lead_buf_out;


  assign Q0 = segment_0_out;
  assign Q1 = segment_1_out;
  assign Q2 = segment_2_out;
  assign Q3 = segment_3_out;
  assign Q4 = segment_4_out;
  assign Q5 = segment_5_out;
  assign Q6 = segment_6_out;
  assign Q7 = segment_7_out;
  assign segment_7_out = lead_buf_out;

  real_imaginary_interchange swap (.A32(D), .Swap(mode), .R32(swap_out));
  dff_inputsel_hold_sync_high_reset #(32) buf_3(.clk(clk), .rst(rst), .hold(hold_buf_3), .sel(in_ctrl_buf_3), .D0(32'b0), .D1(swap_out), .Q(buf_3_out));
  dff_inputsel_hold_sync_high_reset #(32) buf_2(.clk(clk), .rst(rst), .hold(hold_buf_2), .sel(in_ctrl_buf_2), .D0(buf_3_out), .D1(swap_out), .Q(buf_2_out));
  dff_inputsel_hold_sync_high_reset #(32) buf_1(.clk(clk), .rst(rst), .hold(hold_buf_1), .sel(in_ctrl_buf_1), .D0(buf_2_out), .D1(swap_out), .Q(buf_1_out));
  mux_2_to_1 #(32) mux0 (.D0(swap_out), .D1(buf_1_out) , .S(pos_hold_ctrl), .Y(mux_out));
  dff_hold_sync_high_reset #(32) lead_buf(.clk(clk), .rst(rst), .hold(hold_all_seg), .D(mux_out), .Q(lead_buf_out));
  dff_segment_for_input #(32) segment_6(.clk(clk), .rst(rst), .hold(hold_all_seg), .D(lead_buf_out), .Q(segment_6_out));
  dff_segment_for_input #(32) segment_5(.clk(clk), .rst(rst), .hold(hold_all_seg), .D(segment_6_out), .Q(segment_5_out));
  dff_segment_for_input #(32) segment_4(.clk(clk), .rst(rst), .hold(hold_all_seg), .D(segment_5_out), .Q(segment_4_out));
  dff_segment_for_input #(32) segment_3(.clk(clk), .rst(rst), .hold(hold_all_seg), .D(segment_4_out), .Q(segment_3_out));
  dff_segment_for_input #(32) segment_2(.clk(clk), .rst(rst), .hold(hold_all_seg), .D(segment_3_out), .Q(segment_2_out));
  dff_segment_for_input #(32) segment_1(.clk(clk), .rst(rst), .hold(hold_all_seg), .D(segment_2_out), .Q(segment_1_out));
  dff_segment_for_input #(32) segment_0(.clk(clk), .rst(rst), .hold(hold_all_seg), .D(segment_1_out), .Q(segment_0_out));


endmodule
