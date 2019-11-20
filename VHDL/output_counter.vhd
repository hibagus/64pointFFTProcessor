LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

ENTITY output_counter IS
	PORT	(
				clk		  :	IN	STD_LOGIC;
				rst		  :	IN	STD_LOGIC;
				dataind   :	IN  STD_LOGIC;
				counter_o : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
				datavalid :	OUT STD_LOGIC
			);
END output_counter;

ARCHITECTURE behavioral OF output_counter IS
TYPE FSMSTATE IS (
	idle, 
	counting
	);

SIGNAL currentstate	: FSMSTATE;
SIGNAL counter		: STD_LOGIC_VECTOR (5 DOWNTO 0);
	BEGIN
    counter_o <= counter;
	PROCESS(clk,rst,currentstate,dataind)
	BEGIN
		IF rst='1' THEN
			currentstate <= idle;
		ELSE
			IF ((clk'EVENT) AND (clk='1'))  THEN
				CASE currentstate IS
					WHEN idle 			 =>
						IF (dataind='1') THEN
							currentstate <= counting;
							counter		 <= "000000";
							datavalid   <= '1';
						ELSE
							currentstate <= currentstate;
							counter		 <= "000000";
							datavalid   <= '0';
						END IF;
					WHEN counting		 =>
						IF (counter="111110") THEN
							currentstate <= idle;
							counter		 <= counter + '1';
							datavalid   <= '1';
						ELSE
							currentstate <= counting;
							counter		 <= counter + '1';
							datavalid   <= '1';
						END IF;
				END CASE;
			ELSE
				currentstate <= currentstate;
			END IF;
		END IF;		
	END PROCESS;
END behavioral;
