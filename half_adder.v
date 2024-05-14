module half_adder(
    input a, b,
    output sum, carry
);

assign sum = a ^ b; // XOR operation for sum
assign carry = a & b; // AND operation for carry

endmodule
