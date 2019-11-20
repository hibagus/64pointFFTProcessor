LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lshift_15_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END lshift_15_16b_to_32b;

ARCHITECTURE structural of lshift_15_16b_to_32b IS
BEGIN
		Data_Out(31 DOWNTO 31) 	<= "0";
		Data_Out(30 DOWNTO 15)	<= Data_In;
		Data_Out(14 DOWNTO 0)	<= "000000000000000";
END structural;