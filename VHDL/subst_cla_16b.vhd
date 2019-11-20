LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY subst_cla_16b IS
	PORT	(
				A16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				B16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				R16		:	OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
				C_OUT16	:	OUT STD_LOGIC
			);
END subst_cla_16b;

ARCHITECTURE structural OF subst_cla_16b IS
SIGNAL R_BUFFER : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL P_BUFFER : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL G_BUFFER : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL I_BUFFER : STD_LOGIC_VECTOR (16 DOWNTO 0);
SIGNAL B16NEG	: STD_LOGIC_VECTOR (15 DOWNTO 0);
COMPONENT adder_cla_1b
	PORT	(
				A		:	IN	STD_LOGIC; 
				B		:	IN	STD_LOGIC;
				C_IN	:	IN 	STD_LOGIC;
				R		:	OUT STD_LOGIC;
				P		:	OUT STD_LOGIC;
				G		: 	OUT STD_LOGIC
			);
END COMPONENT;
COMPONENT notgate_16b IS
	PORT 	(
				DIN		:	IN	std_logic_vector (15 DOWNTO 0); -- Data Input
				DOUT	:	OUT	std_logic_vector (15 DOWNTO 0)  -- Data Output
			);
END COMPONENT;
BEGIN
	C_OUT16 	<= I_BUFFER(16);
	R16 		<= R_BUFFER;
	I_BUFFER(0)	<= '1';		
	Not_Gate_Map		:
		notgate_16b
			PORT MAP
				(
					DIN		=>	B16,
					DOUT	=>	B16NEG
				);
	Full_Adder_Map		: 	
		for i in 0 to 15 GENERATE					
			FAX : 	
				adder_cla_1b 
					PORT MAP
						(
							A		=> A16(I),
							B		=> B16NEG(I),
							C_IN 	=> I_BUFFER(I),
							R 		=> R_BUFFER(I),
							P 		=> P_BUFFER(I),
							G		=> G_BUFFER(I)
						);
					I_BUFFER(i+1) 	<= G_BUFFER(I) OR (P_BUFFER(I) AND I_BUFFER(I));
		END GENERATE Full_Adder_Map;
END structural;
