`default_nettype none

module tes_bench32;  // testbench for the 32-bit unsigned Kogge-Stone adder
                     // exhaustive checking of partial 1024*1024*2 possible cases

reg  [31:0] a, b;    // 32-bit operands
reg         c0;      // carry input
wire [31:0] s;       // 32-bit sum output
wire        c32;     // carry output
reg  [32:0] check;   // 33-bit value to check correctness
integer i, j, k;     // loop variables
integer num_correct; // counter to keep track of the number correct
integer num_wrong;   // counter to keep track of the number wrong

// instantiate the 32-bit Kogge-Stone adder
ksa_top ks32(c0, a, b, s, c32);

// exhaustive checking
initial begin
  $display("Running testbench, this may take a minute or two...");
  // initialize the counter variables
  num_correct = 0; num_wrong = 0;
  // loop through all possible cases and record the results
  for (i = 0; i < 1024; i = i + 1) begin
    a = i;
    for (j = 0; j < 1024; j = j + 1) begin
      b = j;
      for (k = 0; k < 2; k = k + 1) begin
        c0 = k;
        check = a + b + c0;

        // compute and check the product
        #2;
        if ({c32, s} == check) begin
          num_correct = num_correct + 1;
        end else begin
          num_wrong = num_wrong + 1;
        end

        // following line is for debugging
        // $display($time, " %d + %d + %d = %d (%d)", a, b, c0, {c32, s}, check);
      end
    end
  end
  // print the final counter values
  $display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);

  $finish;
end

endmodule
