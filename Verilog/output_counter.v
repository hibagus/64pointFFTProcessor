module output_counter(
  clk,
  rst,
  dataind,
  counter_o,
  datavalid
  );
  
  input        clk;
  input        rst;
  input        dataind;
  output [5:0] counter_o;
  output       datavalid;
  
  wire         clk;
  wire         rst;
  wire         dataind;
  wire   [5:0] counter_o;
  reg          datavalid;
  
  
  localparam idle     = 1'b0; 
  localparam counting = 1'b1; 
  
  reg currentstate;
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
                if(dataind==1'b1)
                  begin
                    currentstate <= counting;
                    counter      <= 6'b0;
                    datavalid    <= 1'b0;
                  end
                else 
                  begin
                    currentstate <= currentstate;
                    counter      <= 6'b0;
                    datavalid    <= 1'b0;
                  end
              end
            counting:
              begin
                if(counter == 6'b111110)
                  begin
                    currentstate <= idle;
                    counter      <= counter + 1'b1;
                    datavalid    <= 1;
                  end
                else 
                  begin
                    currentstate <= counting;
                    counter <= counter + 1'b1;
                    datavalid <= 1;
                  end
              end
          endcase
        end
    end
endmodule
