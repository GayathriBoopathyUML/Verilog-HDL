`timescale 1ns / 1ps

module tb_subtractor;

// Parameters
parameter PERIOD = 10; // Time period for clock

// Inputs
reg a, b, b_in;
// Outputs
wire diff, b_out;

// Instantiate the full subtractor module
subtractor dut (
    .a(a),
    .b(b),
    .b_in(b_in),
    .diff(diff),
    .b_out(b_out) 
);

// Clock generation
reg clk = 0;
always #((PERIOD / 2)) clk = ~clk;

// Stimulus generation
initial begin
    // Initialize inputs
    a = 0;
    b = 0;
    b_in = 0;

    // Apply inputs and display outputs
    $display("Time a b b_in | diff b_out");
    repeat (10) begin
		  $display("%0t %b %b %b | %b %b", $time, a, b, b_in, diff, b_out);
	 
			#(PERIOD/2) a = ~a; // Toggle 'a' every half period
			#(PERIOD)   b = ~b; // Toggle 'b' every full period
			#(PERIOD*2) b_in = ~b_in; // Toggle 'b_in' every two full periods

        // $display("%0t %b %b %b | %b %b", $time, a, b, b_in, diff, b_out);
    end

    // End simulation
    $finish;
end

endmodule
