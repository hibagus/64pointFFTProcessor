LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY interdimensional_multiplier IS
	PORT	(
				clk				:	IN	STD_LOGIC;
				rst				:	IN  STD_LOGIC;
				SET_0_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_1_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_2_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_3_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_4_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_5_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_6_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_7_IN		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Shuf_Ctrl_1		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Shuf_Ctrl_2		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Shuf_Ctrl_3		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Shuf_Ctrl_4		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Shuf_Ctrl_5		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Shuf_Ctrl_6		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Shuf_Ctrl_7		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Shuf_Ctrl_8		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Type_Sel_1		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Type_Sel_2		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Type_Sel_3		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Type_Sel_4		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Type_Sel_5		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Type_Sel_6		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Type_Sel_7		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Type_Sel_8		:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_Sel_0	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_Sel_1	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_Sel_2	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_Sel_3	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_Sel_4	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_Sel_5	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_Sel_6	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_Sel_7	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				DeShuf_Ctrl_0	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				DeShuf_Ctrl_1	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				DeShuf_Ctrl_2	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				DeShuf_Ctrl_3	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				DeShuf_Ctrl_4	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				DeShuf_Ctrl_5	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				DeShuf_Ctrl_6	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				DeShuf_Ctrl_7	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				Bypass_EN_0		:	IN 	STD_LOGIC;
				Bypass_EN_1		:	IN 	STD_LOGIC;
				Bypass_EN_2		:	IN 	STD_LOGIC;
				Bypass_EN_3		:	IN 	STD_LOGIC;
				Bypass_EN_4		:	IN 	STD_LOGIC;
				Bypass_EN_5		:	IN 	STD_LOGIC;
				Bypass_EN_6		:	IN 	STD_LOGIC;
				Bypass_EN_7		:	IN 	STD_LOGIC;
				Hold_Ctrl_0		:	IN  STD_LOGIC;
				Hold_Ctrl_1		:	IN  STD_LOGIC;
				Hold_Ctrl_2		:	IN  STD_LOGIC;
				Hold_Ctrl_3		:	IN  STD_LOGIC;
				Hold_Ctrl_4		:	IN  STD_LOGIC;
				Hold_Ctrl_5		:	IN  STD_LOGIC;
				Hold_Ctrl_6		:	IN  STD_LOGIC;
				Hold_Ctrl_7		:	IN  STD_LOGIC;
				DFF_Ctrl_0		:	IN  STD_LOGIC;
				DFF_Ctrl_1		:	IN  STD_LOGIC;
				DFF_Ctrl_2		:	IN  STD_LOGIC;
				DFF_Ctrl_3		:	IN  STD_LOGIC;
				DFF_Ctrl_4		:	IN  STD_LOGIC;
				DFF_Ctrl_5		:	IN  STD_LOGIC;
				DFF_Ctrl_6		:	IN  STD_LOGIC;
				DFF_Ctrl_7		:	IN  STD_LOGIC;
				SET_0_OUT		:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_1_OUT		:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_2_OUT		:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_3_OUT		:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_4_OUT		:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_5_OUT		:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_6_OUT		:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0);
				SET_7_OUT		:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END interdimensional_multiplier;

ARCHITECTURE structural OF interdimensional_multiplier IS
COMPONENT generic_complex_mult_block IS
	GENERIC (
				C_PLUS_S:	STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
				C_ONLY  :   STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000";
				C_MIN_S :	STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000000"
				
			);
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				TYPESEL :	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT bypass_32b IS
	PORT	(
				A32		:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0);
				TYPESEL :	IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
				R32		:	OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT mux_2to1_32b IS
	PORT 	(
				D1	:	IN	std_logic_vector (31 DOWNTO 0);
				D2	:	IN	std_logic_vector (31 DOWNTO 0);
				Y	:	OUT	std_logic_vector (31 DOWNTO 0);
				S	:	IN	std_logic
			);
END COMPONENT;
COMPONENT mux_8to1_32b IS
	PORT 	(
				D1	:	IN	std_logic_vector (31 DOWNTO 0);
				D2	:	IN	std_logic_vector (31 DOWNTO 0);
				D3	:	IN	std_logic_vector (31 DOWNTO 0);
				D4	:	IN	std_logic_vector (31 DOWNTO 0);
				D5	:	IN	std_logic_vector (31 DOWNTO 0);
				D6	:	IN	std_logic_vector (31 DOWNTO 0);
				D7	:	IN	std_logic_vector (31 DOWNTO 0);
				D8	:	IN	std_logic_vector (31 DOWNTO 0);
				Y	:	OUT	std_logic_vector (31 DOWNTO 0);
				S	:	IN	std_logic_vector (2 DOWNTO 0)
			);
END COMPONENT;
COMPONENT dff_with_hold_32b IS
	PORT 	(
				D		:	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		:	IN		STD_LOGIC;
				hold	:	IN		STD_LOGIC;
				rst		:	IN 		STD_LOGIC;
				Q		:	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;

SIGNAL MUX_SHUFFLE_1_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_SHUFFLE_2_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_SHUFFLE_3_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_SHUFFLE_4_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_SHUFFLE_5_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_SHUFFLE_6_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_SHUFFLE_7_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_SHUFFLE_8_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_MULT_1_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_MULT_2_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_MULT_3_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_MULT_4_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_MULT_5_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_MULT_6_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_MULT_7_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_MULT_8_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_BYPASS_0_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_BYPASS_1_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_BYPASS_2_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_BYPASS_3_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_BYPASS_4_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_BYPASS_5_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_BYPASS_6_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL BLOCK_BYPASS_7_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_DESHUFFLE_0_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_DESHUFFLE_1_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_DESHUFFLE_2_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_DESHUFFLE_3_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_DESHUFFLE_4_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_DESHUFFLE_5_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_DESHUFFLE_6_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_DESHUFFLE_7_OUT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_BYPASS_0_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_BYPASS_1_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_BYPASS_2_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_BYPASS_3_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_BYPASS_4_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_BYPASS_5_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_BYPASS_6_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_BYPASS_7_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DFF_0_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DFF_1_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DFF_2_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DFF_3_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DFF_4_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DFF_5_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DFF_6_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DFF_7_OUT			: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_HOLD_0_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_HOLD_1_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_HOLD_2_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_HOLD_3_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_HOLD_4_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_HOLD_5_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_HOLD_6_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_HOLD_7_OUT		: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
	-- Assignment
	SET_0_OUT	<= MUX_HOLD_0_OUT;
	SET_1_OUT	<= MUX_HOLD_1_OUT;
	SET_2_OUT	<= MUX_HOLD_2_OUT;
	SET_3_OUT	<= MUX_HOLD_3_OUT;
	SET_4_OUT	<= MUX_HOLD_4_OUT;
	SET_5_OUT	<= MUX_HOLD_5_OUT;
	SET_6_OUT	<= MUX_HOLD_6_OUT;
	SET_7_OUT	<= MUX_HOLD_7_OUT;
	
	-- Port Mapping
	
	MUX_SHUFFLE_1 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>SET_0_IN,
					D2	=>SET_1_IN,
					D3	=>SET_2_IN,
					D4	=>SET_3_IN,
					D5	=>SET_4_IN,
					D6	=>SET_5_IN,
					D7	=>SET_6_IN,
					D8	=>SET_7_IN,
					Y	=>MUX_SHUFFLE_1_OUT,
					S	=>Shuf_Ctrl_1
				);
	MUX_SHUFFLE_2 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>SET_0_IN,
					D2	=>SET_1_IN,
					D3	=>SET_2_IN,
					D4	=>SET_3_IN,
					D5	=>SET_4_IN,
					D6	=>SET_5_IN,
					D7	=>SET_6_IN,
					D8	=>SET_7_IN,
					Y	=>MUX_SHUFFLE_2_OUT,
					S	=>Shuf_Ctrl_2
				);				
	MUX_SHUFFLE_3 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>SET_0_IN,
					D2	=>SET_1_IN,
					D3	=>SET_2_IN,
					D4	=>SET_3_IN,
					D5	=>SET_4_IN,
					D6	=>SET_5_IN,
					D7	=>SET_6_IN,
					D8	=>SET_7_IN,
					Y	=>MUX_SHUFFLE_3_OUT,
					S	=>Shuf_Ctrl_3
				);								
	MUX_SHUFFLE_4 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>SET_0_IN,
					D2	=>SET_1_IN,
					D3	=>SET_2_IN,
					D4	=>SET_3_IN,
					D5	=>SET_4_IN,
					D6	=>SET_5_IN,
					D7	=>SET_6_IN,
					D8	=>SET_7_IN,
					Y	=>MUX_SHUFFLE_4_OUT,
					S	=>Shuf_Ctrl_4
				);				
	MUX_SHUFFLE_5 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>SET_0_IN,
					D2	=>SET_1_IN,
					D3	=>SET_2_IN,
					D4	=>SET_3_IN,
					D5	=>SET_4_IN,
					D6	=>SET_5_IN,
					D7	=>SET_6_IN,
					D8	=>SET_7_IN,
					Y	=>MUX_SHUFFLE_5_OUT,
					S	=>Shuf_Ctrl_5
				);				
	MUX_SHUFFLE_6 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>SET_0_IN,
					D2	=>SET_1_IN,
					D3	=>SET_2_IN,
					D4	=>SET_3_IN,
					D5	=>SET_4_IN,
					D6	=>SET_5_IN,
					D7	=>SET_6_IN,
					D8	=>SET_7_IN,
					Y	=>MUX_SHUFFLE_6_OUT,
					S	=>Shuf_Ctrl_6
				);				
	MUX_SHUFFLE_7 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>SET_0_IN,
					D2	=>SET_1_IN,
					D3	=>SET_2_IN,
					D4	=>SET_3_IN,
					D5	=>SET_4_IN,
					D6	=>SET_5_IN,
					D7	=>SET_6_IN,
					D8	=>SET_7_IN,
					Y	=>MUX_SHUFFLE_7_OUT,
					S	=>Shuf_Ctrl_7
				);				
	MUX_SHUFFLE_8 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>SET_0_IN,
					D2	=>SET_1_IN,
					D3	=>SET_2_IN,
					D4	=>SET_3_IN,
					D5	=>SET_4_IN,
					D6	=>SET_5_IN,
					D7	=>SET_6_IN,
					D8	=>SET_7_IN,
					Y	=>MUX_SHUFFLE_8_OUT,
					S	=>Shuf_Ctrl_8
				);
	BLOCK_MULT_1 :
		generic_complex_mult_block
			GENERIC MAP
				(
					C_PLUS_S	=>"0001000101111110",
					C_ONLY		=>"0000111111101100",
					C_MIN_S		=>"0000111001011011"
				)
			PORT MAP
				(
					A32			=>MUX_SHUFFLE_1_OUT,
					TYPESEL		=>Type_Sel_1,
					R32			=>BLOCK_MULT_1_OUT	
				);
	BLOCK_MULT_2 :
		generic_complex_mult_block
			GENERIC MAP
				(
					C_PLUS_S	=>"0001001011010000",
					C_ONLY		=>"0000111110110001",
					C_MIN_S		=>"0000110010010010"
				)
			PORT MAP
				(
					A32			=>MUX_SHUFFLE_2_OUT,
					TYPESEL		=>Type_Sel_2,
					R32			=>BLOCK_MULT_2_OUT	
				);							
	BLOCK_MULT_3 :
		generic_complex_mult_block
			GENERIC MAP
				(
					C_PLUS_S	=>"0001001111110101",
					C_ONLY		=>"0000111101010000",
					C_MIN_S		=>"0000101010101011"
				)
			PORT MAP
				(
					A32			=>MUX_SHUFFLE_3_OUT,
					TYPESEL		=>Type_Sel_3,
					R32			=>BLOCK_MULT_3_OUT	
				);				
	BLOCK_MULT_4 :
		generic_complex_mult_block
			GENERIC MAP
				(
					C_PLUS_S	=>"0001010011101000",
					C_ONLY		=>"0000111011001000",
					C_MIN_S		=>"0000100010101001"
				)
			PORT MAP
				(
					A32			=>MUX_SHUFFLE_4_OUT,
					TYPESEL		=>Type_Sel_4,
					R32			=>BLOCK_MULT_4_OUT	
				);				
	BLOCK_MULT_5 :
		generic_complex_mult_block
			GENERIC MAP
				(
					C_PLUS_S	=>"0001010110100111",
					C_ONLY		=>"0000111000011100",
					C_MIN_S		=>"0000011010010010"
				)
			PORT MAP
				(
					A32			=>MUX_SHUFFLE_5_OUT,
					TYPESEL		=>Type_Sel_5,
					R32			=>BLOCK_MULT_5_OUT	
				);							
	BLOCK_MULT_6 :
		generic_complex_mult_block
			GENERIC MAP
				(
					C_PLUS_S	=>"0001011000110001",
					C_ONLY		=>"0000110101001110",
					C_MIN_S		=>"0000010001101010"
				)
			PORT MAP
				(
					A32			=>MUX_SHUFFLE_6_OUT,
					TYPESEL		=>Type_Sel_6,
					R32			=>BLOCK_MULT_6_OUT	
				);				
	BLOCK_MULT_7 :
		generic_complex_mult_block
			GENERIC MAP
				(
					C_PLUS_S	=>"0001011010000101",
					C_ONLY		=>"0000110001011110",
					C_MIN_S		=>"0000001000111000"
				)
			PORT MAP
				(
					A32			=>MUX_SHUFFLE_7_OUT,
					TYPESEL		=>Type_Sel_7,
					R32			=>BLOCK_MULT_7_OUT	
				);				
	BLOCK_MULT_8 :
		generic_complex_mult_block
			GENERIC MAP
				(
					C_PLUS_S	=>"0001011010100001",
					C_ONLY		=>"0000101101010000",
					C_MIN_S		=>"0000000000000000"
				)
			PORT MAP
				(
					A32			=>MUX_SHUFFLE_8_OUT,
					TYPESEL		=>Type_Sel_8,
					R32			=>BLOCK_MULT_8_OUT	
				);	
				
	BLOCK_BYPASS_0 :
		bypass_32b
			PORT MAP
				(
					A32			=>SET_0_IN,
					TYPESEL		=>Bypass_Sel_0,
					R32			=>BLOCK_BYPASS_0_OUT
				);
	BLOCK_BYPASS_1 :
		bypass_32b
			PORT MAP
				(
					A32			=>SET_1_IN,
					TYPESEL		=>Bypass_Sel_1,
					R32			=>BLOCK_BYPASS_1_OUT
				);				
	BLOCK_BYPASS_2 :
		bypass_32b
			PORT MAP
				(
					A32			=>SET_2_IN,
					TYPESEL		=>Bypass_Sel_2,
					R32			=>BLOCK_BYPASS_2_OUT
				);				
	BLOCK_BYPASS_3 :
		bypass_32b
			PORT MAP
				(
					A32			=>SET_3_IN,
					TYPESEL		=>Bypass_Sel_3,
					R32			=>BLOCK_BYPASS_3_OUT
				);
	BLOCK_BYPASS_4 :
		bypass_32b
			PORT MAP
				(
					A32			=>SET_4_IN,
					TYPESEL		=>Bypass_Sel_4,
					R32			=>BLOCK_BYPASS_4_OUT
				);				
	BLOCK_BYPASS_5 :
		bypass_32b
			PORT MAP
				(
					A32			=>SET_5_IN,
					TYPESEL		=>Bypass_Sel_5,
					R32			=>BLOCK_BYPASS_5_OUT
				);				
	BLOCK_BYPASS_6 :
		bypass_32b
			PORT MAP
				(
					A32			=>SET_6_IN,
					TYPESEL		=>Bypass_Sel_6,
					R32			=>BLOCK_BYPASS_6_OUT
				);				
	BLOCK_BYPASS_7 :
		bypass_32b
			PORT MAP
				(
					A32			=>SET_7_IN,
					TYPESEL		=>Bypass_Sel_7,
					R32			=>BLOCK_BYPASS_7_OUT
				);											
	MUX_DESHUFFLE_0 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>BLOCK_MULT_1_OUT,
					D2	=>BLOCK_MULT_2_OUT,
					D3	=>BLOCK_MULT_3_OUT,
					D4	=>BLOCK_MULT_4_OUT,
					D5	=>BLOCK_MULT_5_OUT,
					D6	=>BLOCK_MULT_6_OUT,
					D7	=>BLOCK_MULT_7_OUT,
					D8	=>BLOCK_MULT_8_OUT,
					Y	=>MUX_DESHUFFLE_0_OUT,
					S	=>DeShuf_Ctrl_0
				);			
	MUX_DESHUFFLE_1 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>BLOCK_MULT_1_OUT,
					D2	=>BLOCK_MULT_2_OUT,
					D3	=>BLOCK_MULT_3_OUT,
					D4	=>BLOCK_MULT_4_OUT,
					D5	=>BLOCK_MULT_5_OUT,
					D6	=>BLOCK_MULT_6_OUT,
					D7	=>BLOCK_MULT_7_OUT,
					D8	=>BLOCK_MULT_8_OUT,
					Y	=>MUX_DESHUFFLE_1_OUT,
					S	=>DeShuf_Ctrl_1
				);							
	MUX_DESHUFFLE_2 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>BLOCK_MULT_1_OUT,
					D2	=>BLOCK_MULT_2_OUT,
					D3	=>BLOCK_MULT_3_OUT,
					D4	=>BLOCK_MULT_4_OUT,
					D5	=>BLOCK_MULT_5_OUT,
					D6	=>BLOCK_MULT_6_OUT,
					D7	=>BLOCK_MULT_7_OUT,
					D8	=>BLOCK_MULT_8_OUT,
					Y	=>MUX_DESHUFFLE_2_OUT,
					S	=>DeShuf_Ctrl_2
				);							
	MUX_DESHUFFLE_3 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>BLOCK_MULT_1_OUT,
					D2	=>BLOCK_MULT_2_OUT,
					D3	=>BLOCK_MULT_3_OUT,
					D4	=>BLOCK_MULT_4_OUT,
					D5	=>BLOCK_MULT_5_OUT,
					D6	=>BLOCK_MULT_6_OUT,
					D7	=>BLOCK_MULT_7_OUT,
					D8	=>BLOCK_MULT_8_OUT,
					Y	=>MUX_DESHUFFLE_3_OUT,
					S	=>DeShuf_Ctrl_3
				);							
	MUX_DESHUFFLE_4 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>BLOCK_MULT_1_OUT,
					D2	=>BLOCK_MULT_2_OUT,
					D3	=>BLOCK_MULT_3_OUT,
					D4	=>BLOCK_MULT_4_OUT,
					D5	=>BLOCK_MULT_5_OUT,
					D6	=>BLOCK_MULT_6_OUT,
					D7	=>BLOCK_MULT_7_OUT,
					D8	=>BLOCK_MULT_8_OUT,
					Y	=>MUX_DESHUFFLE_4_OUT,
					S	=>DeShuf_Ctrl_4
				);							
	MUX_DESHUFFLE_5 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>BLOCK_MULT_1_OUT,
					D2	=>BLOCK_MULT_2_OUT,
					D3	=>BLOCK_MULT_3_OUT,
					D4	=>BLOCK_MULT_4_OUT,
					D5	=>BLOCK_MULT_5_OUT,
					D6	=>BLOCK_MULT_6_OUT,
					D7	=>BLOCK_MULT_7_OUT,
					D8	=>BLOCK_MULT_8_OUT,
					Y	=>MUX_DESHUFFLE_5_OUT,
					S	=>DeShuf_Ctrl_5
				);							
	MUX_DESHUFFLE_6 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>BLOCK_MULT_1_OUT,
					D2	=>BLOCK_MULT_2_OUT,
					D3	=>BLOCK_MULT_3_OUT,
					D4	=>BLOCK_MULT_4_OUT,
					D5	=>BLOCK_MULT_5_OUT,
					D6	=>BLOCK_MULT_6_OUT,
					D7	=>BLOCK_MULT_7_OUT,
					D8	=>BLOCK_MULT_8_OUT,
					Y	=>MUX_DESHUFFLE_6_OUT,
					S	=>DeShuf_Ctrl_6
				);							
	MUX_DESHUFFLE_7 :
		mux_8to1_32b
			PORT MAP
				(
					D1	=>BLOCK_MULT_1_OUT,
					D2	=>BLOCK_MULT_2_OUT,
					D3	=>BLOCK_MULT_3_OUT,
					D4	=>BLOCK_MULT_4_OUT,
					D5	=>BLOCK_MULT_5_OUT,
					D6	=>BLOCK_MULT_6_OUT,
					D7	=>BLOCK_MULT_7_OUT,
					D8	=>BLOCK_MULT_8_OUT,
					Y	=>MUX_DESHUFFLE_7_OUT,
					S	=>DeShuf_Ctrl_7
				);											
	MUX_BYPASS_0 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_DESHUFFLE_0_OUT,
					D2	=>BLOCK_BYPASS_0_OUT,
					Y	=>MUX_BYPASS_0_OUT,
					S	=>Bypass_EN_0
				);									
	MUX_BYPASS_1 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_DESHUFFLE_1_OUT,
					D2	=>BLOCK_BYPASS_1_OUT,
					Y	=>MUX_BYPASS_1_OUT,
					S	=>Bypass_EN_1
				);	
	MUX_BYPASS_2 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_DESHUFFLE_2_OUT,
					D2	=>BLOCK_BYPASS_2_OUT,
					Y	=>MUX_BYPASS_2_OUT,
					S	=>Bypass_EN_2
				);	
	MUX_BYPASS_3 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_DESHUFFLE_3_OUT,
					D2	=>BLOCK_BYPASS_3_OUT,
					Y	=>MUX_BYPASS_3_OUT,
					S	=>Bypass_EN_3
				);	
	MUX_BYPASS_4 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_DESHUFFLE_4_OUT,
					D2	=>BLOCK_BYPASS_4_OUT,
					Y	=>MUX_BYPASS_4_OUT,
					S	=>Bypass_EN_4
				);					
	MUX_BYPASS_5 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_DESHUFFLE_5_OUT,
					D2	=>BLOCK_BYPASS_5_OUT,
					Y	=>MUX_BYPASS_5_OUT,
					S	=>Bypass_EN_5
				);					
	MUX_BYPASS_6 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_DESHUFFLE_6_OUT,
					D2	=>BLOCK_BYPASS_6_OUT,
					Y	=>MUX_BYPASS_6_OUT,
					S	=>Bypass_EN_6
				);					
	MUX_BYPASS_7 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_DESHUFFLE_7_OUT,
					D2	=>BLOCK_BYPASS_7_OUT,
					Y	=>MUX_BYPASS_7_OUT,
					S	=>Bypass_EN_7
				);
    DFF_0 :
		dff_with_hold_32b 
			PORT MAP
				(
					D   => MUX_BYPASS_0_OUT,
					clk	=> clk,
					hold=> Hold_Ctrl_0,
					rst => rst,
					Q   => DFF_0_OUT
				);
    DFF_1 :
		dff_with_hold_32b 
			PORT MAP
				(
					D   => MUX_BYPASS_1_OUT,
					clk	=> clk,
					hold=> Hold_Ctrl_1,
					rst => rst,
					Q   => DFF_1_OUT
				);
    DFF_2 :
		dff_with_hold_32b 
			PORT MAP
				(
					D   => MUX_BYPASS_2_OUT,
					clk	=> clk,
					hold=> Hold_Ctrl_2,
					rst => rst,
					Q   => DFF_2_OUT
				);				
    DFF_3 :
		dff_with_hold_32b 
			PORT MAP
				(
					D   => MUX_BYPASS_3_OUT,
					clk	=> clk,
					hold=> Hold_Ctrl_3,
					rst => rst,
					Q   => DFF_3_OUT
				);				
    DFF_4 :
		dff_with_hold_32b 
			PORT MAP
				(
					D   => MUX_BYPASS_4_OUT,
					clk	=> clk,
					hold=> Hold_Ctrl_4,
					rst => rst,
					Q   => DFF_4_OUT
				);							
    DFF_5 :
		dff_with_hold_32b 
			PORT MAP
				(
					D   => MUX_BYPASS_5_OUT,
					clk	=> clk,
					hold=> Hold_Ctrl_5,
					rst => rst,
					Q   => DFF_5_OUT
				);				
    DFF_6 :
		dff_with_hold_32b 
			PORT MAP
				(
					D   => MUX_BYPASS_6_OUT,
					clk	=> clk,
					hold=> Hold_Ctrl_6,
					rst => rst,
					Q   => DFF_6_OUT
				);				
    DFF_7 :
		dff_with_hold_32b 
			PORT MAP
				(
					D   => MUX_BYPASS_7_OUT,
					clk	=> clk,
					hold=> Hold_Ctrl_7,
					rst => rst,
					Q   => DFF_7_OUT
				);
	MUX_HOLD_0 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_BYPASS_0_OUT,
					D2	=>DFF_0_OUT,
					Y	=>MUX_HOLD_0_OUT,
					S	=>DFF_Ctrl_0	
				);			
	MUX_HOLD_1 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_BYPASS_1_OUT,
					D2	=>DFF_1_OUT,
					Y	=>MUX_HOLD_1_OUT,
					S	=>DFF_Ctrl_1	
				);							
	MUX_HOLD_2 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_BYPASS_2_OUT,
					D2	=>DFF_2_OUT,
					Y	=>MUX_HOLD_2_OUT,
					S	=>DFF_Ctrl_2	
				);							
	MUX_HOLD_3 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_BYPASS_3_OUT,
					D2	=>DFF_3_OUT,
					Y	=>MUX_HOLD_3_OUT,
					S	=>DFF_Ctrl_3	
				);
	MUX_HOLD_4 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_BYPASS_4_OUT,
					D2	=>DFF_4_OUT,
					Y	=>MUX_HOLD_4_OUT,
					S	=>DFF_Ctrl_4	
				);							
	MUX_HOLD_5 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_BYPASS_5_OUT,
					D2	=>DFF_5_OUT,
					Y	=>MUX_HOLD_5_OUT,
					S	=>DFF_Ctrl_5	
				);			
	MUX_HOLD_6 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_BYPASS_6_OUT,
					D2	=>DFF_6_OUT,
					Y	=>MUX_HOLD_6_OUT,
					S	=>DFF_Ctrl_6	
				);			
	MUX_HOLD_7 :
		mux_2to1_32b
			PORT MAP
				(
					D1	=>MUX_BYPASS_7_OUT,
					D2	=>DFF_7_OUT,
					Y	=>MUX_HOLD_7_OUT,
					S	=>DFF_Ctrl_7	
				);											
																			
END structural;

