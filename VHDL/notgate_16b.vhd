LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY notgate_16b IS
	PORT 	(
				DIN		:	IN	std_logic_vector (15 DOWNTO 0); -- Data Input
				DOUT	:	OUT	std_logic_vector (15 DOWNTO 0)  -- Data Output
			);
END notgate_16b;

ARCHITECTURE structural of notgate_16b IS
SIGNAL data_buffer : std_logic_vector (15 DOWNTO 0);
BEGIN
	DOUT <= data_buffer;
	PROCESS (data_buffer, DIN)
	BEGIN
		FOR I in 0 to 15 LOOP
			data_buffer(I)<=NOT DIN(I);
		END LOOP;
	END PROCESS;
END structural;