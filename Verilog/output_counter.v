module output_counter(
  clk,
  rst,
  dataind,
  counter_o,
  datavalid,
  in_ctrl_all_out,
  hold_all_out
  );
  
  input        clk;
  input        rst;
  input        dataind;
  output [5:0] counter_o;
  output       datavalid;
  output       in_ctrl_all_out;
  output       hold_all_out;
  
  wire         clk;
  wire         rst;
  wire         dataind;
  wire   [5:0] counter_o;
  reg          datavalid;
  reg          in_ctrl_all_out;
  reg          hold_all_out;  
  
  
  localparam idle     = 2'b00; 
  localparam prepare  = 2'b01;
  localparam counting = 2'b11; 
  
  reg [1:0] currentstate;
  reg [5:0] counter;
  
  assign counter_o = counter;
  
  always@(posedge clk)
    begin
      if(rst==1'b1)
        begin
          currentstate    <= idle;
          counter         <= 6'b111111;
          datavalid       <= 1'b0;
          in_ctrl_all_out <= 1'b0;
          hold_all_out    <= 1'b1;
        end
      else 
        begin
          case (currentstate)
            idle:
              begin
                if(dataind==1'b1)
                  begin
                    currentstate    <= prepare;
                    counter         <= counter;
                    datavalid       <= 1'b0;
                    in_ctrl_all_out <= 1'b1;
                    hold_all_out    <= 1'b0;
                  end
                else 
                  begin
                    currentstate    <= currentstate;
                    counter         <= counter;
                    datavalid       <= 1'b0;
                    in_ctrl_all_out <= 1'b0;
                    hold_all_out    <= 1'b1;
                  end
              end
            prepare:
              begin
                currentstate    <= counting;
                counter         <= 6'b0;
                datavalid       <= 1'b1;
                in_ctrl_all_out <= 1'b1;
                hold_all_out    <= 1'b0;
              end
            counting:
              begin
                if(counter< 6'b000110)
                  begin
                    currentstate    <= counting;
                    counter         <= counter + 1'b1;
                    datavalid       <= 1'b1;
                    in_ctrl_all_out <= 1'b1;
                    hold_all_out    <= 1'b0;
                  end
                else
                  begin
                    if(counter == 6'b111110)
                      begin
                        currentstate    <= idle;
                        counter         <= counter + 1'b1;
                        datavalid       <= 1;
                        in_ctrl_all_out <= 1'b0;
                        hold_all_out    <= 1'b0;
                      end
                    else 
                      begin
                        currentstate    <= counting;
                        counter         <= counter + 1'b1;
                        datavalid       <= 1;
                        in_ctrl_all_out <= 1'b0;
                        hold_all_out    <= 1'b0;
                      end
                  end
                
              end
          endcase
        end
    end
endmodule
