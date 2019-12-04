module input_counter(
  clk,
  rst,
  datastart,
  counter_o,
  mastertrig
  );
  
  input        clk;
  input        rst;
  input        datastart;
  output [5:0] counter_o;
  output       mastertrig;
  
  wire         clk;
  wire         rst;
  wire         datastart;
  wire   [5:0] counter_o;
  reg          mastertrig;
  
  localparam idle     = 1'b0; 
  localparam counting = 1'b1; 
  
  reg       currentstate;
  reg [5:0] counter;
  
  assign counter_o = counter;
  
  always@(posedge clk)
    begin
     if(rst==1'b1)
        begin
         currentstate <= idle;
        end
      else 
        begin
          case (currentstate)
            idle:
              begin
                if(datastart==1'b1)
                  begin
                    currentstate <= counting;
                    counter      <= 6'b0;
                    mastertrig   <= 1'b0;
                  end
                else 
                  begin
                    currentstate <= currentstate;
                    counter      <= 6'b0;
                    mastertrig   <= 1'b0;
                  end
              end
           counting:
             begin
               if(counter == 6'b110101)
                 begin
                   currentstate <= counting;
                   counter      <= counter + 1;
                   mastertrig   <= 1;
                 end
               else if(counter == 6'b111110)
                 begin
                   currentstate <= idle;
                   counter      <= counter + 1;
                   mastertrig   <= 0;
                 end
               else 
                 begin
                   currentstate <= counting;
                   counter      <= counter + 1;
                   mastertrig   <= 0;
                 end
             end
          endcase
  	end
  end
endmodule
