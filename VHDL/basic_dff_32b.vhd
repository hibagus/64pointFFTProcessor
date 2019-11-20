LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY basic_dff_32b IS
	PORT 	(
				D		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				rst		:	IN 		STD_LOGIC;
				Q		:	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END basic_dff_32b;

ARCHITECTURE behavioral of basic_dff_32b IS
SIGNAL Q_temp	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	BEGIN
	Q	<=	Q_temp;
	PROCESS(D, clk, rst)
	BEGIN
		IF ((clk'EVENT) AND (clk='1')) THEN
			IF (rst='1') THEN
				Q_temp <= std_logic_vector(to_unsigned(0,32));
			ELSE
				Q_temp <= D;
			END IF;
		END IF;
	END PROCESS;
	END behavioral;