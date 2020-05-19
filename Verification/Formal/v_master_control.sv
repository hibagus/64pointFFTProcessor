module v_master_control (
    clk,
    rst,
    mastertrig,
    hold_all_in,
    hold_buf_2,
    hold_buf_1,
    hold_buf_0,
    in_ctrl_buf_2,
    in_ctrl_buf_1,
    in_ctrl_buf_0,
    pos_hold_ctrl,
    Shuf_Ctrl_0,
    Shuf_Ctrl_1,
    Shuf_Ctrl_2,
    Shuf_Ctrl_3,
    Shuf_Ctrl_4,
    Shuf_Ctrl_5,
    Shuf_Ctrl_6,
    Shuf_Ctrl_7,
    Type_Sel_0,
    Type_Sel_1,
    Type_Sel_2,
    Type_Sel_3,
    Type_Sel_4,
    Type_Sel_5,
    Type_Sel_6,
    Type_Sel_7,
    Bypass_Sel_0,
    Bypass_Sel_1,
    Bypass_Sel_2,
    Bypass_Sel_3,
    Bypass_Sel_4,
    Bypass_Sel_5,
    Bypass_Sel_6,
    Bypass_Sel_7,
    DeShuf_Ctrl_0,
    DeShuf_Ctrl_1,
    DeShuf_Ctrl_2,
    DeShuf_Ctrl_3,
    DeShuf_Ctrl_4,
    DeShuf_Ctrl_5,
    DeShuf_Ctrl_6,
    DeShuf_Ctrl_7,
    Bypass_EN_0,
    Bypass_EN_1,
    Bypass_EN_2,
    Bypass_EN_3,
    Bypass_EN_4,
    Bypass_EN_5,
    Bypass_EN_6,
    Bypass_EN_7,
    Hold_Ctrl_0,
    Hold_Ctrl_1,
    Hold_Ctrl_2,
    Hold_Ctrl_3,
    Hold_Ctrl_4,
    Hold_Ctrl_5,
    Hold_Ctrl_6,
    Hold_Ctrl_7,
    DFF_Ctrl_0,
    DFF_Ctrl_1,
    DFF_Ctrl_2,
    DFF_Ctrl_3,
    DFF_Ctrl_4,
    DFF_Ctrl_5,
    DFF_Ctrl_6,
    DFF_Ctrl_7,
    hold_seg_0,
    hold_seg_1,
    hold_seg_2,
    hold_seg_3,
    hold_seg_4,
    hold_seg_5,
    hold_seg_6,
    hold_seg_7,
    in_ctrl_all_cb,
    counter_en,
    next_data
    );


  input                   clk;
  input                   rst;
  input                   mastertrig;
  input                   hold_all_in;
  input                   hold_buf_2;
  input                   hold_buf_1;
  input                   hold_buf_0;
  input                   in_ctrl_buf_2;
  input                   in_ctrl_buf_1;
  input                   in_ctrl_buf_0;
  input                   pos_hold_ctrl;
  input   [2:0]           Shuf_Ctrl_0;
  input   [2:0]           Shuf_Ctrl_1;
  input   [2:0]           Shuf_Ctrl_2;
  input   [2:0]           Shuf_Ctrl_3;
  input   [2:0]           Shuf_Ctrl_4;
  input   [2:0]           Shuf_Ctrl_5;
  input   [2:0]           Shuf_Ctrl_6;
  input   [2:0]           Shuf_Ctrl_7;
  input   [2:0]           Type_Sel_0;
  input   [2:0]           Type_Sel_1;
  input   [2:0]           Type_Sel_2;
  input   [2:0]           Type_Sel_3;
  input   [2:0]           Type_Sel_4;
  input   [2:0]           Type_Sel_5;
  input   [2:0]           Type_Sel_6;
  input   [2:0]           Type_Sel_7;
  input   [2:0]           Bypass_Sel_0;
  input   [2:0]           Bypass_Sel_1;
  input   [2:0]           Bypass_Sel_2;
  input   [2:0]           Bypass_Sel_3;
  input   [2:0]           Bypass_Sel_4;
  input   [2:0]           Bypass_Sel_5;
  input   [2:0]           Bypass_Sel_6;
  input   [2:0]           Bypass_Sel_7;
  input   [2:0]           DeShuf_Ctrl_0;
  input   [2:0]           DeShuf_Ctrl_1;
  input   [2:0]           DeShuf_Ctrl_2;
  input   [2:0]           DeShuf_Ctrl_3;
  input   [2:0]           DeShuf_Ctrl_4;
  input   [2:0]           DeShuf_Ctrl_5;
  input   [2:0]           DeShuf_Ctrl_6;
  input   [2:0]           DeShuf_Ctrl_7;
  input                   Bypass_EN_0;
  input                   Bypass_EN_1;
  input                   Bypass_EN_2;
  input                   Bypass_EN_3;
  input                   Bypass_EN_4;
  input                   Bypass_EN_5;
  input                   Bypass_EN_6;
  input                   Bypass_EN_7;
  input                   Hold_Ctrl_0;
  input                   Hold_Ctrl_1;
  input                   Hold_Ctrl_2;
  input                   Hold_Ctrl_3;
  input                   Hold_Ctrl_4;
  input                   Hold_Ctrl_5;
  input                   Hold_Ctrl_6;
  input                   Hold_Ctrl_7;
  input                   DFF_Ctrl_0;
  input                   DFF_Ctrl_1;
  input                   DFF_Ctrl_2;
  input                   DFF_Ctrl_3;
  input                   DFF_Ctrl_4;
  input                   DFF_Ctrl_5;
  input                   DFF_Ctrl_6;
  input                   DFF_Ctrl_7;
  input                   hold_seg_0;
  input                   hold_seg_1;
  input                   hold_seg_2;
  input                   hold_seg_3;
  input                   hold_seg_4;
  input                   hold_seg_5;
  input                   hold_seg_6;
  input                   hold_seg_7;
  input                   in_ctrl_all_cb;
  input                   counter_en;
  input                   next_data;


  // Auxiliary Code
  //reg [4:0] current_state;
  //always@(posedge clk)
  //begin
  //    if(rst==1'b1)
  //    begin
  //      current_state <= 0;
  //    end
  //end
  
  // Sequences
  sequence seq_mastertrig;
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b0) ##1
    (mastertrig==1'b1);
  endsequence
  sequence seq_hold_all_in;
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b1) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b1) ##1
        (hold_all_in==1'b1) ##1
        (hold_all_in==1'b1) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b1) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0) ##1
        (hold_all_in==1'b0);
  endsequence
  sequence seq_hold_buf_2;
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b0) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1) ##1
    (hold_buf_2==1'b1);
endsequence
  sequence seq_hold_buf_1;
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b0) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b0) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1) ##1
    (hold_buf_1==1'b1);
endsequence
  sequence seq_hold_buf_0;
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b0) ##1
    (hold_buf_0==1'b0) ##1
    (hold_buf_0==1'b0) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b0) ##1
    (hold_buf_0==1'b0) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b0) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1) ##1
    (hold_buf_0==1'b1);
endsequence
  sequence seq_in_ctrl_buf_2;
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b1) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0) ##1
    (in_ctrl_buf_2==1'b0);
endsequence
  sequence seq_in_ctrl_buf_1;
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b1) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0) ##1
    (in_ctrl_buf_1==1'b0);
endsequence
  sequence seq_in_ctrl_buf_0;
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b1) ##1
    (in_ctrl_buf_0==1'b1) ##1
    (in_ctrl_buf_0==1'b1) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0) ##1
    (in_ctrl_buf_0==1'b0);
endsequence
  sequence seq_pos_hold_ctrl;
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b1) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0) ##1
    (pos_hold_ctrl==1'b0);
endsequence
  sequence seq_Shuf_Ctrl_0;
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b001) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b101) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b011) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b111) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000) ##1
    (Shuf_Ctrl_0==3'b000);
endsequence
  sequence seq_Shuf_Ctrl_1;
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b010) ##1
    (Shuf_Ctrl_1==3'b001) ##1
    (Shuf_Ctrl_1==3'b111) ##1
    (Shuf_Ctrl_1==3'b110) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b110) ##1
    (Shuf_Ctrl_1==3'b011) ##1
    (Shuf_Ctrl_1==3'b101) ##1
    (Shuf_Ctrl_1==3'b010) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000) ##1
    (Shuf_Ctrl_1==3'b000);
endsequence
  sequence seq_Shuf_Ctrl_2;
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b011) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b001) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b111) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b101) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000) ##1
    (Shuf_Ctrl_2==3'b000);
endsequence
  sequence seq_Shuf_Ctrl_3;
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b100) ##1
    (Shuf_Ctrl_3==3'b010) ##1
    (Shuf_Ctrl_3==3'b110) ##1
    (Shuf_Ctrl_3==3'b100) ##1
    (Shuf_Ctrl_3==3'b001) ##1
    (Shuf_Ctrl_3==3'b011) ##1
    (Shuf_Ctrl_3==3'b101) ##1
    (Shuf_Ctrl_3==3'b111) ##1
    (Shuf_Ctrl_3==3'b100) ##1
    (Shuf_Ctrl_3==3'b010) ##1
    (Shuf_Ctrl_3==3'b110) ##1
    (Shuf_Ctrl_3==3'b100) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000) ##1
    (Shuf_Ctrl_3==3'b000);
endsequence
  sequence seq_Shuf_Ctrl_4;
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b101) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b111) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b001) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b011) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000) ##1
    (Shuf_Ctrl_4==3'b000);
endsequence
  sequence seq_Shuf_Ctrl_5;
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b110) ##1
    (Shuf_Ctrl_5==3'b011) ##1
    (Shuf_Ctrl_5==3'b101) ##1
    (Shuf_Ctrl_5==3'b010) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b010) ##1
    (Shuf_Ctrl_5==3'b001) ##1
    (Shuf_Ctrl_5==3'b111) ##1
    (Shuf_Ctrl_5==3'b110) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000) ##1
    (Shuf_Ctrl_5==3'b000);
endsequence
  sequence seq_Shuf_Ctrl_6;
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b111) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b011) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b101) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b001) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000) ##1
    (Shuf_Ctrl_6==3'b000);
endsequence
  sequence seq_Shuf_Ctrl_7;
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b100) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b010) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b110) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b100) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000) ##1
    (Shuf_Ctrl_7==3'b000);
endsequence
  sequence seq_Type_Sel_0;
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b001) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b101) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b101) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b100) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000) ##1
    (Type_Sel_0==3'b000);
endsequence
  sequence seq_Type_Sel_1;
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b001) ##1
    (Type_Sel_1==3'b001) ##1
    (Type_Sel_1==3'b101) ##1
    (Type_Sel_1==3'b111) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b011) ##1
    (Type_Sel_1==3'b111) ##1
    (Type_Sel_1==3'b011) ##1
    (Type_Sel_1==3'b101) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000) ##1
    (Type_Sel_1==3'b000);
endsequence
  sequence seq_Type_Sel_2;
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b001) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b001) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b010) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b010) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000) ##1
    (Type_Sel_2==3'b000);
endsequence
  sequence seq_Type_Sel_3;
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b001) ##1
    (Type_Sel_3==3'b001) ##1
    (Type_Sel_3==3'b101) ##1
    (Type_Sel_3==3'b101) ##1
    (Type_Sel_3==3'b001) ##1
    (Type_Sel_3==3'b101) ##1
    (Type_Sel_3==3'b111) ##1
    (Type_Sel_3==3'b011) ##1
    (Type_Sel_3==3'b111) ##1
    (Type_Sel_3==3'b101) ##1
    (Type_Sel_3==3'b010) ##1
    (Type_Sel_3==3'b011) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000) ##1
    (Type_Sel_3==3'b000);
endsequence
  sequence seq_Type_Sel_4;
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b001) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b111) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b001) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b111) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000) ##1
    (Type_Sel_4==3'b000);
endsequence
  sequence seq_Type_Sel_5;
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b001) ##1
    (Type_Sel_5==3'b001) ##1
    (Type_Sel_5==3'b101) ##1
    (Type_Sel_5==3'b001) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b101) ##1
    (Type_Sel_5==3'b001) ##1
    (Type_Sel_5==3'b110) ##1
    (Type_Sel_5==3'b110) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000) ##1
    (Type_Sel_5==3'b000);
endsequence
  sequence seq_Type_Sel_6;
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b001) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b101) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b011) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b001) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000) ##1
    (Type_Sel_6==3'b000);
endsequence
  sequence seq_Type_Sel_7;
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b001) ##1
    (Type_Sel_7==3'b001) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b001) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b111) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b111) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000) ##1
    (Type_Sel_7==3'b000);
endsequence
  sequence seq_Bypass_Sel_0;
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000) ##1
    (Bypass_Sel_0==3'b000);
endsequence
  sequence seq_Bypass_Sel_1;
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000) ##1
    (Bypass_Sel_1==3'b000);
endsequence
  sequence seq_Bypass_Sel_2;
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000) ##1
    (Bypass_Sel_2==3'b000);
endsequence
  sequence seq_Bypass_Sel_3;
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000) ##1
    (Bypass_Sel_3==3'b000);
endsequence
  sequence seq_Bypass_Sel_4;
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b101) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000) ##1
    (Bypass_Sel_4==3'b000);
endsequence
  sequence seq_Bypass_Sel_5;
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000) ##1
    (Bypass_Sel_5==3'b000);
endsequence
  sequence seq_Bypass_Sel_6;
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000) ##1
    (Bypass_Sel_6==3'b000);
endsequence
  sequence seq_Bypass_Sel_7;
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000) ##1
    (Bypass_Sel_7==3'b000);
endsequence
  sequence seq_DeShuf_Ctrl_0;
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000) ##1
    (DeShuf_Ctrl_0==3'b000);
endsequence
  sequence seq_DeShuf_Ctrl_1;
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b001) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b010) ##1
    (DeShuf_Ctrl_1==3'b011) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b100) ##1
    (DeShuf_Ctrl_1==3'b101) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b110) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000) ##1
    (DeShuf_Ctrl_1==3'b000);
endsequence
  sequence seq_DeShuf_Ctrl_2;
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b001) ##1
    (DeShuf_Ctrl_2==3'b011) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b101) ##1
    (DeShuf_Ctrl_2==3'b111) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b101) ##1
    (DeShuf_Ctrl_2==3'b011) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b001) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000) ##1
    (DeShuf_Ctrl_2==3'b000);
endsequence
  sequence seq_DeShuf_Ctrl_3;
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b010) ##1
    (DeShuf_Ctrl_3==3'b101) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b110) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b011) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b001) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b100) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000) ##1
    (DeShuf_Ctrl_3==3'b000);
endsequence
  sequence seq_DeShuf_Ctrl_4;
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b011) ##1
    (DeShuf_Ctrl_4==3'b111) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b011) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b011) ##1
    (DeShuf_Ctrl_4==3'b111) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b011) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000) ##1
    (DeShuf_Ctrl_4==3'b000);
endsequence
  sequence seq_DeShuf_Ctrl_5;
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b100) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b101) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b011) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b110) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b001) ##1
    (DeShuf_Ctrl_5==3'b010) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000) ##1
    (DeShuf_Ctrl_5==3'b000);
endsequence
  sequence seq_DeShuf_Ctrl_6;
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b101) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b011) ##1
    (DeShuf_Ctrl_6==3'b001) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b111) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b001) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b011) ##1
    (DeShuf_Ctrl_6==3'b101) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000) ##1
    (DeShuf_Ctrl_6==3'b000);
endsequence
  sequence seq_DeShuf_Ctrl_7;
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b110) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b001) ##1
    (DeShuf_Ctrl_7==3'b100) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b011) ##1
    (DeShuf_Ctrl_7==3'b010) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b101) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000) ##1
    (DeShuf_Ctrl_7==3'b000);
endsequence
  sequence seq_Bypass_EN_0;
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b1) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b0) ##1
    (Bypass_EN_0==1'b1);
endsequence
  sequence seq_Bypass_EN_1;
    (Bypass_EN_1==1'b1) ##1
    (Bypass_EN_1==1'b1) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b0) ##1
    (Bypass_EN_1==1'b1);
endsequence
  sequence seq_Bypass_EN_2;
    (Bypass_EN_2==1'b1) ##1
    (Bypass_EN_2==1'b1) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b0) ##1
    (Bypass_EN_2==1'b1);
endsequence
  sequence seq_Bypass_EN_3;
    (Bypass_EN_3==1'b1) ##1
    (Bypass_EN_3==1'b1) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b0) ##1
    (Bypass_EN_3==1'b1);
endsequence
  sequence seq_Bypass_EN_4;
    (Bypass_EN_4==1'b1) ##1
    (Bypass_EN_4==1'b1) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b1) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b0) ##1
    (Bypass_EN_4==1'b1);
endsequence
  sequence seq_Bypass_EN_5;
    (Bypass_EN_5==1'b1) ##1
    (Bypass_EN_5==1'b1) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b0) ##1
    (Bypass_EN_5==1'b1);
endsequence
  sequence seq_Bypass_EN_6;
    (Bypass_EN_6==1'b1) ##1
    (Bypass_EN_6==1'b1) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b0) ##1
    (Bypass_EN_6==1'b1);
endsequence
  sequence seq_Bypass_EN_7;
    (Bypass_EN_7==1'b1) ##1
    (Bypass_EN_7==1'b1) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b0) ##1
    (Bypass_EN_7==1'b1);
endsequence
  sequence seq_Hold_Ctrl_0;
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b1) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b1) ##1
    (Hold_Ctrl_0==1'b1) ##1
    (Hold_Ctrl_0==1'b1) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b1) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0) ##1
    (Hold_Ctrl_0==1'b0);
endsequence
  sequence seq_Hold_Ctrl_1;
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b1) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b1) ##1
    (Hold_Ctrl_1==1'b1) ##1
    (Hold_Ctrl_1==1'b1) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b1) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0) ##1
    (Hold_Ctrl_1==1'b0);
endsequence
  sequence seq_Hold_Ctrl_2;
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b1) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b1) ##1
    (Hold_Ctrl_2==1'b1) ##1
    (Hold_Ctrl_2==1'b1) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b1) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0) ##1
    (Hold_Ctrl_2==1'b0);
endsequence
  sequence seq_Hold_Ctrl_3;
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b1) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b1) ##1
    (Hold_Ctrl_3==1'b1) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b1) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0) ##1
    (Hold_Ctrl_3==1'b0);
endsequence
  sequence seq_Hold_Ctrl_4;
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b1) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b1) ##1
    (Hold_Ctrl_4==1'b1) ##1
    (Hold_Ctrl_4==1'b1) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b1) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0) ##1
    (Hold_Ctrl_4==1'b0);
endsequence
  sequence seq_Hold_Ctrl_5;
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b1) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0) ##1
    (Hold_Ctrl_5==1'b0);
endsequence
  sequence seq_Hold_Ctrl_6;
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b1) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0) ##1
    (Hold_Ctrl_6==1'b0);
endsequence
  sequence seq_Hold_Ctrl_7;
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0) ##1
    (Hold_Ctrl_7==1'b0);
endsequence
  sequence seq_DFF_Ctrl_0;
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b1) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b1) ##1
    (DFF_Ctrl_0==1'b1) ##1
    (DFF_Ctrl_0==1'b1) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b1) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0) ##1
    (DFF_Ctrl_0==1'b0);
endsequence
  sequence seq_DFF_Ctrl_1;
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b1) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b1) ##1
    (DFF_Ctrl_1==1'b1) ##1
    (DFF_Ctrl_1==1'b1) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b1) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0) ##1
    (DFF_Ctrl_1==1'b0);
endsequence
  sequence seq_DFF_Ctrl_2;
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b1) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b1) ##1
    (DFF_Ctrl_2==1'b1) ##1
    (DFF_Ctrl_2==1'b1) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b1) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0) ##1
    (DFF_Ctrl_2==1'b0);
endsequence
  sequence seq_DFF_Ctrl_3;
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b1) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b1) ##1
    (DFF_Ctrl_3==1'b1) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b1) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0) ##1
    (DFF_Ctrl_3==1'b0);
endsequence
  sequence seq_DFF_Ctrl_4;
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b1) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b1) ##1
    (DFF_Ctrl_4==1'b1) ##1
    (DFF_Ctrl_4==1'b1) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b1) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0) ##1
    (DFF_Ctrl_4==1'b0);
endsequence
  sequence seq_DFF_Ctrl_5;
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b1) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0) ##1
    (DFF_Ctrl_5==1'b0);
endsequence
  sequence seq_DFF_Ctrl_6;
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b1) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0) ##1
    (DFF_Ctrl_6==1'b0);
endsequence
  sequence seq_DFF_Ctrl_7;
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0) ##1
    (DFF_Ctrl_7==1'b0);
endsequence
  sequence seq_hold_seg_0;
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b0) ##1
    (hold_seg_0==1'b1) ##1
    (hold_seg_0==1'b1);
endsequence
  sequence seq_hold_seg_1;
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b0) ##1
    (hold_seg_1==1'b1) ##1
    (hold_seg_1==1'b1);
endsequence
  sequence seq_hold_seg_2;
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b0) ##1
    (hold_seg_2==1'b1) ##1
    (hold_seg_2==1'b1);
endsequence
  sequence seq_hold_seg_3;
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b0) ##1
    (hold_seg_3==1'b1) ##1
    (hold_seg_3==1'b1);
endsequence
  sequence seq_hold_seg_4;
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b0) ##1
    (hold_seg_4==1'b1) ##1
    (hold_seg_4==1'b1);
endsequence
  sequence seq_hold_seg_5;
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b0) ##1
    (hold_seg_5==1'b1) ##1
    (hold_seg_5==1'b1);
endsequence
  sequence seq_hold_seg_6;
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b0) ##1
    (hold_seg_6==1'b1) ##1
    (hold_seg_6==1'b1);
endsequence
  sequence seq_hold_seg_7;
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b0) ##1
    (hold_seg_7==1'b1) ##1
    (hold_seg_7==1'b1);
endsequence
  sequence seq_in_ctrl_all_cb;
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b0) ##1
    (in_ctrl_all_cb==1'b0) ##1
    (in_ctrl_all_cb==1'b0) ##1
    (in_ctrl_all_cb==1'b0) ##1
    (in_ctrl_all_cb==1'b0) ##1
    (in_ctrl_all_cb==1'b0) ##1
    (in_ctrl_all_cb==1'b0) ##1
    (in_ctrl_all_cb==1'b0) ##1
    (in_ctrl_all_cb==1'b1) ##1
    (in_ctrl_all_cb==1'b1);
endsequence
  sequence seq_counter_en;
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b1) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0) ##1
    (counter_en==1'b0);
endsequence
  sequence seq_next_data;
    (next_data==1'b1) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b0) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1) ##1
    (next_data==1'b1);
endsequence
  
  // Assume Property
  
  assume_mastertrig: assume property(
      @(posedge clk)
      disable iff(rst==1'b1)
      (mastertrig==1'b1) |=>
      seq_mastertrig
  );
  
  // Assert Property
  assert_hold_all_in: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_all_in
  );
  assert_hold_buf_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_buf_2
  );
  assert_hold_buf_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_buf_1
  );
  assert_hold_buf_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_buf_0
  );
  assert_in_ctrl_buf_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_in_ctrl_buf_2
  );
  assert_in_ctrl_buf_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_in_ctrl_buf_1
  );
  assert_in_ctrl_buf_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_in_ctrl_buf_0
  );
  assert_pos_hold_ctrl: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_pos_hold_ctrl
  );
  assert_Shuf_Ctrl_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Shuf_Ctrl_0
  );
  assert_Shuf_Ctrl_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Shuf_Ctrl_1
  );
  assert_Shuf_Ctrl_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Shuf_Ctrl_2
  );
  assert_Shuf_Ctrl_3: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Shuf_Ctrl_3
  );
  assert_Shuf_Ctrl_4: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Shuf_Ctrl_4
  );
  assert_Shuf_Ctrl_5: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Shuf_Ctrl_5
  );
  assert_Shuf_Ctrl_6: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Shuf_Ctrl_6
  );
  assert_Shuf_Ctrl_7: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Shuf_Ctrl_7
  );
  assert_Type_Sel_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Type_Sel_0
  );
  assert_Type_Sel_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Type_Sel_1
  );
  assert_Type_Sel_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Type_Sel_2
  );
  assert_Type_Sel_3: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Type_Sel_3
  );
  assert_Type_Sel_4: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Type_Sel_4
  );
  assert_Type_Sel_5: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Type_Sel_5
  );
  assert_Type_Sel_6: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Type_Sel_6
  );
  assert_Type_Sel_7: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Type_Sel_7
  );
  assert_Bypass_Sel_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_Sel_0
  );
  assert_Bypass_Sel_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_Sel_1
  );
  assert_Bypass_Sel_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_Sel_2
  );
  assert_Bypass_Sel_3: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_Sel_3
  );
  assert_Bypass_Sel_4: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_Sel_4
  );
  assert_Bypass_Sel_5: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_Sel_5
  );
  assert_Bypass_Sel_6: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_Sel_6
  );
  assert_Bypass_Sel_7: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_Sel_7
  );
  assert_DeShuf_Ctrl_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DeShuf_Ctrl_0
  );
  assert_DeShuf_Ctrl_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DeShuf_Ctrl_1
  );
  assert_DeShuf_Ctrl_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DeShuf_Ctrl_2
  );
  assert_DeShuf_Ctrl_3: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DeShuf_Ctrl_3
  );
  assert_DeShuf_Ctrl_4: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DeShuf_Ctrl_4
  );
  assert_DeShuf_Ctrl_5: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DeShuf_Ctrl_5
  );
  assert_DeShuf_Ctrl_6: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DeShuf_Ctrl_6
  );
  assert_DeShuf_Ctrl_7: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DeShuf_Ctrl_7
  );
  assert_Bypass_EN_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_EN_0
  );
  assert_Bypass_EN_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_EN_1
  );
  assert_Bypass_EN_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_EN_2
  );
  assert_Bypass_EN_3: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_EN_3
  );
  assert_Bypass_EN_4: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_EN_4
  );
  assert_Bypass_EN_5: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_EN_5
  );
  assert_Bypass_EN_6: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_EN_6
  );
  assert_Bypass_EN_7: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Bypass_EN_7
  );
  assert_Hold_Ctrl_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Hold_Ctrl_0
  );
  assert_Hold_Ctrl_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Hold_Ctrl_1
  );
  assert_Hold_Ctrl_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Hold_Ctrl_2
  );
  assert_Hold_Ctrl_3: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Hold_Ctrl_3
  );
  assert_Hold_Ctrl_4: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Hold_Ctrl_4
  );
  assert_Hold_Ctrl_5: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Hold_Ctrl_5
  );
  assert_Hold_Ctrl_6: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Hold_Ctrl_6
  );
  assert_Hold_Ctrl_7: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_Hold_Ctrl_7
  );
  assert_DFF_Ctrl_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DFF_Ctrl_0
  );
  assert_DFF_Ctrl_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DFF_Ctrl_1
  );
  assert_DFF_Ctrl_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DFF_Ctrl_2
  );
  assert_DFF_Ctrl_3: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DFF_Ctrl_3
  );
  assert_DFF_Ctrl_4: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DFF_Ctrl_4
  );
  assert_DFF_Ctrl_5: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DFF_Ctrl_5
  );
  assert_DFF_Ctrl_6: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DFF_Ctrl_6
  );
  assert_DFF_Ctrl_7: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_DFF_Ctrl_7
  );
  assert_hold_seg_0: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_seg_0
  );
  assert_hold_seg_1: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_seg_1
  );
  assert_hold_seg_2: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_seg_2
  );
  assert_hold_seg_3: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_seg_3
  );
  assert_hold_seg_4: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_seg_4
  );
  assert_hold_seg_5: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_seg_5
  );
  assert_hold_seg_6: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_seg_6
  );
  assert_hold_seg_7: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_hold_seg_7
  );
  assert_in_ctrl_all_cb: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_in_ctrl_all_cb
  );
  assert_counter_en: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_counter_en
  );
  assert_next_data: assert property(
    @(posedge clk)
    disable iff(rst==1'b1)
    (mastertrig==1'b1) |=>
    seq_next_data
  );

  // Cover Property

endmodule

module Wrapper;

    bind master_control v_master_control
    v_master_control_inst(
        .clk(clk),
        .rst(rst),
        .mastertrig(mastertrig),
        .hold_all_in(hold_all_in),
        .hold_buf_2(hold_buf_2),
        .hold_buf_1(hold_buf_1),
        .hold_buf_0(hold_buf_0),
        .in_ctrl_buf_2(in_ctrl_buf_2),
        .in_ctrl_buf_1(in_ctrl_buf_1),
        .in_ctrl_buf_0(in_ctrl_buf_0),
        .pos_hold_ctrl(pos_hold_ctrl),
        .Shuf_Ctrl_0(Shuf_Ctrl_0),
        .Shuf_Ctrl_1(Shuf_Ctrl_1),
        .Shuf_Ctrl_2(Shuf_Ctrl_2),
        .Shuf_Ctrl_3(Shuf_Ctrl_3),
        .Shuf_Ctrl_4(Shuf_Ctrl_4),
        .Shuf_Ctrl_5(Shuf_Ctrl_5),
        .Shuf_Ctrl_6(Shuf_Ctrl_6),
        .Shuf_Ctrl_7(Shuf_Ctrl_7),
        .Type_Sel_0(Type_Sel_0),
        .Type_Sel_1(Type_Sel_1),
        .Type_Sel_2(Type_Sel_2),
        .Type_Sel_3(Type_Sel_3),
        .Type_Sel_4(Type_Sel_4),
        .Type_Sel_5(Type_Sel_5),
        .Type_Sel_6(Type_Sel_6),
        .Type_Sel_7(Type_Sel_7),
        .Bypass_Sel_0(Bypass_Sel_0),
        .Bypass_Sel_1(Bypass_Sel_1),
        .Bypass_Sel_2(Bypass_Sel_2),
        .Bypass_Sel_3(Bypass_Sel_3),
        .Bypass_Sel_4(Bypass_Sel_4),
        .Bypass_Sel_5(Bypass_Sel_5),
        .Bypass_Sel_6(Bypass_Sel_6),
        .Bypass_Sel_7(Bypass_Sel_7),
        .DeShuf_Ctrl_0(DeShuf_Ctrl_0),
        .DeShuf_Ctrl_1(DeShuf_Ctrl_1),
        .DeShuf_Ctrl_2(DeShuf_Ctrl_2),
        .DeShuf_Ctrl_3(DeShuf_Ctrl_3),
        .DeShuf_Ctrl_4(DeShuf_Ctrl_4),
        .DeShuf_Ctrl_5(DeShuf_Ctrl_5),
        .DeShuf_Ctrl_6(DeShuf_Ctrl_6),
        .DeShuf_Ctrl_7(DeShuf_Ctrl_7),
        .Bypass_EN_0(Bypass_EN_0),
        .Bypass_EN_1(Bypass_EN_1),
        .Bypass_EN_2(Bypass_EN_2),
        .Bypass_EN_3(Bypass_EN_3),
        .Bypass_EN_4(Bypass_EN_4),
        .Bypass_EN_5(Bypass_EN_5),
        .Bypass_EN_6(Bypass_EN_6),
        .Bypass_EN_7(Bypass_EN_7),
        .Hold_Ctrl_0(Hold_Ctrl_0),
        .Hold_Ctrl_1(Hold_Ctrl_1),
        .Hold_Ctrl_2(Hold_Ctrl_2),
        .Hold_Ctrl_3(Hold_Ctrl_3),
        .Hold_Ctrl_4(Hold_Ctrl_4),
        .Hold_Ctrl_5(Hold_Ctrl_5),
        .Hold_Ctrl_6(Hold_Ctrl_6),
        .Hold_Ctrl_7(Hold_Ctrl_7),
        .DFF_Ctrl_0(DFF_Ctrl_0),
        .DFF_Ctrl_1(DFF_Ctrl_1),
        .DFF_Ctrl_2(DFF_Ctrl_2),
        .DFF_Ctrl_3(DFF_Ctrl_3),
        .DFF_Ctrl_4(DFF_Ctrl_4),
        .DFF_Ctrl_5(DFF_Ctrl_5),
        .DFF_Ctrl_6(DFF_Ctrl_6),
        .DFF_Ctrl_7(DFF_Ctrl_7),
        .hold_seg_0(hold_seg_0),
        .hold_seg_1(hold_seg_1),
        .hold_seg_2(hold_seg_2),
        .hold_seg_3(hold_seg_3),
        .hold_seg_4(hold_seg_4),
        .hold_seg_5(hold_seg_5),
        .hold_seg_6(hold_seg_6),
        .hold_seg_7(hold_seg_7),
        .in_ctrl_all_cb(in_ctrl_all_cb),
        .counter_en(counter_en),
        .next_data(next_data)
    );
endmodule