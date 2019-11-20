LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

ENTITY input_counter IS
	PORT	(
				clk		  :	IN	STD_LOGIC;
				rst		  :	IN	STD_LOGIC;
				datastart :	IN  STD_LOGIC;
				counter_o : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
				mastertrig:	OUT STD_LOGIC
			);
END input_counter;

ARCHITECTURE behavioral OF input_counter IS
TYPE FSMSTATE IS (
	idle, 
	counting
	);

SIGNAL currentstate	: FSMSTATE;
SIGNAL counter		: STD_LOGIC_VECTOR (5 DOWNTO 0);
	BEGIN
    counter_o <= counter;
	PROCESS(clk,rst,currentstate,datastart)
	BEGIN
		IF rst='1' THEN
			currentstate <= idle;
		ELSE
			IF ((clk'EVENT) AND (clk='1'))  THEN
				CASE currentstate IS
					WHEN idle 			 =>
						IF (datastart='1') THEN
							currentstate <= counting;
							counter		 <= "000000";
							mastertrig   <= '0';
						ELSE
							currentstate <= currentstate;
							counter		 <= "000000";
							mastertrig   <= '0';
						END IF;
					WHEN counting		 =>
						IF (counter="110101") THEN
							currentstate <= counting;
							counter		 <= counter + '1';
							mastertrig   <= '1';
						ELSIF (counter="111110") THEN
							currentstate <= idle;
							counter		 <= counter + '1';
							mastertrig   <= '0';
						ELSE
							currentstate <= counting;
							counter		 <= counter + '1';
							mastertrig   <= '0';
						END IF;
				END CASE;
			ELSE
				currentstate <= currentstate;
			END IF;
		END IF;		
	END PROCESS;
END behavioral;
