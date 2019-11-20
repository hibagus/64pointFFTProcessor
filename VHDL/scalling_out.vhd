LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY scalling_out IS
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Swap	:	IN	STD_LOGIC;
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END scalling_out;

ARCHITECTURE structural OF scalling_out IS
COMPONENT mux_2to1_32b IS
	PORT 	(
				D1	:	IN	std_logic_vector (31 DOWNTO 0);
				D2	:	IN	std_logic_vector (31 DOWNTO 0);
				Y	:	OUT	std_logic_vector (31 DOWNTO 0);
				S	:	IN	std_logic
			);
END COMPONENT;
COMPONENT rshift_6_16b_to_16b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (15 DOWNTO 0)
			);
END COMPONENT;
SIGNAL REAL_A32 		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL IMAG_A32 		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL REAL_R32 		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL IMAG_R32 		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL MUX_0_OUT		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL REAL_SCALE		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL IMAG_SCALE		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL TEMP_SCALE		: STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
	REAL_A32					<= A32(31 DOWNTO 16);
	IMAG_A32					<= A32(15 DOWNTO 0);
	REAL_R32					<= REAL_SCALE;
	IMAG_R32					<= IMAG_SCALE;
	TEMP_SCALE(31 DOWNTO 16) 	<= REAL_R32;
	TEMP_SCALE(15 DOWNTO 0)		<= IMAG_R32;
	-- Port Mapping
	SCALE_0 :
		rshift_6_16b_to_16b
			PORT MAP 
				(
					Data_In  =>REAL_A32,
					Data_Out =>REAL_SCALE
				);
	SCALE_1 :
		rshift_6_16b_to_16b
			PORT MAP 
				(
					Data_In  =>IMAG_A32,
					Data_Out =>IMAG_SCALE
				);
	MUX_0	:
		mux_2to1_32b
			PORT MAP
				(
					D1	=>A32,
					D2	=>TEMP_SCALE,
					Y	=>R32,
					S	=>Swap
				);
END structural;

