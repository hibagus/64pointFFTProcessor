LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY output_circuit IS
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
				hold_all_seg   :	IN		STD_LOGIC;
				in_ctrl_all_seg:    IN		STD_LOGIC;
				mode  		   :    IN		STD_LOGIC;
				rst		       :	IN 		STD_LOGIC;
				Q		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END output_circuit;

ARCHITECTURE structural of output_circuit IS
COMPONENT dff_segment_for_output IS
	PORT 	(
				D7		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D1		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
				in_sel  :   IN		STD_LOGIC;
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
COMPONENT real_imaginary_interchange IS
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Swap	:	IN	STD_LOGIC;
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT scalling_out IS
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Swap	:	IN	STD_LOGIC;
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;

SIGNAL SWAP_OUT	       :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SCALE_OUT	   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL LEAD_BUF_OUT    :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_0_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_1_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_2_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_3_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_4_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_5_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL SEGMENT_6_OUT   :   STD_LOGIC_VECTOR (31 DOWNTO 0);
	BEGIN
	Q	           <=	SCALE_OUT;
	-- Port Map
	LEAD_BUF :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	  =>std_logic_vector(to_unsigned(0,32)),
						D2    =>D8,
						clk   =>clk,
						hold  =>hold_all_seg,
						in_sel=>in_ctrl_all_seg,
						rst   =>rst,
						Q     =>LEAD_BUF_OUT
					);
	SEGMEN_6 :
		dff_segment_for_output
			PORT MAP (
						D7		=>LEAD_BUF_OUT,
						D1		=>D7,
						clk		=>clk,
						hold	=>hold_all_seg,
						in_sel	=>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_6_OUT
					);
	SEGMEN_5 :
		dff_segment_for_output
			PORT MAP (
						D7		=>SEGMENT_6_OUT,
						D1		=>D6,
						clk		=>clk,
						hold	=>hold_all_seg,
						in_sel	=>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_5_OUT
					);	
	SEGMEN_4 :
		dff_segment_for_output
			PORT MAP (
						D7		=>SEGMENT_5_OUT,
						D1		=>D5,
						clk		=>clk,
						hold	=>hold_all_seg,
						in_sel	=>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_4_OUT
					);	
	SEGMEN_3 :
		dff_segment_for_output
			PORT MAP (
						D7		=>SEGMENT_4_OUT,
						D1		=>D4,
						clk		=>clk,
						hold	=>hold_all_seg,
						in_sel	=>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_3_OUT
					);	
	SEGMEN_2 :
		dff_segment_for_output
			PORT MAP (
						D7		=>SEGMENT_3_OUT,
						D1		=>D3,
						clk		=>clk,
						hold	=>hold_all_seg,
						in_sel	=>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_2_OUT
					);	
	SEGMEN_1 :
		dff_segment_for_output
			PORT MAP (
						D7		=>SEGMENT_2_OUT,
						D1		=>D2,
						clk		=>clk,
						hold	=>hold_all_seg,
						in_sel	=>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_1_OUT
					);	
	SEGMEN_0 :
		dff_segment_for_output
			PORT MAP (
						D7		=>SEGMENT_1_OUT,
						D1		=>D1,
						clk		=>clk,
						hold	=>hold_all_seg,
						in_sel	=>in_ctrl_all_seg,
						rst		=>rst,
						Q		=>SEGMENT_0_OUT
					);					
    SWAP :
		real_imaginary_interchange
			PORT MAP (
						A32	=>SEGMENT_0_OUT,
						Swap=>mode,
						R32 =>SWAP_OUT
					);
	SCALE :
		scalling_out
			PORT MAP (
						A32	=>SWAP_OUT,
						Swap=>mode,
						R32 =>SCALE_OUT
					);
	END structural;