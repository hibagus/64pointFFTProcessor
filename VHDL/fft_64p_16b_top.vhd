LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fft_64p_16b_top IS
	PORT	(
				In_Stream	:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				Mode		:	IN	STD_LOGIC;
				Data_Start	:	IN	STD_LOGIC;
				clk		    :	IN	STD_LOGIC;
				rst		    :	IN	STD_LOGIC;
				Out_Stream	:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				Data_Out	:	OUT	STD_LOGIC
			);
END fft_64p_16b_top;

ARCHITECTURE structural of fft_64p_16b_top IS
COMPONENT input_circuit IS
	PORT 	(
				D		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		       :	IN		STD_LOGIC;
				hold_all_seg   :	IN		STD_LOGIC;
				hold_buf_1     :	IN		STD_LOGIC;
				hold_buf_2     :	IN		STD_LOGIC;
				hold_buf_3     :	IN		STD_LOGIC;
				in_ctrl_buf_1  :    IN		STD_LOGIC;
				in_ctrl_buf_2  :    IN		STD_LOGIC;
				in_ctrl_buf_3  :    IN		STD_LOGIC;
				pos_hold_ctrl  :    IN		STD_LOGIC;
				mode  		   :    IN		STD_LOGIC;
				rst		       :	IN 		STD_LOGIC;
				Q0		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q1		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q2		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q3		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q4		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q5		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q6		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q7		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT input_counter IS
	PORT	(
				clk		  :	IN	STD_LOGIC;
				rst		  :	IN	STD_LOGIC;
				datastart :	IN  STD_LOGIC;
				counter_o : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
				mastertrig:	OUT STD_LOGIC
			);
END COMPONENT;
COMPONENT fft_8p_16b_top IS
	PORT	(
				xt0		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xt1		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xt2		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xt3		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xt4		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xt5		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xt6		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xt7		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xf0		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xf1		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xf2		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xf3		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xf4		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xf5		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xf6		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
				xf7		:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT interdimensional_multiplier IS
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
END COMPONENT;
COMPONENT cb_circuit IS
	PORT 	(
				D1		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D2		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D3		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D4		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D5		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D6		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D7		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D8		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		       :	IN		STD_LOGIC;
				hold_seg_0	   :	IN		STD_LOGIC;
				hold_seg_1	   :	IN		STD_LOGIC;
				hold_seg_2	   :	IN		STD_LOGIC;
				hold_seg_3	   :	IN		STD_LOGIC;
				hold_seg_4	   :	IN		STD_LOGIC;
				hold_seg_5	   :	IN		STD_LOGIC;
				hold_seg_6	   :	IN		STD_LOGIC;
				hold_seg_7	   :	IN		STD_LOGIC;
				in_ctrl_all_seg:    IN		STD_LOGIC;
				rst		       :	IN 		STD_LOGIC;
				Q1		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q2		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q3		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q4		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q5		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q6		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q7		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0);
				Q8		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT output_circuit IS
	PORT 	(
				D1		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D2		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D3		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D4		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D5		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D6		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D7		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				D8		       :	IN		STD_LOGIC_VECTOR (31 DOWNTO 0);
				clk		       :	IN		STD_LOGIC;
				hold_all_seg   :	IN		STD_LOGIC;
				in_ctrl_all_seg:    IN		STD_LOGIC;
				mode  		   :    IN		STD_LOGIC;
				rst		       :	IN 		STD_LOGIC;
				Q		       :	OUT 	STD_LOGIC_VECTOR (31 DOWNTO 0)
			);
END COMPONENT;
COMPONENT output_counter IS
	PORT	(
				clk		  :	IN	STD_LOGIC;
				rst		  :	IN	STD_LOGIC;
				dataind   :	IN  STD_LOGIC;
				counter_o : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
				datavalid :	OUT STD_LOGIC
			);
END COMPONENT;
COMPONENT master_control IS
	PORT	(
				clk		         : IN  STD_LOGIC;
			    rst		         : IN  STD_LOGIC;
				mastertrig		 : IN  STD_LOGIC;
                hold_all_in      : OUT STD_LOGIC;
                hold_buf_3       : OUT STD_LOGIC;
                hold_buf_2       : OUT STD_LOGIC;
                hold_buf_1       : OUT STD_LOGIC;
                in_ctrl_buf_3    : OUT STD_LOGIC;
                in_ctrl_buf_2    : OUT STD_LOGIC;
                in_ctrl_buf_1    : OUT STD_LOGIC;
                pos_hold_ctrl    : OUT STD_LOGIC;
                Shuf_Ctrl_1      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Shuf_Ctrl_2      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Shuf_Ctrl_3      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Shuf_Ctrl_4      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Shuf_Ctrl_5      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Shuf_Ctrl_6      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Shuf_Ctrl_7      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Shuf_Ctrl_8      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Type_Sel_1       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Type_Sel_2       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Type_Sel_3       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Type_Sel_4       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Type_Sel_5       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Type_Sel_6       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Type_Sel_7       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Type_Sel_8       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_Sel_0     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_Sel_1     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_Sel_2     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_Sel_3     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_Sel_4     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_Sel_5     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_Sel_6     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_Sel_7     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                DeShuf_Ctrl_0    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                DeShuf_Ctrl_1    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                DeShuf_Ctrl_2    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                DeShuf_Ctrl_3    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                DeShuf_Ctrl_4    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                DeShuf_Ctrl_5    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                DeShuf_Ctrl_6    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                DeShuf_Ctrl_7    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
                Bypass_EN_0      : OUT STD_LOGIC;
                Bypass_EN_1      : OUT STD_LOGIC;
                Bypass_EN_2      : OUT STD_LOGIC;
                Bypass_EN_3      : OUT STD_LOGIC;
                Bypass_EN_4      : OUT STD_LOGIC;
                Bypass_EN_5      : OUT STD_LOGIC;
                Bypass_EN_6      : OUT STD_LOGIC;
                Bypass_EN_7      : OUT STD_LOGIC;
                Hold_Ctrl_0      : OUT STD_LOGIC;
                Hold_Ctrl_1      : OUT STD_LOGIC;
                Hold_Ctrl_2      : OUT STD_LOGIC;
                Hold_Ctrl_3      : OUT STD_LOGIC;
                Hold_Ctrl_4      : OUT STD_LOGIC;
                Hold_Ctrl_5      : OUT STD_LOGIC;
                Hold_Ctrl_6      : OUT STD_LOGIC;
                Hold_Ctrl_7      : OUT STD_LOGIC;
                DFF_Ctrl_0       : OUT STD_LOGIC;
                DFF_Ctrl_1       : OUT STD_LOGIC;
                DFF_Ctrl_2       : OUT STD_LOGIC;
                DFF_Ctrl_3       : OUT STD_LOGIC;
                DFF_Ctrl_4       : OUT STD_LOGIC;
                DFF_Ctrl_5       : OUT STD_LOGIC;
                DFF_Ctrl_6       : OUT STD_LOGIC;
                DFF_Ctrl_7       : OUT STD_LOGIC;
                hold_seg_0       : OUT STD_LOGIC;
                hold_seg_1       : OUT STD_LOGIC;
                hold_seg_2       : OUT STD_LOGIC;
                hold_seg_3       : OUT STD_LOGIC;
                hold_seg_4       : OUT STD_LOGIC;
                hold_seg_5       : OUT STD_LOGIC;
                hold_seg_6       : OUT STD_LOGIC;
                hold_seg_7       : OUT STD_LOGIC;
                in_ctrl_all_cb   : OUT STD_LOGIC;
                hold_all_out     : OUT STD_LOGIC;
                in_ctrl_all_out  : OUT STD_LOGIC;
                counter_en       : OUT STD_LOGIC
			);
END COMPONENT;

SIGNAL INPUT_CIRCUIT_DATA_0_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INPUT_CIRCUIT_DATA_1_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INPUT_CIRCUIT_DATA_2_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INPUT_CIRCUIT_DATA_3_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INPUT_CIRCUIT_DATA_4_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INPUT_CIRCUIT_DATA_5_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INPUT_CIRCUIT_DATA_6_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INPUT_CIRCUIT_DATA_7_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INPUT_COUNTER_MTRIG_OUT   : STD_LOGIC;
SIGNAL FFT_8P_FIRST_DATA_0_OUT   : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_FIRST_DATA_1_OUT   : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_FIRST_DATA_2_OUT   : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_FIRST_DATA_3_OUT   : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_FIRST_DATA_4_OUT   : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_FIRST_DATA_5_OUT   : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_FIRST_DATA_6_OUT   : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_FIRST_DATA_7_OUT   : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INTERDIM_MULT_DATA_0_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INTERDIM_MULT_DATA_1_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INTERDIM_MULT_DATA_2_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INTERDIM_MULT_DATA_3_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INTERDIM_MULT_DATA_4_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INTERDIM_MULT_DATA_5_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INTERDIM_MULT_DATA_6_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL INTERDIM_MULT_DATA_7_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CB_CIRCUIT_DATA_0_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CB_CIRCUIT_DATA_1_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CB_CIRCUIT_DATA_2_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CB_CIRCUIT_DATA_3_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CB_CIRCUIT_DATA_4_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CB_CIRCUIT_DATA_5_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CB_CIRCUIT_DATA_6_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL CB_CIRCUIT_DATA_7_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_SECOND_DATA_0_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_SECOND_DATA_1_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_SECOND_DATA_2_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_SECOND_DATA_3_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_SECOND_DATA_4_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_SECOND_DATA_5_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_SECOND_DATA_6_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL FFT_8P_SECOND_DATA_7_OUT  : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL OUTPUT_CIRCUIT_DATA_OUT	 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL OUTPUT_COUNTER_DATA_VAL   : STD_LOGIC;
SIGNAL master_out_hold_all_in    : STD_LOGIC;
SIGNAL master_out_hold_buf_3     : STD_LOGIC;
SIGNAL master_out_hold_buf_2     : STD_LOGIC;
SIGNAL master_out_hold_buf_1     : STD_LOGIC;
SIGNAL master_out_in_ctrl_buf_3  : STD_LOGIC;
SIGNAL master_out_in_ctrl_buf_2  : STD_LOGIC;
SIGNAL master_out_in_ctrl_buf_1  : STD_LOGIC;
SIGNAL master_out_pos_hold_ctrl  : STD_LOGIC;
SIGNAL master_out_Shuf_Ctrl_1    : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Shuf_Ctrl_2    : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Shuf_Ctrl_3    : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Shuf_Ctrl_4    : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Shuf_Ctrl_5    : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Shuf_Ctrl_6    : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Shuf_Ctrl_7    : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Shuf_Ctrl_8    : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Type_Sel_1     : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Type_Sel_2     : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Type_Sel_3     : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Type_Sel_4     : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Type_Sel_5     : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Type_Sel_6     : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Type_Sel_7     : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Type_Sel_8     : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_Sel_0   : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_Sel_1   : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_Sel_2   : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_Sel_3   : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_Sel_4   : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_Sel_5   : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_Sel_6   : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_Sel_7   : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_DeShuf_Ctrl_0  : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_DeShuf_Ctrl_1  : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_DeShuf_Ctrl_2  : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_DeShuf_Ctrl_3  : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_DeShuf_Ctrl_4  : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_DeShuf_Ctrl_5  : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_DeShuf_Ctrl_6  : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_DeShuf_Ctrl_7  : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL master_out_Bypass_EN_0    : STD_LOGIC;
SIGNAL master_out_Bypass_EN_1    : STD_LOGIC;
SIGNAL master_out_Bypass_EN_2    : STD_LOGIC;
SIGNAL master_out_Bypass_EN_3    : STD_LOGIC;
SIGNAL master_out_Bypass_EN_4    : STD_LOGIC;
SIGNAL master_out_Bypass_EN_5    : STD_LOGIC;
SIGNAL master_out_Bypass_EN_6    : STD_LOGIC;
SIGNAL master_out_Bypass_EN_7    : STD_LOGIC;
SIGNAL master_out_Hold_Ctrl_0    : STD_LOGIC;
SIGNAL master_out_Hold_Ctrl_1    : STD_LOGIC;
SIGNAL master_out_Hold_Ctrl_2    : STD_LOGIC;
SIGNAL master_out_Hold_Ctrl_3    : STD_LOGIC;
SIGNAL master_out_Hold_Ctrl_4    : STD_LOGIC;
SIGNAL master_out_Hold_Ctrl_5    : STD_LOGIC;
SIGNAL master_out_Hold_Ctrl_6    : STD_LOGIC;
SIGNAL master_out_Hold_Ctrl_7    : STD_LOGIC;
SIGNAL master_out_DFF_Ctrl_0     : STD_LOGIC;
SIGNAL master_out_DFF_Ctrl_1     : STD_LOGIC;
SIGNAL master_out_DFF_Ctrl_2     : STD_LOGIC;
SIGNAL master_out_DFF_Ctrl_3     : STD_LOGIC;
SIGNAL master_out_DFF_Ctrl_4     : STD_LOGIC;
SIGNAL master_out_DFF_Ctrl_5     : STD_LOGIC;
SIGNAL master_out_DFF_Ctrl_6     : STD_LOGIC;
SIGNAL master_out_DFF_Ctrl_7     : STD_LOGIC;
SIGNAL master_out_hold_seg_0     : STD_LOGIC;
SIGNAL master_out_hold_seg_1     : STD_LOGIC;
SIGNAL master_out_hold_seg_2     : STD_LOGIC;
SIGNAL master_out_hold_seg_3     : STD_LOGIC;
SIGNAL master_out_hold_seg_4     : STD_LOGIC;
SIGNAL master_out_hold_seg_5     : STD_LOGIC;
SIGNAL master_out_hold_seg_6     : STD_LOGIC;
SIGNAL master_out_hold_seg_7     : STD_LOGIC;
SIGNAL master_out_in_ctrl_all_cb : STD_LOGIC;
SIGNAL master_out_hold_all_out   : STD_LOGIC;
SIGNAL master_out_in_ctrl_all_out: STD_LOGIC;
SIGNAL master_out_counter_en     : STD_LOGIC;

BEGIN
	Out_Stream <= OUTPUT_CIRCUIT_DATA_OUT;
	Data_Out   <= OUTPUT_COUNTER_DATA_VAL;

INPUT_UNIT :
	input_circuit
		PORT MAP (
					D		       =>In_Stream,
					clk		       =>clk,
					hold_all_seg   =>master_out_hold_all_in,
					hold_buf_1     =>master_out_hold_buf_1,
					hold_buf_2     =>master_out_hold_buf_2,
					hold_buf_3     =>master_out_hold_buf_3,
					in_ctrl_buf_1  =>master_out_in_ctrl_buf_1,
					in_ctrl_buf_2  =>master_out_in_ctrl_buf_2,
					in_ctrl_buf_3  =>master_out_in_ctrl_buf_3,
					pos_hold_ctrl  =>master_out_pos_hold_ctrl,
					mode  		   =>Mode,
					rst		       =>rst,
					Q0		       =>INPUT_CIRCUIT_DATA_0_OUT,
					Q1		       =>INPUT_CIRCUIT_DATA_1_OUT,
					Q2		       =>INPUT_CIRCUIT_DATA_2_OUT,
					Q3		       =>INPUT_CIRCUIT_DATA_3_OUT,
					Q4		       =>INPUT_CIRCUIT_DATA_4_OUT,
					Q5		       =>INPUT_CIRCUIT_DATA_5_OUT,
					Q6		       =>INPUT_CIRCUIT_DATA_6_OUT,
					Q7		       =>INPUT_CIRCUIT_DATA_7_OUT
				);
IN_COUNT :
	input_counter
		PORT MAP (
					clk		      =>clk,
		            rst		      =>rst,
		            datastart     =>Data_Start,
		            mastertrig    =>INPUT_COUNTER_MTRIG_OUT
				);
FFT_8P_FIRSTSTAGE :
	fft_8p_16b_top
		PORT MAP (
					xt0 =>INPUT_CIRCUIT_DATA_0_OUT,
					xt1 =>INPUT_CIRCUIT_DATA_1_OUT,
					xt2 =>INPUT_CIRCUIT_DATA_2_OUT,
					xt3 =>INPUT_CIRCUIT_DATA_3_OUT,
					xt4 =>INPUT_CIRCUIT_DATA_4_OUT,
					xt5 =>INPUT_CIRCUIT_DATA_5_OUT,
					xt6 =>INPUT_CIRCUIT_DATA_6_OUT,
					xt7 =>INPUT_CIRCUIT_DATA_7_OUT,
					xf0 =>FFT_8P_FIRST_DATA_0_OUT,
					xf1 =>FFT_8P_FIRST_DATA_1_OUT,
					xf2 =>FFT_8P_FIRST_DATA_2_OUT,
					xf3 =>FFT_8P_FIRST_DATA_3_OUT,
					xf4 =>FFT_8P_FIRST_DATA_4_OUT,
					xf5 =>FFT_8P_FIRST_DATA_5_OUT,
					xf6 =>FFT_8P_FIRST_DATA_6_OUT,
					xf7 =>FFT_8P_FIRST_DATA_7_OUT
				);
INTERDIM_MULT :
	interdimensional_multiplier
		PORT MAP (
					clk				=>clk,
		            rst				=>rst,
		            SET_0_IN		=>FFT_8P_FIRST_DATA_0_OUT,
		            SET_1_IN		=>FFT_8P_FIRST_DATA_1_OUT,
		            SET_2_IN		=>FFT_8P_FIRST_DATA_2_OUT,
		            SET_3_IN		=>FFT_8P_FIRST_DATA_3_OUT,
		            SET_4_IN		=>FFT_8P_FIRST_DATA_4_OUT,
		            SET_5_IN		=>FFT_8P_FIRST_DATA_5_OUT,
		            SET_6_IN		=>FFT_8P_FIRST_DATA_6_OUT,
		            SET_7_IN		=>FFT_8P_FIRST_DATA_7_OUT,
		            Shuf_Ctrl_1		=>master_out_Shuf_Ctrl_1,
		            Shuf_Ctrl_2		=>master_out_Shuf_Ctrl_2,
		            Shuf_Ctrl_3		=>master_out_Shuf_Ctrl_3,
		            Shuf_Ctrl_4		=>master_out_Shuf_Ctrl_4,
		            Shuf_Ctrl_5		=>master_out_Shuf_Ctrl_5,
		            Shuf_Ctrl_6		=>master_out_Shuf_Ctrl_6,
		            Shuf_Ctrl_7		=>master_out_Shuf_Ctrl_7,
		            Shuf_Ctrl_8		=>master_out_Shuf_Ctrl_8,
		            Type_Sel_1		=>master_out_Type_Sel_1,
		            Type_Sel_2		=>master_out_Type_Sel_2,
		            Type_Sel_3		=>master_out_Type_Sel_3,
		            Type_Sel_4		=>master_out_Type_Sel_4,
		            Type_Sel_5		=>master_out_Type_Sel_5,
		            Type_Sel_6		=>master_out_Type_Sel_6,
		            Type_Sel_7		=>master_out_Type_Sel_7,
		            Type_Sel_8		=>master_out_Type_Sel_8,
		            Bypass_Sel_0	=>master_out_Bypass_Sel_0,
		            Bypass_Sel_1	=>master_out_Bypass_Sel_1,
		            Bypass_Sel_2	=>master_out_Bypass_Sel_2,
		            Bypass_Sel_3	=>master_out_Bypass_Sel_3,
		            Bypass_Sel_4	=>master_out_Bypass_Sel_4,
		            Bypass_Sel_5	=>master_out_Bypass_Sel_5,
		            Bypass_Sel_6	=>master_out_Bypass_Sel_6,
		            Bypass_Sel_7	=>master_out_Bypass_Sel_7,
		            DeShuf_Ctrl_0	=>master_out_DeShuf_Ctrl_0,
		            DeShuf_Ctrl_1	=>master_out_DeShuf_Ctrl_1,
		            DeShuf_Ctrl_2	=>master_out_DeShuf_Ctrl_2,
		            DeShuf_Ctrl_3	=>master_out_DeShuf_Ctrl_3,
		            DeShuf_Ctrl_4	=>master_out_DeShuf_Ctrl_4,
		            DeShuf_Ctrl_5	=>master_out_DeShuf_Ctrl_5,
		            DeShuf_Ctrl_6	=>master_out_DeShuf_Ctrl_6,
		            DeShuf_Ctrl_7	=>master_out_DeShuf_Ctrl_7,
		            Bypass_EN_0		=>master_out_Bypass_EN_0,
		            Bypass_EN_1		=>master_out_Bypass_EN_1,
		            Bypass_EN_2		=>master_out_Bypass_EN_2,
		            Bypass_EN_3		=>master_out_Bypass_EN_3,
		            Bypass_EN_4		=>master_out_Bypass_EN_4,
		            Bypass_EN_5		=>master_out_Bypass_EN_5,
		            Bypass_EN_6		=>master_out_Bypass_EN_6,
		            Bypass_EN_7		=>master_out_Bypass_EN_7,
		            Hold_Ctrl_0		=>master_out_Hold_Ctrl_0,
		            Hold_Ctrl_1		=>master_out_Hold_Ctrl_1,
		            Hold_Ctrl_2		=>master_out_Hold_Ctrl_2,
		            Hold_Ctrl_3		=>master_out_Hold_Ctrl_3,
		            Hold_Ctrl_4		=>master_out_Hold_Ctrl_4,
		            Hold_Ctrl_5		=>master_out_Hold_Ctrl_5,
		            Hold_Ctrl_6		=>master_out_Hold_Ctrl_6,
		            Hold_Ctrl_7		=>master_out_Hold_Ctrl_7,
					DFF_Ctrl_0		=>master_out_DFF_Ctrl_0,
				    DFF_Ctrl_1		=>master_out_DFF_Ctrl_1,
				    DFF_Ctrl_2		=>master_out_DFF_Ctrl_2,
				    DFF_Ctrl_3		=>master_out_DFF_Ctrl_3,
				    DFF_Ctrl_4		=>master_out_DFF_Ctrl_4,
				    DFF_Ctrl_5		=>master_out_DFF_Ctrl_5,
				    DFF_Ctrl_6		=>master_out_DFF_Ctrl_6,
				    DFF_Ctrl_7		=>master_out_DFF_Ctrl_7,
		            SET_0_OUT		=>INTERDIM_MULT_DATA_0_OUT,
		            SET_1_OUT		=>INTERDIM_MULT_DATA_1_OUT,
		            SET_2_OUT		=>INTERDIM_MULT_DATA_2_OUT,
		            SET_3_OUT		=>INTERDIM_MULT_DATA_3_OUT,
		            SET_4_OUT		=>INTERDIM_MULT_DATA_4_OUT,
		            SET_5_OUT		=>INTERDIM_MULT_DATA_5_OUT,
		            SET_6_OUT		=>INTERDIM_MULT_DATA_6_OUT,
		            SET_7_OUT		=>INTERDIM_MULT_DATA_7_OUT
				);
CB_UNIT :
	cb_circuit
		PORT MAP (
					D1		       =>INTERDIM_MULT_DATA_0_OUT,
					D2		       =>INTERDIM_MULT_DATA_1_OUT,
					D3		       =>INTERDIM_MULT_DATA_2_OUT,
					D4		       =>INTERDIM_MULT_DATA_3_OUT,
					D5		       =>INTERDIM_MULT_DATA_4_OUT,
					D6		       =>INTERDIM_MULT_DATA_5_OUT,
					D7		       =>INTERDIM_MULT_DATA_6_OUT,
					D8		       =>INTERDIM_MULT_DATA_7_OUT,
					clk		       =>clk,
					hold_seg_0	   =>master_out_hold_seg_0    ,
					hold_seg_1	   =>master_out_hold_seg_1    ,
					hold_seg_2	   =>master_out_hold_seg_2    ,
					hold_seg_3	   =>master_out_hold_seg_3    ,
					hold_seg_4	   =>master_out_hold_seg_4    ,
					hold_seg_5	   =>master_out_hold_seg_5    ,
					hold_seg_6	   =>master_out_hold_seg_6    ,
					hold_seg_7	   =>master_out_hold_seg_7    ,
					in_ctrl_all_seg=>master_out_in_ctrl_all_cb,
					rst		       =>rst,
					Q1		       =>CB_CIRCUIT_DATA_0_OUT,
					Q2		       =>CB_CIRCUIT_DATA_1_OUT,
					Q3		       =>CB_CIRCUIT_DATA_2_OUT,
					Q4		       =>CB_CIRCUIT_DATA_3_OUT,
					Q5		       =>CB_CIRCUIT_DATA_4_OUT,
					Q6		       =>CB_CIRCUIT_DATA_5_OUT,
					Q7		       =>CB_CIRCUIT_DATA_6_OUT,
					Q8		       =>CB_CIRCUIT_DATA_7_OUT
					
				);
FFT_8P_SECONDSTAGE :
	fft_8p_16b_top
		PORT MAP (
					xt0 =>CB_CIRCUIT_DATA_0_OUT,
					xt1 =>CB_CIRCUIT_DATA_1_OUT,
					xt2 =>CB_CIRCUIT_DATA_2_OUT,
					xt3 =>CB_CIRCUIT_DATA_3_OUT,
					xt4 =>CB_CIRCUIT_DATA_4_OUT,
					xt5 =>CB_CIRCUIT_DATA_5_OUT,
					xt6 =>CB_CIRCUIT_DATA_6_OUT,
					xt7 =>CB_CIRCUIT_DATA_7_OUT,
					xf0 =>FFT_8P_SECOND_DATA_0_OUT,
					xf1 =>FFT_8P_SECOND_DATA_1_OUT,
					xf2 =>FFT_8P_SECOND_DATA_2_OUT,
					xf3 =>FFT_8P_SECOND_DATA_3_OUT,
					xf4 =>FFT_8P_SECOND_DATA_4_OUT,
					xf5 =>FFT_8P_SECOND_DATA_5_OUT,
					xf6 =>FFT_8P_SECOND_DATA_6_OUT,
					xf7 =>FFT_8P_SECOND_DATA_7_OUT
				);				
Output_Block :
	output_circuit
		PORT MAP (
					D1		       =>FFT_8P_SECOND_DATA_0_OUT,
		            D2		       =>FFT_8P_SECOND_DATA_1_OUT,
		            D3		       =>FFT_8P_SECOND_DATA_2_OUT,
		            D4		       =>FFT_8P_SECOND_DATA_3_OUT,
		            D5		       =>FFT_8P_SECOND_DATA_4_OUT,
		            D6		       =>FFT_8P_SECOND_DATA_5_OUT,
		            D7		       =>FFT_8P_SECOND_DATA_6_OUT,
		            D8		       =>FFT_8P_SECOND_DATA_7_OUT,
		            clk		       =>clk,
		            hold_all_seg   =>master_out_hold_all_out,
		            in_ctrl_all_seg=>master_out_in_ctrl_all_out,
		            mode  		   =>Mode,
		            rst		       =>rst,
		            Q		       =>OUTPUT_CIRCUIT_DATA_OUT
				 );
OUT_COUNT :
	output_counter
		PORT MAP (
					clk		       =>clk,
					rst		       =>rst,
					dataind        =>master_out_counter_en,
					datavalid      =>OUTPUT_COUNTER_DATA_VAL
				);
MASTER_CTRL :
	master_control
	    PORT MAP (
					clk		        =>clk,
			        rst		        =>rst,
		            mastertrig		=>INPUT_COUNTER_MTRIG_OUT,
		            hold_all_in     =>master_out_hold_all_in,
		            hold_buf_3      =>master_out_hold_buf_3,
		            hold_buf_2      =>master_out_hold_buf_2,
		            hold_buf_1      =>master_out_hold_buf_1,
		            in_ctrl_buf_3   =>master_out_in_ctrl_buf_3,
		            in_ctrl_buf_2   =>master_out_in_ctrl_buf_2,
		            in_ctrl_buf_1   =>master_out_in_ctrl_buf_1,
		            pos_hold_ctrl   =>master_out_pos_hold_ctrl,
		            Shuf_Ctrl_1     =>master_out_Shuf_Ctrl_1,
		            Shuf_Ctrl_2     =>master_out_Shuf_Ctrl_2,
		            Shuf_Ctrl_3     =>master_out_Shuf_Ctrl_3,
		            Shuf_Ctrl_4     =>master_out_Shuf_Ctrl_4,
		            Shuf_Ctrl_5     =>master_out_Shuf_Ctrl_5,
		            Shuf_Ctrl_6     =>master_out_Shuf_Ctrl_6,
		            Shuf_Ctrl_7     =>master_out_Shuf_Ctrl_7,
		            Shuf_Ctrl_8     =>master_out_Shuf_Ctrl_8,
		            Type_Sel_1      =>master_out_Type_Sel_1,
		            Type_Sel_2      =>master_out_Type_Sel_2,
		            Type_Sel_3      =>master_out_Type_Sel_3,
		            Type_Sel_4      =>master_out_Type_Sel_4,
		            Type_Sel_5      =>master_out_Type_Sel_5,
		            Type_Sel_6      =>master_out_Type_Sel_6,
		            Type_Sel_7      =>master_out_Type_Sel_7,
		            Type_Sel_8      =>master_out_Type_Sel_8,
		            Bypass_Sel_0    =>master_out_Bypass_Sel_0,
		            Bypass_Sel_1    =>master_out_Bypass_Sel_1,
		            Bypass_Sel_2    =>master_out_Bypass_Sel_2,
		            Bypass_Sel_3    =>master_out_Bypass_Sel_3,
		            Bypass_Sel_4    =>master_out_Bypass_Sel_4,
		            Bypass_Sel_5    =>master_out_Bypass_Sel_5,
		            Bypass_Sel_6    =>master_out_Bypass_Sel_6,
		            Bypass_Sel_7    =>master_out_Bypass_Sel_7,
		            DeShuf_Ctrl_0   =>master_out_DeShuf_Ctrl_0,
		            DeShuf_Ctrl_1   =>master_out_DeShuf_Ctrl_1,
		            DeShuf_Ctrl_2   =>master_out_DeShuf_Ctrl_2,
		            DeShuf_Ctrl_3   =>master_out_DeShuf_Ctrl_3,
		            DeShuf_Ctrl_4   =>master_out_DeShuf_Ctrl_4,
		            DeShuf_Ctrl_5   =>master_out_DeShuf_Ctrl_5,
		            DeShuf_Ctrl_6   =>master_out_DeShuf_Ctrl_6,
		            DeShuf_Ctrl_7   =>master_out_DeShuf_Ctrl_7,
		            Bypass_EN_0     =>master_out_Bypass_EN_0,
		            Bypass_EN_1     =>master_out_Bypass_EN_1,
		            Bypass_EN_2     =>master_out_Bypass_EN_2,
		            Bypass_EN_3     =>master_out_Bypass_EN_3,
		            Bypass_EN_4     =>master_out_Bypass_EN_4,
		            Bypass_EN_5     =>master_out_Bypass_EN_5,
		            Bypass_EN_6     =>master_out_Bypass_EN_6,
		            Bypass_EN_7     =>master_out_Bypass_EN_7,
		            Hold_Ctrl_0     =>master_out_Hold_Ctrl_0,
		            Hold_Ctrl_1     =>master_out_Hold_Ctrl_1,
		            Hold_Ctrl_2     =>master_out_Hold_Ctrl_2,
		            Hold_Ctrl_3     =>master_out_Hold_Ctrl_3,
		            Hold_Ctrl_4     =>master_out_Hold_Ctrl_4,
		            Hold_Ctrl_5     =>master_out_Hold_Ctrl_5,
		            Hold_Ctrl_6     =>master_out_Hold_Ctrl_6,
		            Hold_Ctrl_7     =>master_out_Hold_Ctrl_7,
		            DFF_Ctrl_0      =>master_out_DFF_Ctrl_0,
		            DFF_Ctrl_1      =>master_out_DFF_Ctrl_1,
		            DFF_Ctrl_2      =>master_out_DFF_Ctrl_2,
		            DFF_Ctrl_3      =>master_out_DFF_Ctrl_3,
		            DFF_Ctrl_4      =>master_out_DFF_Ctrl_4,
		            DFF_Ctrl_5      =>master_out_DFF_Ctrl_5,
		            DFF_Ctrl_6      =>master_out_DFF_Ctrl_6,
		            DFF_Ctrl_7      =>master_out_DFF_Ctrl_7,
		            hold_seg_0      =>master_out_hold_seg_0,
		            hold_seg_1      =>master_out_hold_seg_1,
		            hold_seg_2      =>master_out_hold_seg_2,
		            hold_seg_3      =>master_out_hold_seg_3,
		            hold_seg_4      =>master_out_hold_seg_4,
		            hold_seg_5      =>master_out_hold_seg_5,
		            hold_seg_6      =>master_out_hold_seg_6,
		            hold_seg_7      =>master_out_hold_seg_7,
		            in_ctrl_all_cb  =>master_out_in_ctrl_all_cb,
		            hold_all_out    =>master_out_hold_all_out,
		            in_ctrl_all_out =>master_out_in_ctrl_all_out,
		            counter_en      =>master_out_counter_en    
				 );
END structural;