module dff_inputsel_hold_sync_high_reset (
  clk,
  rst,
  hold,
  sel,
  D0,
  D1,
  Q);
  
  parameter DATA_WIDTH = 1;
  
  input                   clk;
  input                   rst;
  input                   hold;
  input                   sel;
  input  [DATA_WIDTH-1:0] D0;
  input  [DATA_WIDTH-1:0] D1;
  output [DATA_WIDTH-1:0] Q;
  
  wire                    clk;
  wire                    rst;
  wire                    hold;
  wire                    sel;
  wire   [DATA_WIDTH-1:0] D0;
  wire   [DATA_WIDTH-1:0] D1;
  wire   [DATA_WIDTH-1:0] Q;
  
  wire   [DATA_WIDTH-1:0] MUX_OUT;
  
  mux_2_to_1 # (
    .DATA_WIDTH(DATA_WIDTH)
  ) mux_2_to_1_inst0 (
    .D0(D0),
    .D1(D1),
    .S(sel),
    .Y(MUX_OUT)
  ); 
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_hold_sync_high_reset_inst0 (
    .clk(clk),
    .rst(rst),
	.hold(hold),
    .D(MUX_OUT),
    .Q(Q)
  );
  
endmodule
