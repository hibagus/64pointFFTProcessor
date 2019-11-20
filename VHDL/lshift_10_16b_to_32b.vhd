LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lshift_10_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END lshift_10_16b_to_32b;

ARCHITECTURE structural of lshift_10_16b_to_32b IS
BEGIN
		Data_Out(31 DOWNTO 26) 	<= "000000";
		Data_Out(25 DOWNTO 10)	<= Data_In;
		Data_Out(9 DOWNTO 0)	<= "0000000000";
END structural;