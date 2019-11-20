LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY const_mult_cla_16b_sqrtof2 IS
	PORT	(
				Data_In	:	IN	STD_LOGIC_VECTOR(15 DOWNTO 0);
				Data_Out:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
END const_mult_cla_16b_sqrtof2;

ARCHITECTURE structural of const_mult_cla_16b_sqrtof2 IS
COMPONENT adder_cla_32b IS
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				B32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
				C_OUT32	:	OUT STD_LOGIC
			);
END COMPONENT;
COMPONENT sgninv_16b IS
	PORT	(
				A16		:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0);
				R16		:	OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
				C_OUT16 :	OUT STD_LOGIC
			);
END COMPONENT;
COMPONENT bit_adj_32b_to_16b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (31 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (15 DOWNTO 0)
			);
END COMPONENT;
COMPONENT mux_2to1_16b IS
	PORT 	(
				D1	:	IN	std_logic_vector (15 DOWNTO 0);
				D2	:	IN	std_logic_vector (15 DOWNTO 0);
				Y	:	OUT	std_logic_vector (15 DOWNTO 0);
				S	:	IN	std_logic
			);
END COMPONENT;
COMPONENT lshift_0_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_5_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_7_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_9_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_10_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_12_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;

SIGNAL mux_0_out 		: STD_LOGIC_VECTOR	(15 DOWNTO 0);
SIGNAL mux_1_out 		: STD_LOGIC_VECTOR	(15 DOWNTO 0);
SIGNAL sgninv_0_out 	: STD_LOGIC_VECTOR 	(15 DOWNTO 0);
SIGNAL sgninv_1_out 	: STD_LOGIC_VECTOR 	(15 DOWNTO 0);
SIGNAL lshift_0_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_5_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_7_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_9_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_10_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_12_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_0_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_1_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_2_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_3_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_4_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL bitadj_out		: STD_LOGIC_VECTOR  (15 DOWNTO 0);

BEGIN
	Data_Out	<= mux_1_out;
	-- Port Mapping
	sgninv_0	:
		sgninv_16b
			PORT MAP (
						A16	=>	Data_In,
						R16 =>	sgninv_0_out
					);
	mux_0		:
		mux_2to1_16b
			PORT MAP (
						D1	=>	Data_In,
						D2	=>	sgninv_0_out,
						Y	=>	mux_0_out,
						S	=>	Data_In(15)
					);
	lshift_0	:
		lshift_0_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_0_out
					);
	lshift_5	:
		lshift_5_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_5_out
					);
	lshift_7	:
		lshift_7_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_7_out
					);
	lshift_9	:
		lshift_9_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_9_out
					);
	lshift_10	:
		lshift_10_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_10_out
					);
	lshift_12	:
		lshift_12_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_12_out
					);
	adder_0		:
		adder_cla_32b
			PORT MAP (
						A32	=>	lshift_0_out,
						B32	=>	lshift_5_out,
						R32	=>	adder_0_out
					);
	adder_1		:
		adder_cla_32b
			PORT MAP (
						A32	=>	lshift_7_out,
						B32	=>	lshift_9_out,
						R32	=>	adder_1_out
					);
	adder_2		:
		adder_cla_32b
			PORT MAP (
						A32	=>	lshift_10_out,
						B32	=>	lshift_12_out,
						R32	=>	adder_2_out
					);
	adder_3		:
		adder_cla_32b
			PORT MAP (
						A32	=>	adder_0_out,
						B32	=>	adder_1_out,
						R32	=>	adder_3_out
					);
	adder_4		:
		adder_cla_32b
			PORT MAP (
						A32	=>	adder_3_out,
						B32	=>	adder_2_out,
						R32	=>	adder_4_out
					);
	bitadj		:
		bit_adj_32b_to_16b
			PORT MAP (
						Data_In		=>	adder_4_out,
						Data_Out	=>	bitadj_out
					);	
	sgninv_1	:
		sgninv_16b
			PORT MAP (
						A16	=>	bitadj_out,
						R16 =>	sgninv_1_out
					);
	mux_1		:
		mux_2to1_16b
			PORT MAP (
						D1	=>	bitadj_out,
						D2	=>	sgninv_1_out,
						Y	=>	mux_1_out,
						S	=>	Data_In(15)
					);
END structural;

