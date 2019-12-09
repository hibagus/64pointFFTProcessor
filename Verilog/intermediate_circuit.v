module intermediate_circuit(
  clk,
  rst,
  hold,
  SET_0_IN,
  SET_1_IN,
  SET_2_IN,
  SET_3_IN,
  SET_4_IN,
  SET_5_IN,
  SET_6_IN,
  SET_7_IN,
  SET_0_OUT,
  SET_1_OUT,
  SET_2_OUT,
  SET_3_OUT,
  SET_4_OUT,
  SET_5_OUT,
  SET_6_OUT,
  SET_7_OUT
  );

  input         clk;
  input         rst;
  input         hold;
  input [31:0]  SET_0_IN;
  input [31:0]  SET_1_IN;
  input [31:0]  SET_2_IN;
  input [31:0]  SET_3_IN;
  input [31:0]  SET_4_IN;
  input [31:0]  SET_5_IN;
  input [31:0]  SET_6_IN;
  input [31:0]  SET_7_IN;
  output [31:0] SET_0_OUT;
  output [31:0] SET_1_OUT;
  output [31:0] SET_2_OUT;
  output [31:0] SET_3_OUT;
  output [31:0] SET_4_OUT;
  output [31:0] SET_5_OUT;
  output [31:0] SET_6_OUT;
  output [31:0] SET_7_OUT;
  
  wire          clk;
  wire          rst;
  wire          hold;
  wire   [31:0] SET_0_IN;
  wire   [31:0] SET_1_IN;
  wire   [31:0] SET_2_IN;
  wire   [31:0] SET_3_IN;
  wire   [31:0] SET_4_IN;
  wire   [31:0] SET_5_IN;
  wire   [31:0] SET_6_IN;
  wire   [31:0] SET_7_IN;
  wire   [31:0] SET_0_OUT;
  wire   [31:0] SET_1_OUT;
  wire   [31:0] SET_2_OUT;
  wire   [31:0] SET_3_OUT;
  wire   [31:0] SET_4_OUT;
  wire   [31:0] SET_5_OUT;
  wire   [31:0] SET_6_OUT;
  wire   [31:0] SET_7_OUT;
  
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst0 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(SET_0_IN),
    .Q(SET_0_OUT)
  );

  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst1 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(SET_1_IN),
    .Q(SET_1_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst2 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(SET_2_IN),
    .Q(SET_2_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst3 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(SET_3_IN),
    .Q(SET_3_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst4 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(SET_4_IN),
    .Q(SET_4_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst5 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(SET_5_IN),
    .Q(SET_5_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst6 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(SET_6_IN),
    .Q(SET_6_OUT)
  );
  
  dff_hold_sync_high_reset # (
    .DATA_WIDTH(32)
  ) dff_hold_sync_high_reset_inst7 (
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .D(SET_7_IN),
    .Q(SET_7_OUT)
  );
  
  
endmodule
