LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY real_imaginary_interchange IS
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Swap	:	IN	STD_LOGIC;
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END real_imaginary_interchange;

ARCHITECTURE structural OF real_imaginary_interchange IS
COMPONENT mux_2to1_16b IS
	PORT 	(
				D1	:	IN	std_logic_vector (15 DOWNTO 0);
				D2	:	IN	std_logic_vector (15 DOWNTO 0);
				Y	:	OUT	std_logic_vector (15 DOWNTO 0);
				S	:	IN	std_logic
			);
END COMPONENT;

SIGNAL REAL_A32 		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL IMAG_A32 		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL REAL_R32 		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL IMAG_R32 		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL MUX_0_OUT		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL MUX_1_OUT		: STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
	REAL_A32			<= A32(31 DOWNTO 16);
	IMAG_A32			<= A32(15 DOWNTO 0);
	REAL_R32			<= MUX_0_OUT;
	IMAG_R32			<= MUX_1_OUT;
	R32(31 DOWNTO 16) 	<= REAL_R32;
	R32(15 DOWNTO 0)	<= IMAG_R32;
	
	
	-- Port Mapping
	MUX_0	:
		mux_2to1_16b
			PORT MAP
				(
					D1	=>REAL_A32,
					D2	=>IMAG_A32,
					Y	=>MUX_0_OUT,
					S	=>Swap
				);
	MUX_1	:
		mux_2to1_16b
			PORT MAP
				(
					D1	=>IMAG_A32,
					D2	=>REAL_A32,
					Y	=>MUX_1_OUT,
					S	=>Swap
				);	
END structural;

