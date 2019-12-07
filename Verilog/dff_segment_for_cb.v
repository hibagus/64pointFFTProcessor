module dff_segment_for_cb (
  clk,
  rst,
  hold,
  sel,
  D0,
  D1,
  D2,
  D3,
  D4,
  D5,
  D6,
  D7,
  D8,
  Q);
  
  parameter DATA_WIDTH = 32;
  
  input                   clk;
  input                   rst;
  input                   hold;
  input                   sel;
  input  [DATA_WIDTH-1:0] D0;
  input  [DATA_WIDTH-1:0] D1;
  input  [DATA_WIDTH-1:0] D2;
  input  [DATA_WIDTH-1:0] D3;
  input  [DATA_WIDTH-1:0] D4;
  input  [DATA_WIDTH-1:0] D5;
  input  [DATA_WIDTH-1:0] D6;
  input  [DATA_WIDTH-1:0] D7;
  input  [DATA_WIDTH-1:0] D8;
  
  output [DATA_WIDTH-1:0] Q;
  
  wire                    clk;
  wire                    rst;
  wire                    hold;
  wire                    sel;
  wire   [DATA_WIDTH-1:0] D0;
  wire   [DATA_WIDTH-1:0] D1;
  wire   [DATA_WIDTH-1:0] D2;
  wire   [DATA_WIDTH-1:0] D3;
  wire   [DATA_WIDTH-1:0] D4;
  wire   [DATA_WIDTH-1:0] D5;
  wire   [DATA_WIDTH-1:0] D6;
  wire   [DATA_WIDTH-1:0] D7;
  wire   [DATA_WIDTH-1:0] D8;
  
  wire    [DATA_WIDTH-1:0] Q;
  
  
  //wire   [DATA_WIDTH-1:0] DFF_0_OUT;
  wire   [DATA_WIDTH-1:0] DFF_1_OUT;
  wire   [DATA_WIDTH-1:0] DFF_2_OUT;
  wire   [DATA_WIDTH-1:0] DFF_3_OUT;
  wire   [DATA_WIDTH-1:0] DFF_4_OUT;
  wire   [DATA_WIDTH-1:0] DFF_5_OUT;
  wire   [DATA_WIDTH-1:0] DFF_6_OUT;
  wire   [DATA_WIDTH-1:0] DFF_7_OUT;
  
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_inputsel_hold_sync_high_reset_inst7 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
	.sel(sel),
    .D0(D0),
	.D1(D8),
    .Q(DFF_7_OUT)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_inputsel_hold_sync_high_reset_inst6 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
	.sel(sel),
    .D0(DFF_7_OUT),
	.D1(D7),
    .Q(DFF_6_OUT)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_inputsel_hold_sync_high_reset_inst5 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
	.sel(sel),
    .D0(DFF_6_OUT),
	.D1(D6),
    .Q(DFF_5_OUT)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_inputsel_hold_sync_high_reset_inst4 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
	.sel(sel),
    .D0(DFF_5_OUT),
	.D1(D5),
    .Q(DFF_4_OUT)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_inputsel_hold_sync_high_reset_inst3 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
	.sel(sel),
    .D0(DFF_4_OUT),
	.D1(D4),
    .Q(DFF_3_OUT)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_inputsel_hold_sync_high_reset_inst2 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
	.sel(sel),
    .D0(DFF_3_OUT),
	.D1(D3),
    .Q(DFF_2_OUT)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_inputsel_hold_sync_high_reset_inst1 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
	.sel(sel),
    .D0(DFF_2_OUT),
	.D1(D2),
    .Q(DFF_1_OUT)
  );
  
  dff_inputsel_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_inputsel_hold_sync_high_reset_inst0 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
	.sel(sel),
    .D0(DFF_1_OUT),
	.D1(D1),
    .Q(Q)
  );
  
endmodule
