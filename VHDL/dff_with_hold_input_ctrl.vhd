LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY dff_with_hold_input_ctrl IS
	PORT 	(
				D1		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D2		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
				in_sel	:	IN		STD_LOGIC;
				rst		:	IN 		STD_LOGIC;
				Q		:	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END dff_with_hold_input_ctrl;

ARCHITECTURE structural of dff_with_hold_input_ctrl IS
COMPONENT dff_with_hold_32b IS
	PORT 	(
				D		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
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
SIGNAL DFF_1_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL MUX_1_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	BEGIN
	Q	<=	DFF_1_OUT;
	-- Port Map
	MUX_1 :
		mux_2to1_32b
			PORT MAP (
						D1	=>D1,
						D2	=>D2,
						Y	=>MUX_1_OUT,
						S	=>in_sel
					 );
	DFF_1 :
		dff_with_hold_32b
			PORT MAP (
						D	=>MUX_1_OUT,
						clk =>clk,
						hold=>hold,
						rst =>rst,
						Q   =>DFF_1_OUT
					);
	END structural;