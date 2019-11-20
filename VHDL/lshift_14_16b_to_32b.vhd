LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lshift_14_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END lshift_14_16b_to_32b;

ARCHITECTURE structural of lshift_14_16b_to_32b IS
BEGIN
		Data_Out(31 DOWNTO 30) 	<= "00";
		Data_Out(29 DOWNTO 14)	<= Data_In;
		Data_Out(13 DOWNTO 0)	<= "00000000000000";
END structural;