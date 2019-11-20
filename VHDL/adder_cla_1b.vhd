LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder_cla_1b IS
	PORT	(
				A		:	IN	STD_LOGIC;
				B		:	IN	STD_LOGIC;
				C_IN	:	IN 	STD_LOGIC;
				R		:	OUT STD_LOGIC;
				P		:	OUT STD_LOGIC;
				G		: 	OUT STD_LOGIC
			);
END adder_cla_1b;

ARCHITECTURE structural of adder_cla_1b IS
BEGIN
	R 		<= 	A XOR B XOR C_IN;
	P		<= 	A OR B;
	G		<= 	A AND B;
END structural;

