LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fft_64p_16b_top_testbench IS
	PORT	(
				In_Stream   :   OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
				Data_Start  :   OUT STD_LOGIC;
				clk		    :	IN	STD_LOGIC;
				rst		    :	IN	STD_LOGIC;
				mode		:   IN  STD_LOGIC;
				Out_Stream	:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				Data_Out	:	OUT	STD_LOGIC
			);
END fft_64p_16b_top_testbench;

ARCHITECTURE structural of fft_64p_16b_top_testbench IS
COMPONENT fft_64p_16b_top IS
	PORT	(
				In_Stream	:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				Mode		:	IN	STD_LOGIC;
				Data_Start	:	IN	STD_LOGIC;
				clk		    :	IN	STD_LOGIC;
				rst		    :	IN	STD_LOGIC;
				Out_Stream	:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				Data_Out	:	OUT	STD_LOGIC
			);
END COMPONENT;

TYPE TABLE_TYPE IS ARRAY (0 TO 63) of STD_LOGIC_VECTOR (31 DOWNTO 0);
TYPE FSMSTATE IS (
	aftreset1, 
	aftreset2,
	aftreset3,
	counting,
	waiting
	);
CONSTANT INPUT_STREAM : TABLE_TYPE :=
(
	x"0A400000", --1
	x"00000000", --2
	x"00000000", --3
	x"00000000", --4
	x"00000000", --5
	x"00000000", --6
	x"00000000", --7
	x"00000000", --8
	x"00000000", --9
	x"00000000", --10
	x"00000000", --11
	x"00000000", --12
	x"00000000", --13
	x"00000000", --14
	x"00000000", --15
	x"00000000", --16
	x"00000000", --17
	x"00000000", --18
	x"00000000", --19
	x"00000000", --20
	x"00000000", --21
	x"00000000", --22
	x"00000000", --23
	x"00000000", --24
	x"00000000", --25
	x"00000000", --26
	x"00000000", --27
	x"00000000", --28
	x"00000000", --29
	x"00000000", --30
	x"00000000", --31
	x"00000000", --32
	x"00000000", --33
	x"00000000", --34
	x"00000000", --35
	x"00000000", --36
	x"00000000", --37
	x"00000000", --38
	x"00000000", --39
	x"00000000", --40
	x"00000000", --41
	x"00000000", --42
	x"00000000", --43
	x"00000000", --44
	x"00000000", --45
	x"00000000", --46
	x"00000000", --47
	x"00000000", --48
	x"00000000", --49
	x"00000000", --50
	x"00000000", --51
	x"00000000", --52
	x"00000000", --53
	x"00000000", --54
	x"00000000", --55
	x"00000000", --56
	x"00000000", --57
	x"00000000", --58
	x"00000000", --59
	x"00000000", --60
	x"00000000", --61
	x"00000000", --62
	x"00000000", --63
	x"00000000"  --64
);
SIGNAL counter		: INTEGER;
SIGNAL D_Start   : STD_LOGIC;
SIGNAL D_Stream  : STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL currentstate	: FSMSTATE;
	BEGIN
	In_Stream <= D_Stream;
	Data_Start<= D_Start;
	PROCESS(clk,rst,counter,currentstate)
	BEGIN
		IF rst='1' THEN
			counter <= 0;
			currentstate <= aftreset1;
			D_Stream<= x"00000000";
		ELSE
			IF ((clk'EVENT) AND (clk='1'))  THEN
				CASE currentstate IS
					WHEN aftreset1   =>
						D_Start <= '0';
						D_Stream<= x"00000000";
						counter <= 0;
						currentstate <= aftreset2;
					WHEN aftreset2   =>
						D_Start <= '0';
						D_Stream<= x"00000000";
						counter <= 0;
						currentstate <= aftreset3;
					WHEN aftreset3   =>
						D_Start <= '0';
						D_Stream<= x"00000000";
						counter <= 0;
						currentstate <= counting;
					WHEN counting   =>
						IF (counter=0) THEN
							D_Start <= '1';
							D_Stream<= INPUT_STREAM(counter);
							counter <= counter + 1;
							currentstate <= counting;
						ELSIF (counter>0) AND (counter<64) THEN
							D_Start <= '1';
							D_Stream<= INPUT_STREAM(counter);
							counter <= counter + 1;
							currentstate <= counting;	
						ELSE
							D_Start <= '0';
							D_Stream<= x"00000000";
							counter <= 0;
							currentstate <= waiting;
						END IF;
					WHEN waiting   =>		
							D_Start <= '0';
							D_Stream<= x"00000000";
							counter <= 0;
							currentstate <= waiting;			
				END CASE;
			END IF;		
		END IF;
	END PROCESS;
	FFT64POINT :
		fft_64p_16b_top
			PORT MAP (
						In_Stream	=>D_Stream,
						Mode		=>mode,
						Data_Start	=>D_start,
						clk		    =>clk,
						rst		    =>rst,
						Out_Stream	=>Out_Stream,
						Data_Out	=>Data_Out	
					 );
	END structural;