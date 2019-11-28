module dff_hold_sync_high_reset (
  clk,
  rst,
  hold,
  D,
  Q);
  
  parameter DATA_WIDTH = 1;
  
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
  
  wire   [DATA_WIDTH-1:0] MUX_OUT;
  
  mux_2_to_1 # (
    .DATA_WIDTH(DATA_WIDTH)
  ) mux_2_to_1_inst0 (
    .D0(D),
    .D1(Q),
    .S(hold),
    .Y(MUX_OUT)
  ); 
  
  dff_sync_high_reset # (
    .DATA_WIDTH(DATA_WIDTH)
  ) dff_sync_high_reset_inst0 (
    .clk(clk),
    .rst(rst),
    .D(MUX_OUT),
    .Q(Q)
  );
  
endmodule
