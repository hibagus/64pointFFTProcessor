module output_circuit(
D1,
D2,
D3,
D4,
D5,
D6,
D7,
D8,
clk,
hold_all_seg,
in_ctrl_all_seg,
mode,
rst,
Q);

input [31:0] D1;
input [31:0] D2;
input [31:0] D3;
input [31:0] D4;
input [31:0] D5;
input [31:0] D6;
input [31:0] D7;
input [31:0] D8;
input clk;
input hold_all_seg;
input in_ctrl_all_seg;
input rst;
output [31:0] Q;

wire [31:0] swap_out;
wire [31:0] scale_out;
wire [31:0] lead_buf_out;
wire [31:0] segment_0_out;
wire [31:0] segment_1_out;
wire [31:0] segment_2_out;
wire [31:0] segment_3_out;
wire [31:0] segment_4_out;
wire [31:0] segment_5_out;
wire [31:0] segment_6_out;

assign Q = scale_out;

dff_hold_sync_high_reset lead_buf (.D1(32'b0), .D2(D8), .clk(clk), .hold(hold_all_seg), .in_sel(in_ctrl_all_seg), .rst(rst), .Q(lead_buf_out));

dff_segment_for_output segment6 (.D7(lead_buf_out), .D1(D7), .clk(clk), .hold(hold_all_seg), .in_sel(in_ctrl_all_seg), .rst(rst), .Q(segment_6_out));

dff_segment_for_output segment5 (.D7(segment_6_out), .D1(D6), .clk(clk), .hold(hold_all_seg), .in_sel(in_ctrl_all_seg), .rst(rst), .Q(segment_5_out));

dff_segment_for_output segment4 (.D7(segment_5_out), .D1(D5), .clk(clk), .hold(hold_all_seg), .in_sel(in_ctrl_all_seg), .rst(rst), .Q(segment_4_out));

dff_segment_for_output segment3 (.D7(segment_4_out), .D1(D4), .clk(clk), .hold(hold_all_seg), .in_sel(in_ctrl_all_seg), .rst(rst), .Q(segment_3_out));

dff_segment_for_output segment2 (.D7(segment_3_out), .D1(D3), .clk(clk), .hold(hold_all_seg), .in_sel(in_ctrl_all_seg), .rst(rst), .Q(segment_2_out));

dff_segment_for_output segment1 (.D7(segment_2_out), .D1(D7), .clk(clk), .hold(hold_all_seg), .in_sel(in_ctrl_all_seg), .rst(rst), .Q(segment_1_out));

dff_segment_for_output segemnt0 (.D7(segment_1_out), .D1(D7), .clk(clk), .hold(hold_all_seg), .in_sel(in_ctrl_all_seg), .rst(rst), .Q(segment_0_out));

real_imaginary_interchange swap (.A32(segment_0_out), .Swap(mode), .R32(swap_out));

scalling_out (.A32(swap_out), .Swap(mode), .R32(scale_out));

endmodule
