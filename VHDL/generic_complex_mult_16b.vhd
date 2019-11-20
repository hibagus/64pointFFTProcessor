LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY generic_complex_mult_16b IS
	GENERIC (
				C_PLUS_S:	STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
				C_ONLY  :   STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
				C_MIN_S :	STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000"
				
			);
	PORT	(
				REAL_A32:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				IMAG_A32:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				REAL_R32:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0);
				IMAG_R32:	OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
			);
END generic_complex_mult_16b;

ARCHITECTURE structural OF generic_complex_mult_16b IS
COMPONENT generic_mult_16b IS
	GENERIC (
				Const	:	STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000"
			);
	PORT	(
				Data_In	:	IN	STD_LOGIC_VECTOR(15 DOWNTO 0);
				Data_Out:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
END COMPONENT;
COMPONENT adder_cla_16b IS
	PORT	(
				A16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				B16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				R16		:	OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
				C_OUT16	:	OUT STD_LOGIC
			);
END COMPONENT;
COMPONENT subst_cla_16b IS
	PORT	(
				A16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				B16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				R16		:	OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
				C_OUT16	:	OUT STD_LOGIC
			);
END COMPONENT;

SIGNAL MULT_C_Plus_S_Out: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL MULT_C_Min_S_Out : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL MULT_C_Out		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL SUBSTR_0_OUT		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL ADDER_1_OUT		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL SUBSTR_1_OUT		: STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
	REAL_R32			<= ADDER_1_OUT;
	IMAG_R32			<= SUBSTR_1_OUT;
	
	-- Port Mapping
	MULT_C_PLUS_S :
		generic_mult_16b
			GENERIC MAP
				(
					Const		=> C_PLUS_S
				)
			PORT MAP
				(
					Data_In		=> REAL_A32,
					Data_Out	=> MULT_C_Plus_S_Out
				);
	MULT_C_MIN_S :
		generic_mult_16b
			GENERIC MAP
				(
					Const		=> C_MIN_S
				)
			PORT MAP
				(
					Data_In		=> IMAG_A32,
					Data_Out	=> MULT_C_Min_S_Out
				);				
	SUBSTR_0 :
		subst_cla_16b
			PORT MAP
				(
					A16	=> REAL_A32,
					B16	=> IMAG_A32,
					R16	=> SUBSTR_0_OUT
				);		
	MULT_C_ONLY :
		generic_mult_16b
			GENERIC MAP
				(
					Const		=> C_ONLY
				)
			PORT MAP
				(
					Data_In		=> SUBSTR_0_OUT,
					Data_Out	=> MULT_C_Out
				);								
	SUBSTR_1 :
		subst_cla_16b
			PORT MAP
				(
					A16	=> MULT_C_Plus_S_Out,
					B16	=> MULT_C_Out,
					R16	=> SUBSTR_1_OUT
				);
	ADDER_1 :
		adder_cla_16b
			PORT MAP
				(
					A16	=> MULT_C_Min_S_Out,
					B16	=> MULT_C_Out,
					R16	=> ADDER_1_OUT
				);
END structural;

