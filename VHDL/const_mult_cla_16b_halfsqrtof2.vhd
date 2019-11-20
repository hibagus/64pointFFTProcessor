LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY const_mult_cla_16b_halfsqrtof2 IS
	PORT	(
				Data_In	:	IN	STD_LOGIC_VECTOR(15 DOWNTO 0);
				Data_Out:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
END const_mult_cla_16b_halfsqrtof2;

ARCHITECTURE structural of const_mult_cla_16b_halfsqrtof2 IS
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
COMPONENT lshift_4_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_6_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_8_16b_to_32b IS
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
COMPONENT lshift_11_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;

SIGNAL mux_0_out 		: STD_LOGIC_VECTOR	(15 DOWNTO 0);
SIGNAL mux_1_out 		: STD_LOGIC_VECTOR	(15 DOWNTO 0);
SIGNAL sgninv_0_out 	: STD_LOGIC_VECTOR 	(15 DOWNTO 0);
SIGNAL sgninv_1_out 	: STD_LOGIC_VECTOR 	(15 DOWNTO 0);
SIGNAL lshift_4_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_6_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_8_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_9_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_11_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_0_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_1_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_2_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_3_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
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
	lshift_4	:
		lshift_4_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_4_out
					);
	lshift_6	:
		lshift_6_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_6_out
					);
	lshift_8	:
		lshift_8_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_8_out
					);
	lshift_9	:
		lshift_9_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_9_out
					);
	lshift_11	:
		lshift_11_16b_to_32b
			PORT MAP (
						Data_In		=>	mux_0_out,
						Data_Out	=>	lshift_11_out
					);
	adder_0		:
		adder_cla_32b
			PORT MAP (
						A32	=>	lshift_6_out,
						B32	=>	lshift_8_out,
						R32	=>	adder_0_out
					);
	adder_1		:
		adder_cla_32b
			PORT MAP (
						A32	=>	lshift_9_out,
						B32	=>	lshift_11_out,
						R32	=>	adder_1_out
					);
	adder_2		:
		adder_cla_32b
			PORT MAP (
						A32	=>	lshift_4_out,
						B32	=>	adder_0_out,
						R32	=>	adder_2_out
					);
	adder_3		:
		adder_cla_32b
			PORT MAP (
						A32	=>	adder_2_out,
						B32	=>	adder_1_out,
						R32	=>	adder_3_out
					);
	bitadj		:
		bit_adj_32b_to_16b
			PORT MAP (
						Data_In		=>	adder_3_out,
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

