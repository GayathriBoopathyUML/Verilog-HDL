`timescale 1ns / 1ps

module tb_adder;

// Parameters
parameter PERIOD = 10; // Time period for clock

// Inputs
reg a, b, cin;
// Outputs
wire sum, cout;

// Instantiate the full adder module
adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout) // Corrected to .carry instead of .cout
);

// Clock generation
reg clk = 0;
always #((PERIOD / 2)) clk = ~clk;

// Stimulus generation
initial begin
    // Initialize inputs
    a = 0;
    b = 0;
    cin = 0;

    // Apply inputs and display outputs
    $display("Time a b cin | sum cout");
    repeat (10) begin
		  $display("%0t %b %b %b | %b %b", $time, a, b, cin, sum, cout);
	 
			#(PERIOD/2) a = ~a; // Toggle 'a' every half period
			#(PERIOD)   b = ~b; // Toggle 'b' every full period
			#(PERIOD*2) cin = ~cin; // Toggle 'cin' every two full periods

        // $display("%0t %b %b %b | %b %b", $time, a, b, cin, sum, cout);
    end

    // End simulation
    $finish;
end

endmodule
