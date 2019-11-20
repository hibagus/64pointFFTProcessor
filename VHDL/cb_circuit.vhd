LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY cb_circuit IS
	PORT 	(
				D1		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D2		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D3		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D4		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D5		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D6		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D7		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D8		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		       :	IN		STD_LOGIC;
				hold_seg_0	   :	IN		STD_LOGIC;
				hold_seg_1	   :	IN		STD_LOGIC;
				hold_seg_2	   :	IN		STD_LOGIC;
				hold_seg_3	   :	IN		STD_LOGIC;
				hold_seg_4	   :	IN		STD_LOGIC;
				hold_seg_5	   :	IN		STD_LOGIC;
				hold_seg_6	   :	IN		STD_LOGIC;
				hold_seg_7	   :	IN		STD_LOGIC;
				in_ctrl_all_seg:    IN		STD_LOGIC;
				rst		       :	IN 		STD_LOGIC;
				Q1		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q2		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q3		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q4		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q5		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q6		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q7		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q8		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END cb_circuit;

ARCHITECTURE structural of cb_circuit IS
COMPONENT dff_segment_for_cb IS
	PORT 	(
				D1		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D2		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D3		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D4		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D5		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D6		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D7		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D8		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D9		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
				in_sel  :   IN		STD_LOGIC;
				rst		:	IN 		STD_LOGIC;
				Q		:	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;

SIGNAL SEGMENT_0_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_1_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_2_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_3_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_4_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_5_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_6_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_7_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
	BEGIN
	Q1	           <=	SEGMENT_0_OUT;
	Q2	           <=	SEGMENT_1_OUT;
	Q3	           <=	SEGMENT_2_OUT;
	Q4	           <=	SEGMENT_3_OUT;
	Q5	           <=	SEGMENT_4_OUT;
	Q6	           <=	SEGMENT_5_OUT;
	Q7	           <=	SEGMENT_6_OUT;
	Q8	           <=	SEGMENT_7_OUT;
	SEGMEN_7 :
		dff_segment_for_cb
			PORT MAP (
						D1		=>std_logic_vector(to_unsigned(0,32)),
						D2		=>D1,
						D3		=>D2,
						D4		=>D3,
						D5		=>D4,
						D6		=>D5,
						D7		=>D6,
						D8		=>D7,
						D9		=>D8,
						clk		=>clk,
						hold	=>hold_seg_7,
						in_sel  =>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_7_OUT					
					 );
	SEGMEN_6 :
		dff_segment_for_cb
			PORT MAP (
						D1		=>SEGMENT_7_OUT,
						D2		=>D1,
						D3		=>D2,
						D4		=>D3,
						D5		=>D4,
						D6		=>D5,
						D7		=>D6,
						D8		=>D7,
						D9		=>D8,
						clk		=>clk,
						hold	=>hold_seg_6,
						in_sel  =>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_6_OUT					
					 );	
	SEGMEN_5 :
		dff_segment_for_cb
			PORT MAP (
						D1		=>SEGMENT_6_OUT,
						D2		=>D1,
						D3		=>D2,
						D4		=>D3,
						D5		=>D4,
						D6		=>D5,
						D7		=>D6,
						D8		=>D7,
						D9		=>D8,
						clk		=>clk,
						hold	=>hold_seg_5,
						in_sel  =>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_5_OUT					
					 );	
	SEGMEN_4 :
		dff_segment_for_cb
			PORT MAP (
						D1		=>SEGMENT_5_OUT,
						D2		=>D1,
						D3		=>D2,
						D4		=>D3,
						D5		=>D4,
						D6		=>D5,
						D7		=>D6,
						D8		=>D7,
						D9		=>D8,
						clk		=>clk,
						hold	=>hold_seg_4,
						in_sel  =>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_4_OUT					
					 );	
	SEGMEN_3 :
		dff_segment_for_cb
			PORT MAP (
						D1		=>SEGMENT_4_OUT,
						D2		=>D1,
						D3		=>D2,
						D4		=>D3,
						D5		=>D4,
						D6		=>D5,
						D7		=>D6,
						D8		=>D7,
						D9		=>D8,
						clk		=>clk,
						hold	=>hold_seg_3,
						in_sel  =>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_3_OUT					
					 );	
	SEGMEN_2 :
		dff_segment_for_cb
			PORT MAP (
						D1		=>SEGMENT_3_OUT,
						D2		=>D1,
						D3		=>D2,
						D4		=>D3,
						D5		=>D4,
						D6		=>D5,
						D7		=>D6,
						D8		=>D7,
						D9		=>D8,
						clk		=>clk,
						hold	=>hold_seg_2,
						in_sel  =>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_2_OUT					
					 );	
	SEGMEN_1 :
		dff_segment_for_cb
			PORT MAP (
						D1		=>SEGMENT_2_OUT,
						D2		=>D1,
						D3		=>D2,
						D4		=>D3,
						D5		=>D4,
						D6		=>D5,
						D7		=>D6,
						D8		=>D7,
						D9		=>D8,
						clk		=>clk,
						hold	=>hold_seg_1,
						in_sel  =>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_1_OUT					
					 );	
	SEGMEN_0 :
		dff_segment_for_cb
			PORT MAP (
						D1		=>SEGMENT_1_OUT,
						D2		=>D1,
						D3		=>D2,
						D4		=>D3,
						D5		=>D4,
						D6		=>D5,
						D7		=>D6,
						D8		=>D7,
						D9		=>D8,
						clk		=>clk,
						hold	=>hold_seg_0,
						in_sel  =>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_0_OUT					
					 );	
	END structural;