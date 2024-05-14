module adder(
    input a, b, cin,
    output sum, cout
);

wire ha1_sum, ha1_carry, ha2_carry;

// First half adder
half_adder ha1(
    .a(a),
    .b(b),
    .sum(ha1_sum),
    .carry(ha1_carry)
);

// Second half adder
half_adder ha2(
    .a(ha1_sum),
    .b(cin),
    .sum(sum),
    .carry(ha2_carry)
);

// OR gate to calculate final carry out
assign cout = ha1_carry | ha2_carry;

endmodule
