module testbench_mux8x1;

// Parameters
parameter DELAY = 10;

// Inputs
reg [7:0] data [7:0]; // 8 input data lines
reg [2:0] select;      // Select input

// Output
wire [7:0] out;        // Output

// Instantiate mux8x1 module
mux8x1 uut (
    .data(data),
    .select(select),
    .out(out)
);

// Stimulus
initial begin
    // Initialize inputs with random values
    for (int i = 0; i < 8; i = i + 1) begin
        data[i] = 8'h00; // Initialize with zero
    end
    
    for (int i = 0; i < 8; i = i + 1) begin
        data[i] = $urandom_range(8'hAA, 8'hEE); 
		  // Assign random values to each element
    end
    
    select = 0;
    
    // Apply stimulus
    #DELAY;
    select = 1;
    #DELAY;
    select = 2;
    #DELAY;
    select = 3;
    #DELAY;
    select = 4;
    #DELAY;
    select = 5;
    #DELAY;
    select = 6;
    #DELAY;
    select = 7;
    #DELAY;
    select = 8; // Invalid select
    #DELAY;
    select = 3;
    #DELAY;
    // Add more stimulus as needed
    $finish; // End simulation
end

endmodule
