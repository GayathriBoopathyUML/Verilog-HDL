module half_subtractor(
    input a, b,
    output diff, borrow
);

assign diff = a ^ b; // XOR operation for diff
assign borrow = !a & b; // AND operation for borrow

endmodule
