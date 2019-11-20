LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_2to1_32b IS
	PORT 	(
				D1	:	IN	std_logic_vector (31 DOWNTO 0);
				D2	:	IN	std_logic_vector (31 DOWNTO 0);
				Y	:	OUT	std_logic_vector (31 DOWNTO 0);
				S	:	IN	std_logic
			);
END mux_2to1_32b;

ARCHITECTURE behavioural of mux_2to1_32b IS
	BEGIN
		WITH S SELECT
			Y <= 	D1 WHEN '0',
					D2 WHEN '1',
					D1 WHEN OTHERS;
	END behavioural;