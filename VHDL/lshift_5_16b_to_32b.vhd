LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lshift_5_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END lshift_5_16b_to_32b;

ARCHITECTURE structural of lshift_5_16b_to_32b IS
BEGIN
		Data_Out(31 DOWNTO 21) 	<= "00000000000";
		Data_Out(20 DOWNTO 5)	<= Data_In;
		Data_Out(4 DOWNTO 0)	<= "00000";
END structural;