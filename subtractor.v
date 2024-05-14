module subtractor(
    input a, b, b_in,
    output diff, b_out
);

wire ha1_diff, ha1_b, ha2_b;

// First half subtractor
half_subtractor ha1(
    .a(a),
    .b(b),
    .diff(ha1_diff),
    .borrow(ha1_b)
);

// Second half subtractor
half_subtractor ha2(
    .a(ha1_diff),
    .b(b_in),
    .diff(diff),
    .borrow(ha2_b)
);

// OR gate to calculate final borrow out
assign b_out = ha1_b | ha2_b;

endmodule
