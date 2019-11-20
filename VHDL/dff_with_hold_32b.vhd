LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY dff_with_hold_32b IS
	PORT 	(
				D		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
				rst		:	IN 		STD_LOGIC;
				Q		:	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END dff_with_hold_32b;

ARCHITECTURE structural of dff_with_hold_32b IS
COMPONENT basic_dff_32b IS
	PORT 	(
				D		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
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
SIGNAL DFF_0_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL MUX_0_OUT:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	BEGIN
	Q	<=	DFF_0_OUT;
	-- Port Map
	MUX_0 :
		mux_2to1_32b
			PORT MAP (
						D1	=>D,
						D2	=>DFF_0_OUT,
						Y	=>MUX_0_OUT,
						S	=>hold
					 );
	DFF_0 :
		basic_dff_32b
			PORT MAP (
						D	=>MUX_0_OUT,
						clk =>clk,
						rst =>rst,
						Q   =>DFF_0_OUT
					);
	END structural;