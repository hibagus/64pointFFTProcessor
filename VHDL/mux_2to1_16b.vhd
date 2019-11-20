LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_2to1_16b IS
	PORT 	(
				D1	:	IN	std_logic_vector (15 DOWNTO 0);
				D2	:	IN	std_logic_vector (15 DOWNTO 0);
				Y	:	OUT	std_logic_vector (15 DOWNTO 0);
				S	:	IN	std_logic
			);
END mux_2to1_16b;

ARCHITECTURE behavioural of mux_2to1_16b IS
BEGIN
	WITH S SELECT
		Y <= 	D1 WHEN '0',
				D2 WHEN '1';
END behavioural;