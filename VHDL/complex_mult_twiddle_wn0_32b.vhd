LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY complex_mult_twiddle_wn0_32b IS
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END complex_mult_twiddle_wn0_32b;

ARCHITECTURE structural OF complex_mult_twiddle_wn0_32b IS
SIGNAL REAL_A32 : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL IMAG_A32 : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
	REAL_A32			<= A32(31 DOWNTO 16);
	IMAG_A32			<= A32(15 DOWNTO 0);
	R32(31 DOWNTO 16) 	<= REAL_A32;
	R32(15 DOWNTO 0)	<= IMAG_A32;
END structural;

