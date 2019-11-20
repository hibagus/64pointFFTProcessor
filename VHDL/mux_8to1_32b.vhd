LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_8to1_32b IS
	PORT 	(
				D1	:	IN	std_logic_vector (31 DOWNTO 0);
				D2	:	IN	std_logic_vector (31 DOWNTO 0);
				D3	:	IN	std_logic_vector (31 DOWNTO 0);
				D4	:	IN	std_logic_vector (31 DOWNTO 0);
				D5	:	IN	std_logic_vector (31 DOWNTO 0);
				D6	:	IN	std_logic_vector (31 DOWNTO 0);
				D7	:	IN	std_logic_vector (31 DOWNTO 0);
				D8	:	IN	std_logic_vector (31 DOWNTO 0);
				Y	:	OUT	std_logic_vector (31 DOWNTO 0);
				S	:	IN	std_logic_vector (2 DOWNTO 0)
			);
END mux_8to1_32b;

ARCHITECTURE behavioural of mux_8to1_32b IS
BEGIN
	WITH S SELECT
		Y <= 	D1 WHEN "000",
				D2 WHEN "001",
				D3 WHEN "010",
				D4 WHEN "011",
				D5 WHEN "100",
				D6 WHEN "101",
				D7 WHEN "110",
				D8 WHEN "111",
				D1 WHEN OTHERS;
END behavioural;