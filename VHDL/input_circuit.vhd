LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY input_circuit IS
	PORT 	(
				D		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		       :	IN		STD_LOGIC;
				hold_all_seg   :	IN		STD_LOGIC;
				hold_buf_1     :	IN		STD_LOGIC;
				hold_buf_2     :	IN		STD_LOGIC;
				hold_buf_3     :	IN		STD_LOGIC;
				in_ctrl_buf_1  :    IN		STD_LOGIC;
				in_ctrl_buf_2  :    IN		STD_LOGIC;
				in_ctrl_buf_3  :    IN		STD_LOGIC;
				pos_hold_ctrl  :    IN		STD_LOGIC;
				mode  		   :    IN		STD_LOGIC;
				rst		       :	IN 		STD_LOGIC;
				Q0		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q1		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q2		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q3		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q4		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q5		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q6		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q7		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END input_circuit;

ARCHITECTURE structural of input_circuit IS
COMPONENT dff_segment_for_input IS
	PORT 	(
				D		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
				rst		:	IN 		STD_LOGIC;
				Q		:	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT dff_with_hold_32b IS
	PORT 	(
				D		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
				rst		:	IN 		STD_LOGIC;
				Q		:	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT dff_with_hold_input_ctrl IS
	PORT 	(
				D1		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D2		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
				in_sel	:	IN		STD_LOGIC;
				rst		:	IN 		STD_LOGIC;
				Q		:	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT mux_2to1_32b IS
	PORT 	(
				D1	:	IN	std_logic_vector (31 DOWNTO 0);
				D2	:	IN	std_logic_vector (31 DOWNTO 0);
				Y	:	OUT	std_logic_vector (31 DOWNTO 0);
				S	:	IN	std_logic
			);
END COMPONENT;
COMPONENT real_imaginary_interchange IS
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Swap	:	IN	STD_LOGIC;
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;

SIGNAL SWAP_OUT	       :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL BUF_1_OUT       :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL BUF_2_OUT       :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL BUF_3_OUT       :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL MUX_OUT         :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL LEAD_BUF_OUT    :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_0_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_1_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_2_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_3_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_4_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_5_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_6_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_7_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
	BEGIN
	Q0	           <=	SEGMENT_0_OUT;
	Q1	           <=	SEGMENT_1_OUT;
	Q2	           <=	SEGMENT_2_OUT;
	Q3	           <=	SEGMENT_3_OUT;
	Q4	           <=	SEGMENT_4_OUT;
	Q5	           <=	SEGMENT_5_OUT;
	Q6	           <=	SEGMENT_6_OUT;
	Q7	           <=	SEGMENT_7_OUT;
	SEGMENT_7_OUT  <=   LEAD_BUF_OUT;
	-- Port Map
    SWAP :
		real_imaginary_interchange
			PORT MAP (
						A32	=>D,
						Swap=>mode,
						R32 =>SWAP_OUT
					);
	BUF_3 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1     =>std_logic_vector(to_unsigned(0,32)),
						D2     =>SWAP_OUT,
						clk    =>clk,
						hold   =>hold_buf_3,
						in_sel =>in_ctrl_buf_3,
						rst    =>rst,
						Q      =>BUF_3_OUT
					);
	BUF_2 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1     =>BUF_3_OUT,
						D2     =>SWAP_OUT,
						clk    =>clk,
						hold   =>hold_buf_2,
						in_sel =>in_ctrl_buf_2,
						rst    =>rst,
						Q      =>BUF_2_OUT
					);
	BUF_1 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1     =>BUF_2_OUT,
						D2     =>SWAP_OUT,
						clk    =>clk,
						hold   =>hold_buf_1,
						in_sel =>in_ctrl_buf_1,
						rst    =>rst,
						Q      =>BUF_1_OUT
					);
    MUX :
		mux_2to1_32b
			PORT MAP (
						D1	=>SWAP_OUT,
						D2  =>BUF_1_OUT,
						Y   =>MUX_OUT,
						S   =>pos_hold_ctrl
					);
	LEAD_BUF :
		dff_with_hold_32b
			PORT MAP (
						D	=>MUX_OUT,
						clk =>clk,
						hold=>hold_all_seg,
						rst =>rst,
						Q   =>LEAD_BUF_OUT
					);
	SEGMEN_6 :
		dff_segment_for_input
			PORT MAP (
						D   => 	LEAD_BUF_OUT,
						clk	=>  clk,
						hold=>  hold_all_seg,
						rst	=>  rst,
						Q	=>  SEGMENT_6_OUT					
					);
	SEGMEN_5 :
		dff_segment_for_input
			PORT MAP (
						D   => 	SEGMENT_6_OUT,
						clk	=>  clk,
						hold=>  hold_all_seg,
						rst	=>  rst,
						Q	=>  SEGMENT_5_OUT					
					);
	SEGMEN_4 :
		dff_segment_for_input
			PORT MAP (
						D   => 	SEGMENT_5_OUT,
						clk	=>  clk,
						hold=>  hold_all_seg,
						rst	=>  rst,
						Q	=>  SEGMENT_4_OUT					
					);	
	SEGMEN_3 :
		dff_segment_for_input
			PORT MAP (
						D   => 	SEGMENT_4_OUT,
						clk	=>  clk,
						hold=>  hold_all_seg,
						rst	=>  rst,
						Q	=>  SEGMENT_3_OUT					
					);	
	SEGMEN_2 :
		dff_segment_for_input
			PORT MAP (
						D   => 	SEGMENT_3_OUT,
						clk	=>  clk,
						hold=>  hold_all_seg,
						rst	=>  rst,
						Q	=>  SEGMENT_2_OUT					
					);
	SEGMEN_1 :
		dff_segment_for_input
			PORT MAP (
						D   => 	SEGMENT_2_OUT,
						clk	=>  clk,
						hold=>  hold_all_seg,
						rst	=>  rst,
						Q	=>  SEGMENT_1_OUT					
					);
	SEGMEN_0 :
		dff_segment_for_input
			PORT MAP (
						D   => 	SEGMENT_1_OUT,
						clk	=>  clk,
						hold=>  hold_all_seg,
						rst	=>  rst,
						Q	=>  SEGMENT_0_OUT					
					);	
	END structural;