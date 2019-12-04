module cb_circuit(
  clk,
  rst,
  in_ctrl_all_seg,
  hold_seg_0,
  hold_seg_1,
  hold_seg_2,
  hold_seg_3,
  hold_seg_4,
  hold_seg_5,
  hold_seg_6,
  hold_seg_7,
  D0,
  D1,
  D2,
  D3,
  D4,
  D5,
  D6,
  D7,
  Q0,
  Q1,
  Q2,
  Q3,
  Q4,
  Q5,
  Q6,
  Q7
  );
   
  input  clk;
  input  rst;
  input  in_ctrl_all_seg;
  input  hold_seg_0;
  input  hold_seg_1;
  input  hold_seg_2;
  input  hold_seg_3;
  input  hold_seg_4;
  input  hold_seg_5;
  input  hold_seg_6;
  input  hold_seg_7;
  input  [31:0] D0;
  input  [31:0] D1;
  input  [31:0] D2;
  input  [31:0] D3;
  input  [31:0] D4;
  input  [31:0] D5;
  input  [31:0] D6;
  input  [31:0] D7;
  output [31:0] Q0;
  output [31:0] Q1;
  output [31:0] Q2;
  output [31:0] Q3;
  output [31:0] Q4;
  output [31:0] Q5;
  output [31:0] Q6;
  output [31:0] Q7;
  
  wire   clk;
  wire   rst;
  wire   in_ctrl_all_seg;
  wire   hold_seg_0;
  wire   hold_seg_1;
  wire   hold_seg_2;
  wire   hold_seg_3;
  wire   hold_seg_4;
  wire   hold_seg_5;
  wire   hold_seg_6;
  wire   hold_seg_7;
  wire   [31:0] D0;
  wire   [31:0] D1;
  wire   [31:0] D2;
  wire   [31:0] D3;
  wire   [31:0] D4;
  wire   [31:0] D5;
  wire   [31:0] D6;
  wire   [31:0] D7;
  wire   [31:0] Q0;
  wire   [31:0] Q1;
  wire   [31:0] Q2;
  wire   [31:0] Q3;
  wire   [31:0] Q4;
  wire   [31:0] Q5;
  wire   [31:0] Q6;
  wire   [31:0] Q7;

  wire   [31:0] segment_0_out;
  wire   [31:0] segment_1_out;
  wire   [31:0] segment_2_out;
  wire   [31:0] segment_3_out;
  wire   [31:0] segment_4_out;
  wire   [31:0] segment_5_out;
  wire   [31:0] segment_6_out;
  wire   [31:0] segment_7_out;

  assign Q0            = segment_0_out;
  assign Q1            = segment_1_out;
  assign Q2            = segment_2_out;
  assign Q3            = segment_3_out;
  assign Q4            = segment_4_out;
  assign Q5            = segment_5_out;
  assign Q6            = segment_6_out;
  assign Q7            = segment_7_out;
  
  dff_segment_for_cb # (
    .DATA_WIDTH(32)
  ) dff_segment_for_cb_inst7 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_seg_7), 
    .sel(in_ctrl_all_seg),
    .D0(32'b0), 
    .D1(D0),
    .D2(D1),
    .D3(D2),
    .D4(D3),
    .D5(D4),
    .D6(D5),
    .D7(D6),
    .D8(D7),
    .Q(segment_7_out)
  );
  
  dff_segment_for_cb # (
    .DATA_WIDTH(32)
  ) dff_segment_for_cb_inst6 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_seg_6), 
    .sel(in_ctrl_all_seg),
    .D0(segment_7_out), 
    .D1(D0),
    .D2(D1),
    .D3(D2),
    .D4(D3),
    .D5(D4),
    .D6(D5),
    .D7(D6),
    .D8(D7),
    .Q(segment_6_out)
  );
  
  dff_segment_for_cb # (
    .DATA_WIDTH(32)
  ) dff_segment_for_cb_inst5 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_seg_5), 
    .sel(in_ctrl_all_seg),
    .D0(segment_6_out), 
    .D1(D0),
    .D2(D1),
    .D3(D2),
    .D4(D3),
    .D5(D4),
    .D6(D5),
    .D7(D6),
    .D8(D7),
    .Q(segment_5_out)
  );
  
  dff_segment_for_cb # (
    .DATA_WIDTH(32)
  ) dff_segment_for_cb_inst4 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_seg_4), 
    .sel(in_ctrl_all_seg),
    .D0(segment_5_out), 
    .D1(D0),
    .D2(D1),
    .D3(D2),
    .D4(D3),
    .D5(D4),
    .D6(D5),
    .D7(D6),
    .D8(D7),
    .Q(segment_4_out)
  );

  dff_segment_for_cb # (
    .DATA_WIDTH(32)
  ) dff_segment_for_cb_inst3 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_seg_3), 
    .sel(in_ctrl_all_seg),
    .D0(segment_4_out), 
    .D1(D0),
    .D2(D1),
    .D3(D2),
    .D4(D3),
    .D5(D4),
    .D6(D5),
    .D7(D6),
    .D8(D7),
    .Q(segment_3_out)
  );
  dff_segment_for_cb # (
    .DATA_WIDTH(32)
  ) dff_segment_for_cb_inst2 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_seg_2), 
    .sel(in_ctrl_all_seg),
    .D0(segment_3_out), 
    .D1(D0),
    .D2(D1),
    .D3(D2),
    .D4(D3),
    .D5(D4),
    .D6(D5),
    .D7(D6),
    .D8(D7),
    .Q(segment_2_out)
  );
  
   dff_segment_for_cb # (
    .DATA_WIDTH(32)
  ) dff_segment_for_cb_inst1 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_seg_1), 
    .sel(in_ctrl_all_seg),
    .D0(segment_2_out), 
    .D1(D0),
    .D2(D1),
    .D3(D2),
    .D4(D3),
    .D5(D4),
    .D6(D5),
    .D7(D6),
    .D8(D7),
    .Q(segment_1_out)
  );
  dff_segment_for_cb # (
    .DATA_WIDTH(32)
  ) dff_segment_for_cb_inst0 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_seg_0), 
    .sel(in_ctrl_all_seg),
    .D0(segment_1_out), 
    .D1(D0),
    .D2(D1),
    .D3(D2),
    .D4(D3),
    .D5(D4),
    .D6(D5),
    .D7(D6),
    .D8(D7),
    .Q(segment_0_out)
  );
  
endmodule
