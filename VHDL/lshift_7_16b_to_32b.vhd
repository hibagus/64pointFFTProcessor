LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lshift_7_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END lshift_7_16b_to_32b;

ARCHITECTURE structural of lshift_7_16b_to_32b IS
BEGIN
		Data_Out(31 DOWNTO 23) 	<= "000000000";
		Data_Out(22 DOWNTO 7)	<= Data_In;
		Data_Out(6 DOWNTO 0)	<= "0000000";
END structural;