LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sgninv_1b IS
	PORT	(
				A		:	IN	STD_LOGIC;
				C_IN	:	IN 	STD_LOGIC;
				R		:	OUT STD_LOGIC;
				P		:	OUT STD_LOGIC
			);
END sgninv_1b;

ARCHITECTURE structural of sgninv_1b IS
BEGIN
	R 		<= 	A XOR C_IN;
	P		<= 	A AND C_IN;
END structural;

