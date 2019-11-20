LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bit_adj_32b_to_16b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (31 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (15 DOWNTO 0)
			);
END bit_adj_32b_to_16b;

ARCHITECTURE structural of bit_adj_32b_to_16b IS
COMPONENT adder_cla_16b IS
	PORT	(
				A16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				B16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				R16		:	OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
				C_OUT16	:	OUT STD_LOGIC
			);
END COMPONENT;
SIGNAL TRUNCATE_TEMP : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL ADDER_OUT     : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL ROUNDING_TEMP : STD_LOGIC_VECTOR (15 DOWNTO 0);
BEGIN
		Data_Out     <= ADDER_OUT;
		TRUNCATE_TEMP<= Data_In(27 DOWNTO 12);
		ROUNDING_TEMP<= "000000000000000" & Data_In(11);
		
		
		adder :
			adder_cla_16b
				PORT MAP (
								A16     => TRUNCATE_TEMP,
								B16     => ROUNDING_TEMP,
								R16     => ADDER_OUT
							);
END structural;