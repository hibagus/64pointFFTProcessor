LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY dff_segment_for_cb IS
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
END dff_segment_for_cb;

ARCHITECTURE structural of dff_segment_for_cb IS
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
SIGNAL DFF_0_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL DFF_1_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL DFF_2_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL DFF_3_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL DFF_4_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL DFF_5_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL DFF_6_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL DFF_7_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	BEGIN
	Q	<=	DFF_0_OUT;
	-- Port Map
	DFF_7 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	=>D1,
						D2	=>D9,
						clk =>clk,
						hold=>hold,
						in_sel=>in_sel,						
						rst =>rst,
						Q   =>DFF_7_OUT
					);
	DFF_6 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	=>DFF_7_OUT,
						D2	=>D8,
						clk =>clk,
						hold=>hold,
						in_sel=>in_sel,						
						rst =>rst,
						Q   =>DFF_6_OUT
					);									
	DFF_5 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	=>DFF_6_OUT,
						D2	=>D7,
						clk =>clk,
						hold=>hold,
						in_sel=>in_sel,						
						rst =>rst,
						Q   =>DFF_5_OUT
					);								
	DFF_4 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	=>DFF_5_OUT,
						D2	=>D6,
						clk =>clk,
						hold=>hold,
						in_sel=>in_sel,						
						rst =>rst,
						Q   =>DFF_4_OUT
					);								
	DFF_3 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	=>DFF_4_OUT,
						D2	=>D5,
						clk =>clk,
						hold=>hold,
						in_sel=>in_sel,	
						rst =>rst,
						Q   =>DFF_3_OUT
					);								
	DFF_2 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	=>DFF_3_OUT,
						D2	=>D4,
						clk =>clk,
						hold=>hold,
						in_sel=>in_sel,
						rst =>rst,
						Q   =>DFF_2_OUT
					);								
	DFF_1 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	=>DFF_2_OUT,
						D2	=>D3,
						clk =>clk,
						hold=>hold,
						in_sel=>in_sel,
						rst =>rst,
						Q   =>DFF_1_OUT
					);								
	DFF_0 :
		dff_with_hold_input_ctrl
			PORT MAP (
						D1	  =>DFF_1_OUT,
						D2	  =>D2,
						clk   =>clk,
						hold  =>hold,
						in_sel=>in_sel,
						rst   =>rst,
						Q     =>DFF_0_OUT
					);																	
	END structural;