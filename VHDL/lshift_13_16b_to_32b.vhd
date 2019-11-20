LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lshift_13_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END lshift_13_16b_to_32b;

ARCHITECTURE structural of lshift_13_16b_to_32b IS
BEGIN
		Data_Out(31 DOWNTO 29) 	<= "000";
		Data_Out(28 DOWNTO 13)	<= Data_In;
		Data_Out(12 DOWNTO 0)	<= "0000000000000";
END structural;