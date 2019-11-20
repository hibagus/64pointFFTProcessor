LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rshift_6_16b_to_16b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (15 DOWNTO 0)
			);
END rshift_6_16b_to_16b;

ARCHITECTURE structural of rshift_6_16b_to_16b IS
BEGIN
		Data_Out <= Data_In(15) & Data_In(15) & Data_In(15) &
					Data_In(15) & Data_In(15) & Data_In(15) & 
					Data_In (15 DOWNTO 6);
END structural;