module output_circuit(
  clk,
  rst,
  mode,
  hold_all_seg,
  in_ctrl_all_seg,
  D0,
  D1,
  D2,
  D3,
  D4,
  D5,
  D6,
  D7,
  Q
  );
  
  input         clk;
  input         rst;
  input         mode;
  input         hold_all_seg;
  input         in_ctrl_all_seg;
  input  [31:0] D0;
  input  [31:0] D1;
  input  [31:0] D2;
  input  [31:0] D3;
  input  [31:0] D4;
  input  [31:0] D5;
  input  [31:0] D6;
  input  [31:0] D7;
  output [31:0] Q;
  
  wire          clk;
  wire          rst;
  wire          mode;
  wire          hold_all_seg;
  wire          in_ctrl_all_seg;
  wire   [31:0] D0;
  wire   [31:0] D1;
  wire   [31:0] D2;
  wire   [31:0] D3;
  wire   [31:0] D4;
  wire   [31:0] D5;
  wire   [31:0] D6;
  wire   [31:0] D7;
  wire   [31:0] Q;
  
  wire   [31:0] swap_out;
  wire   [31:0] scale_out;
  wire   [31:0] lead_buf_out;
  wire   [31:0] segment_0_out;
  wire   [31:0] segment_1_out;
  wire   [31:0] segment_2_out;
  wire   [31:0] segment_3_out;
  wire   [31:0] segment_4_out;
  wire   [31:0] segment_5_out;
  wire   [31:0] segment_6_out;
  
  assign Q = scale_out;
  
  dff_inputsel_hold_sync_high_reset # ( 
    .DATA_WIDTH(32)
  ) dff_inputsel_hold_sync_high_reset_instleadbuf0 (
    .clk(clk), 
    .rst(rst), 
    .hold(hold_all_seg), 
    .sel(in_ctrl_all_seg), 
    .D0(32'b0), 
    .D1(D7), 
    .Q(lead_buf_out)
  );
  
  
  dff_segment_for_output # (
    .DATA_WIDTH(32)
  ) dff_segment_for_output_inst6 (
    .clk(clk),
    .rst(rst),
    .hold(hold_all_seg),
    .sel(in_ctrl_all_seg),
    .D7(lead_buf_out), 
    .D1(D6),     
    .Q(segment_6_out)
  );
  
  dff_segment_for_output # (
    .DATA_WIDTH(32)
  ) dff_segment_for_output_inst5 (
    .clk(clk),
    .rst(rst),
    .hold(hold_all_seg),
    .sel(in_ctrl_all_seg),
    .D7(segment_6_out), 
    .D1(D5),     
    .Q(segment_5_out)
  );
  
  dff_segment_for_output # (
    .DATA_WIDTH(32)
  ) dff_segment_for_output_inst4 (
    .clk(clk),
    .rst(rst),
    .hold(hold_all_seg),
    .sel(in_ctrl_all_seg),
    .D7(segment_5_out), 
    .D1(D4),     
    .Q(segment_4_out)
  );
  
  dff_segment_for_output # (
    .DATA_WIDTH(32)
  ) dff_segment_for_output_inst3 (
    .clk(clk),
    .rst(rst),
    .hold(hold_all_seg),
    .sel(in_ctrl_all_seg),
    .D7(segment_4_out), 
    .D1(D3),     
    .Q(segment_3_out)
  );
  
  dff_segment_for_output # (
    .DATA_WIDTH(32)
  ) dff_segment_for_output_inst2 (
    .clk(clk),
    .rst(rst),
    .hold(hold_all_seg),
    .sel(in_ctrl_all_seg),
    .D7(segment_3_out), 
    .D1(D2),     
    .Q(segment_2_out)
  );
  
  dff_segment_for_output # (
    .DATA_WIDTH(32)
  ) dff_segment_for_output_inst1 (
    .clk(clk),
    .rst(rst),
    .hold(hold_all_seg),
    .sel(in_ctrl_all_seg),
    .D7(segment_2_out), 
    .D1(D1),     
    .Q(segment_1_out)
  );
  
  dff_segment_for_output # (
    .DATA_WIDTH(32)
  ) dff_segment_for_output_inst0 (
    .clk(clk),
    .rst(rst),
    .hold(hold_all_seg),
    .sel(in_ctrl_all_seg),
    .D7(segment_1_out), 
    .D1(D0),     
    .Q(segment_0_out)
  );
  
  real_imaginary_interchange real_imaginary_interchange_inst0 (
    .A32(segment_0_out), 
    .Swap(mode), 
    .R32(swap_out)
  );
  
  scalling_out scalling_out_inst0 (  
    .A32(swap_out), 
    .Swap(mode), 
    .R32(scale_out)
  );

endmodule
