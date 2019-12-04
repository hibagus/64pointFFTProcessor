module dff_segment_for_input (
  clk,
  rst,
  hold,
  D,
  Q);
  
  parameter DATA_WIDTH = 32;
  
  input                   clk;
  input                   rst;
  input                   hold;
  input  [DATA_WIDTH-1:0] D;
  output [DATA_WIDTH-1:0] Q;
  
  wire                    clk;
  wire                    rst;
  wire                    hold;
  wire   [DATA_WIDTH-1:0] D;
  wire   [DATA_WIDTH-1:0] Q;
  
  wire   [DATA_WIDTH-1:0] DFF_1_OUT;
  wire   [DATA_WIDTH-1:0] DFF_2_OUT;
  wire   [DATA_WIDTH-1:0] DFF_3_OUT;
  wire   [DATA_WIDTH-1:0] DFF_4_OUT;
  wire   [DATA_WIDTH-1:0] DFF_5_OUT;
  wire   [DATA_WIDTH-1:0] DFF_6_OUT;
  wire   [DATA_WIDTH-1:0] DFF_7_OUT;
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst7 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(D),
    .Q(DFF_7_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst6 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(DFF_7_OUT),
    .Q(DFF_6_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst5 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(DFF_6_OUT),
    .Q(DFF_5_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst4 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(DFF_5_OUT),
    .Q(DFF_4_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst3 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(DFF_4_OUT),
    .Q(DFF_3_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst2 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(DFF_3_OUT),
    .Q(DFF_2_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst1 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(DFF_2_OUT),
    .Q(DFF_1_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst0 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(DFF_1_OUT),
    .Q(Q)
  );
  
  
endmodule
