LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lshift_12_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END lshift_12_16b_to_32b;

ARCHITECTURE structural of lshift_12_16b_to_32b IS
BEGIN
		Data_Out(31 DOWNTO 28) 	<= "0000";
		Data_Out(27 DOWNTO 12)	<= Data_In;
		Data_Out(11 DOWNTO 0)	<= "000000000000";
END structural;