LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY generic_mult_16b IS
	GENERIC (
				Const	:	STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000"
			);
	PORT	(
				Data_In	:	IN	STD_LOGIC_VECTOR(15 DOWNTO 0);
				Data_Out:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
END generic_mult_16b;

ARCHITECTURE structural of generic_mult_16b IS
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
COMPONENT lshift_1_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_2_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_3_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_4_16b_to_32b IS
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
COMPONENT lshift_6_16b_to_32b IS
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
COMPONENT lshift_10_16b_to_32b IS
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
COMPONENT lshift_12_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_13_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_14_16b_to_32b IS
	PORT 	(
				Data_In	:	IN	std_logic_vector (15 DOWNTO 0);
				Data_Out:	OUT	std_logic_vector (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT lshift_15_16b_to_32b IS
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
SIGNAL lshift_1_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_2_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_3_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_4_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_5_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_6_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_7_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_8_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_9_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_10_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_11_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_12_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_13_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_14_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL lshift_15_out 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_0_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_1_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_2_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_3_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_4_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_5_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_6_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_7_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_8_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_9_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_10_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_11_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_12_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_13_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
SIGNAL adder_14_out	 	: STD_LOGIC_VECTOR	(31 DOWNTO 0);
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
	lshift_0_GEN : IF (Const(0)='1') GENERATE
					BEGIN
						lshift_0	:
							lshift_0_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_0_out
									);
					END GENERATE lshift_0_GEN;
	lshift_1_GEN : IF (Const(1)='1') GENERATE
					BEGIN
						lshift_1	:
							lshift_1_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_1_out
									);
					END GENERATE lshift_1_GEN;
	lshift_2_GEN : IF (Const(2)='1') GENERATE
					BEGIN
						lshift_2	:
							lshift_2_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_2_out
									);
					END GENERATE lshift_2_GEN;
	lshift_3_GEN : IF (Const(3)='1') GENERATE
					BEGIN
						lshift_3	:
							lshift_3_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_3_out
									);
					END GENERATE lshift_3_GEN;
	lshift_4_GEN : IF (Const(4)='1') GENERATE
					BEGIN
						lshift_4	:
							lshift_4_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_4_out
									);	
					END GENERATE lshift_4_GEN;
	lshift_5_GEN : IF (Const(5)='1') GENERATE
					BEGIN
						lshift_5	:
							lshift_5_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_5_out
									);	
					END GENERATE lshift_5_GEN;
	lshift_6_GEN : IF (Const(6)='1') GENERATE
					BEGIN
						lshift_6	:
							lshift_6_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_6_out
									);	
					END GENERATE lshift_6_GEN;
	lshift_7_GEN : IF (Const(7)='1') GENERATE
					BEGIN
						lshift_7	:
							lshift_7_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_7_out
									);
					END GENERATE lshift_7_GEN;
	lshift_8_GEN : IF (Const(8)='1') GENERATE
					BEGIN
						lshift_8	:
							lshift_8_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_8_out
									);	
					END GENERATE lshift_8_GEN;
	lshift_9_GEN : IF (Const(9)='1') GENERATE
					BEGIN
						lshift_9	:
							lshift_9_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_9_out
									);	
					END GENERATE lshift_9_GEN;
	lshift_10_GEN : IF (Const(10)='1') GENERATE
					BEGIN
						lshift_10	:
							lshift_10_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_10_out
									);	
					END GENERATE lshift_10_GEN;
	lshift_11_GEN : IF (Const(11)='1') GENERATE
					BEGIN
						lshift_11	:
							lshift_11_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_11_out
									);	
					END GENERATE lshift_11_GEN;
	lshift_12_GEN : IF (Const(12)='1') GENERATE
					BEGIN
						lshift_12	:
							lshift_12_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_12_out
									);		
					END GENERATE lshift_12_GEN;
	lshift_13_GEN : IF (Const(13)='1') GENERATE
					BEGIN
						lshift_13	:
							lshift_13_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_13_out
									);		
					END GENERATE lshift_13_GEN;
	lshift_14_GEN : IF (Const(14)='1') GENERATE
					BEGIN
						lshift_14	:
							lshift_14_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_14_out
									);	
					END GENERATE lshift_14_GEN;
	lshift_15_GEN : IF (Const(15)='1') GENERATE
					BEGIN
						lshift_15	:
							lshift_15_16b_to_32b
							PORT MAP (
										Data_In		=>	mux_0_out,
										Data_Out	=>	lshift_15_out
									);		
					END GENERATE lshift_15_GEN;
	adder_0_BOTH: IF (Const(0)='1' AND Const(1)='1') GENERATE
					BEGIN
						adder_0		:
							adder_cla_32b
							PORT MAP (
										A32	=>	lshift_0_out,
										B32	=>	lshift_1_out,
										R32	=>	adder_0_out
									);
					END GENERATE adder_0_BOTH;
	adder_0_LEFT: IF (Const(0)='1' AND Const(1)='0') GENERATE
					BEGIN
						adder_0_out	<= lshift_0_out;
					END GENERATE adder_0_LEFT;
	adder_0_RIGHT: IF (Const(0)='0' AND Const(1)='1') GENERATE
					BEGIN
						adder_0_out	<= lshift_1_out;
					END GENERATE adder_0_RIGHT;				
	adder_1_BOTH: IF (Const(2)='1' AND Const(3)='1') GENERATE
					BEGIN
						adder_1		:
							adder_cla_32b
							PORT MAP (
										A32	=>	lshift_2_out,
										B32	=>	lshift_3_out,
										R32	=>	adder_1_out
									);
					END GENERATE adder_1_BOTH;
	adder_1_LEFT: IF (Const(2)='1' AND Const(3)='0') GENERATE
					BEGIN
						adder_1_out	<= lshift_2_out;
					END GENERATE adder_1_LEFT;
	adder_1_RIGHT: IF (Const(2)='0' AND Const(3)='1') GENERATE
					BEGIN
						adder_1_out	<= lshift_3_out;
					END GENERATE adder_1_RIGHT;									
	adder_2_BOTH: IF (Const(4)='1' AND Const(5)='1') GENERATE
					BEGIN
						adder_2		:
							adder_cla_32b
							PORT MAP (
										A32	=>	lshift_4_out,
										B32	=>	lshift_5_out,
										R32	=>	adder_2_out
									);
					END GENERATE adder_2_BOTH;
	adder_2_LEFT: IF (Const(4)='1' AND Const(5)='0') GENERATE
					BEGIN
						adder_2_out	<= lshift_4_out;
					END GENERATE adder_2_LEFT;
	adder_2_RIGHT: IF (Const(4)='0' AND Const(5)='1') GENERATE
					BEGIN
						adder_2_out	<= lshift_5_out;
					END GENERATE adder_2_RIGHT;
	adder_3_BOTH: IF (Const(6)='1' AND Const(7)='1') GENERATE
					BEGIN
						adder_3		:
							adder_cla_32b
							PORT MAP (
										A32	=>	lshift_6_out,
										B32	=>	lshift_7_out,
										R32	=>	adder_3_out
									);
					END GENERATE adder_3_BOTH;
	adder_3_LEFT: IF (Const(6)='1' AND Const(7)='0') GENERATE
					BEGIN
						adder_3_out	<= lshift_6_out;
					END GENERATE adder_3_LEFT;
	adder_3_RIGHT: IF (Const(6)='0' AND Const(7)='1') GENERATE
					BEGIN
						adder_3_out	<= lshift_7_out;
					END GENERATE adder_3_RIGHT;
	adder_4_BOTH: IF (Const(8)='1' AND Const(9)='1') GENERATE
					BEGIN
						adder_4		:
							adder_cla_32b
							PORT MAP (
										A32	=>	lshift_8_out,
										B32	=>	lshift_9_out,
										R32	=>	adder_4_out
									);
					END GENERATE adder_4_BOTH;
	adder_4_LEFT: IF (Const(8)='1' AND Const(9)='0') GENERATE
					BEGIN
						adder_4_out	<= lshift_8_out;
					END GENERATE adder_4_LEFT;
	adder_4_RIGHT: IF (Const(8)='0' AND Const(9)='1') GENERATE
					BEGIN
						adder_4_out	<= lshift_9_out;
					END GENERATE adder_4_RIGHT;
	adder_5_BOTH: IF (Const(10)='1' AND Const(11)='1') GENERATE
					BEGIN
						adder_5		:
							adder_cla_32b
							PORT MAP (
										A32	=>	lshift_10_out,
										B32	=>	lshift_11_out,
										R32	=>	adder_5_out
									);
					END GENERATE adder_5_BOTH;
	adder_5_LEFT: IF (Const(10)='1' AND Const(11)='0') GENERATE
					BEGIN
						adder_5_out	<= lshift_10_out;
					END GENERATE adder_5_LEFT;
	adder_5_RIGHT: IF (Const(10)='0' AND Const(11)='1') GENERATE
					BEGIN
						adder_5_out	<= lshift_11_out;
					END GENERATE adder_5_RIGHT;
	adder_6_BOTH: IF (Const(12)='1' AND Const(13)='1') GENERATE
					BEGIN
						adder_6		:
							adder_cla_32b
							PORT MAP (
										A32	=>	lshift_12_out,
										B32	=>	lshift_13_out,
										R32	=>	adder_6_out
									);
					END GENERATE adder_6_BOTH;
	adder_6_LEFT: IF (Const(12)='1' AND Const(13)='0') GENERATE
					BEGIN
						adder_6_out	<= lshift_12_out;
					END GENERATE adder_6_LEFT;
	adder_6_RIGHT: IF (Const(12)='0' AND Const(13)='1') GENERATE
					BEGIN
						adder_6_out	<= lshift_13_out;
					END GENERATE adder_6_RIGHT;	
	adder_7_BOTH: IF (Const(14)='1' AND Const(15)='1') GENERATE
					BEGIN
						adder_7		:
							adder_cla_32b
							PORT MAP (
										A32	=>	lshift_14_out,
										B32	=>	lshift_15_out,
										R32	=>	adder_7_out
									);
					END GENERATE adder_7_BOTH;
	adder_7_LEFT: IF (Const(14)='1' AND Const(15)='0') GENERATE
					BEGIN
						adder_7_out	<= lshift_14_out;
					END GENERATE adder_7_LEFT;
	adder_7_RIGHT: IF (Const(14)='0' AND Const(15)='1') GENERATE
					BEGIN
						adder_7_out	<= lshift_15_out;
					END GENERATE adder_7_RIGHT;				
	adder_8_BOTH: IF ((Const(0)='1' or Const(1)='1') and (Const(2)='1' or Const(3)='1')) GENERATE
					BEGIN
						adder_8		:
							adder_cla_32b
							PORT MAP (
										A32	=>	adder_0_out,
										B32	=>	adder_1_out,
										R32	=>	adder_8_out
									);
					END GENERATE adder_8_BOTH;
	adder_8_LEFT: IF ((Const(0)='1' or Const(1)='1') and (Const(2)='0' and Const(3)='0')) GENERATE
					BEGIN
						adder_8_out	<= adder_0_out;
					END GENERATE adder_8_LEFT;
	adder_8_RIGHT: IF ((Const(0)='0' and Const(1)='0') and (Const(2)='1' or Const(3)='1')) GENERATE
					BEGIN
						adder_8_out	<= adder_1_out;
					END GENERATE adder_8_RIGHT;
	adder_9_BOTH: IF ((Const(4)='1' or Const(5)='1') and (Const(6)='1' or Const(7)='1')) GENERATE
					BEGIN
						adder_9		:
							adder_cla_32b
							PORT MAP (
										A32	=>	adder_2_out,
										B32	=>	adder_3_out,
										R32	=>	adder_9_out
									);
					END GENERATE adder_9_BOTH;
	adder_9_LEFT: IF ((Const(4)='1' or Const(5)='1') and (Const(6)='0' and Const(7)='0')) GENERATE
					BEGIN
						adder_9_out	<= adder_2_out;
					END GENERATE adder_9_LEFT;
	adder_9_RIGHT: IF ((Const(4)='0' and Const(5)='0') and (Const(6)='1' or Const(7)='1')) GENERATE
					BEGIN
						adder_9_out	<= adder_3_out;
					END GENERATE adder_9_RIGHT;
	adder_10_BOTH: IF ((Const(8)='1' or Const(9)='1') and (Const(10)='1' or Const(11)='1')) GENERATE
					BEGIN
						adder_10		:
							adder_cla_32b
							PORT MAP (
										A32	=>	adder_4_out,
										B32	=>	adder_5_out,
										R32	=>	adder_10_out
									);
					END GENERATE adder_10_BOTH;
	adder_10_LEFT: IF ((Const(8)='1' or Const(9)='1') and (Const(10)='0' and Const(11)='0')) GENERATE
					BEGIN
						adder_10_out	<= adder_4_out;
					END GENERATE adder_10_LEFT;
	adder_10_RIGHT: IF ((Const(8)='0' and Const(9)='0') and (Const(10)='1' or Const(11)='1')) GENERATE
					BEGIN
						adder_10_out	<= adder_5_out;
					END GENERATE adder_10_RIGHT;						
	adder_11_BOTH: IF ((Const(12)='1' or Const(13)='1') and (Const(14)='1' or Const(15)='1')) GENERATE
					BEGIN
						adder_11		:
							adder_cla_32b
							PORT MAP (
										A32	=>	adder_6_out,
										B32	=>	adder_7_out,
										R32	=>	adder_11_out
									);
					END GENERATE adder_11_BOTH;
	adder_11_LEFT: IF ((Const(12)='1' or Const(13)='1') and (Const(14)='0' and Const(15)='0')) GENERATE
					BEGIN
						adder_11_out	<= adder_6_out;
					END GENERATE adder_11_LEFT;
	adder_11_RIGHT: IF ((Const(12)='0' and Const(13)='0') and (Const(14)='1' or Const(15)='1')) GENERATE
					BEGIN
						adder_11_out	<= adder_7_out;
					END GENERATE adder_11_RIGHT;
	
	adder_12_BOTH: IF (	(Const(0)='1' or Const(1)='1' or Const(2)='1' or Const(3)='1') and 
						(Const(4)='1' or Const(5)='1' or Const(6)='1' or Const(7)='1') ) GENERATE
					BEGIN
						adder_12		:
							adder_cla_32b
							PORT MAP (
										A32	=>	adder_8_out,
										B32	=>	adder_9_out,
										R32	=>	adder_12_out
									);
					END GENERATE adder_12_BOTH;
	adder_12_LEFT: IF (	(Const(0)='1' or Const(1)='1' or Const(2)='1' or Const(3)='1') and 
						(Const(4)='0' and Const(5)='0' and Const(6)='0' and Const(7)='0') ) GENERATE
					BEGIN
						adder_12_out	<= adder_8_out;
					END GENERATE adder_12_LEFT;
	adder_12_RIGHT: IF ( (Const(0)='0' and Const(1)='0' and Const(2)='0' and Const(3)='0') and 
						 (Const(4)='1' or Const(5)='1' or Const(6)='1' or Const(7)='1') ) GENERATE
					BEGIN
						adder_12_out	<= adder_9_out;
					END GENERATE adder_12_RIGHT;
					
	adder_13_BOTH: IF (	(Const(8)='1' or Const(9)='1' or Const(10)='1' or Const(11)='1') and 
						(Const(12)='1' or Const(13)='1' or Const(14)='1' or Const(15)='1') ) GENERATE
					BEGIN
						adder_13		:
							adder_cla_32b
							PORT MAP (
										A32	=>	adder_10_out,
										B32	=>	adder_11_out,
										R32	=>	adder_13_out
									);
					END GENERATE adder_13_BOTH;
	adder_13_LEFT: IF (	(Const(8)='1' or Const(9)='1' or Const(10)='1' or Const(11)='1') and 
						(Const(12)='0' and Const(13)='0' and Const(14)='0' and Const(15)='0') ) GENERATE
					BEGIN
						adder_13_out	<= adder_10_out;
					END GENERATE adder_13_LEFT;
	adder_13_RIGHT: IF ( (Const(8)='0' and Const(9)='0' and Const(10)='0' and Const(11)='0') and 
						 (Const(12)='1' or Const(13)='1' or Const(14)='1' or Const(15)='1') ) GENERATE
					BEGIN
						adder_13_out	<= adder_11_out;
					END GENERATE adder_13_RIGHT;			
	adder_14_BOTH: IF (	(Const(0)='1' or Const(1)='1' or Const(2)='1' or Const(3)='1' or
						 Const(4)='1' or Const(5)='1' or Const(6)='1' or Const(7)='1') and 
						(Const(8)='1' or Const(9)='1' or Const(10)='1' or Const(11)='1' or
						 Const(12)='1' or Const(13)='1' or Const(14)='1' or Const(15)='1')) GENERATE
					BEGIN
						adder_14		:
							adder_cla_32b
							PORT MAP (
										A32	=>	adder_12_out,
										B32	=>	adder_13_out,
										R32	=>	adder_14_out
									);
					END GENERATE adder_14_BOTH;
	adder_14_LEFT: IF (	(Const(0)='1' or Const(1)='1' or Const(2)='1' or Const(3)='1' or
						 Const(4)='1' or Const(5)='1' or Const(6)='1' or Const(7)='1') and 
						(Const(8)='0' and Const(9)='0' and Const(10)='0' and Const(11)='0' and
						 Const(12)='0' and Const(13)='0' and Const(14)='0' and Const(15)='0')) GENERATE
					BEGIN
						adder_14_out	<= adder_12_out;
					END GENERATE adder_14_LEFT;
	adder_14_RIGHT: IF ((Const(0)='0' and Const(1)='0' and Const(2)='0' and Const(3)='0' and
						 Const(4)='0' and Const(5)='0' and Const(6)='0' and Const(7)='0') and 
						(Const(8)='1' or Const(9)='1' or Const(10)='1' or Const(11)='1' or
						 Const(12)='1' or Const(13)='1' or Const(14)='1' or Const(15)='1')) GENERATE
					BEGIN
						adder_14_out	<= adder_13_out;
					END GENERATE adder_14_RIGHT;
	
	adder_NONE: 	IF ((Const(0)='0' and Const(1)='0' and Const(2)='0' and Const(3)='0' and
						 Const(4)='0' and Const(5)='0' and Const(6)='0' and Const(7)='0') and 
						(Const(8)='0' and Const(9)='0' and Const(10)='0' and Const(11)='0' and
						 Const(12)='0' and Const(13)='0' and Const(14)='0' and Const(15)='0')) GENERATE
					BEGIN
						adder_14_out	<= "00000000000000000000000000000000";
					END GENERATE adder_NONE;
	bitadj		:
		bit_adj_32b_to_16b
			PORT MAP (
						Data_In		=>	adder_14_out,
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

