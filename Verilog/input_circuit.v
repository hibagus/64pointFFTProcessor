module input_circuit(
  clk,
  rst,
  mode,
  hold_all_seg,
  hold_buf_0,
  hold_buf_1,
  hold_buf_2,
  in_ctrl_buf_0,
  in_ctrl_buf_1,
  in_ctrl_buf_2,
  pos_hold_ctrl,
  D,
  Q0,
  Q1,
  Q2,
  Q3,
  Q4,
  Q5,
  Q6,
  Q7
  );
   
  input         clk; 
  input         rst;
  input         mode;
  input         hold_all_seg; 
  input         hold_buf_0; 
  input         hold_buf_1; 
  input         hold_buf_2; 
  input         in_ctrl_buf_0; 
  input         in_ctrl_buf_1; 
  input         in_ctrl_buf_2; 
  input         pos_hold_ctrl; 
  input  [31:0] D;
  output [31:0] Q0;
  output [31:0] Q1;
  output [31:0] Q2;
  output [31:0] Q3;
  output [31:0] Q4;
  output [31:0] Q5;
  output [31:0] Q6;
  output [31:0] Q7;
  
  wire          clk; 
  wire          rst;
  wire          mode;
  wire          hold_all_seg; 
  wire          hold_buf_0; 
  wire          hold_buf_1; 
  wire          hold_buf_2; 
  wire          in_ctrl_buf_0; 
  wire          in_ctrl_buf_1; 
  wire          in_ctrl_buf_2; 
  wire          pos_hold_ctrl; 
  wire   [31:0] D;
  wire   [31:0] Q0;
  wire   [31:0] Q1;
  wire   [31:0] Q2;
  wire   [31:0] Q3;
  wire   [31:0] Q4;
  wire   [31:0] Q5;
  wire   [31:0] Q6;
  wire   [31:0] Q7;

  wire   [31:0] swap_out;
  wire   [31:0] buf_0_out;
  wire   [31:0] buf_1_out;
  wire   [31:0] buf_2_out;
  wire   [31:0] mux_out;
  wire   [31:0] segment_0_out;
  wire   [31:0] segment_1_out;
  wire   [31:0] segment_2_out;
  wire   [31:0] segment_3_out;
  wire   [31:0] segment_4_out;
  wire   [31:0] segment_5_out;
  wire   [31:0] segment_6_out;
  wire   [31:0] segment_7_out;
  wire   [31:0] lead_buf_out;


  assign Q0            = segment_0_out;
  assign Q1            = segment_1_out;
  assign Q2            = segment_2_out;
  assign Q3            = segment_3_out;
  assign Q4            = segment_4_out;
  assign Q5            = segment_5_out;
  assign Q6            = segment_6_out;
  assign Q7            = segment_7_out;
  assign segment_7_out = lead_buf_out;

  real_imaginary_interchange swap (
    .A32(D), 
    .Swap(mode), 
    .R32(swap_out)
  );
  
  dff_inputsel_hold_sync_high_reset # ( 
    .DATA_WIDTH(32)
  ) dff_inputsel_hold_sync_high_reset_inst2 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_buf_2), 
    .sel(in_ctrl_buf_2), 
    .D0(32'b0), 
    .D1(swap_out), 
    .Q(buf_2_out)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(32) 
  ) dff_inputsel_hold_sync_high_reset_inst1 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_buf_1), 
    .sel(in_ctrl_buf_1), 
    .D0(buf_2_out), 
    .D1(swap_out), 
    .Q(buf_1_out)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(32) 
  ) dff_inputsel_hold_sync_high_reset_inst0 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_buf_0), 
    .sel(in_ctrl_buf_0), 
    .D0(buf_1_out), 
    .D1(swap_out), 
    .Q(buf_0_out)
  );
  
  mux_2_to_1 # (
    .DATA_WIDTH(32)
  ) mux_2_to_1_inst0 (
    .D0(swap_out),
    .D1(buf_0_out),
    .S(pos_hold_ctrl),
    .Y(mux_out)
  ); 
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_instleadbuf0 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .D(mux_out), 
    .Q(lead_buf_out)
  );
  
  dff_segment_for_input # (
    .DATA_WIDTH(32)
  ) dff_segment_for_input_inst6 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .D(lead_buf_out), 
    .Q(segment_6_out)
  );
  
  dff_segment_for_input # (
    .DATA_WIDTH(32)
  ) dff_segment_for_input_inst5 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .D(segment_6_out), 
    .Q(segment_5_out)
  );
  
  dff_segment_for_input # ( 
    .DATA_WIDTH(32)
  ) dff_segment_for_input_inst4 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .D(segment_5_out), 
    .Q(segment_4_out)
  );
  
  dff_segment_for_input # (
    .DATA_WIDTH(32)
  ) dff_segment_for_input_inst3 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .D(segment_4_out), 
    .Q(segment_3_out)
  );
  
  dff_segment_for_input # (
    .DATA_WIDTH(32)
  ) dff_segment_for_input_inst2 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .D(segment_3_out), 
    .Q(segment_2_out)
  );
  
  dff_segment_for_input # (
    .DATA_WIDTH(32)
  ) dff_segment_for_input_inst1 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .D(segment_2_out), 
    .Q(segment_1_out)
  );
  
  dff_segment_for_input # (
    .DATA_WIDTH(32)
  ) dff_segment_for_input_inst0 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .D(segment_1_out), 
    .Q(segment_0_out)
  );

endmodule
