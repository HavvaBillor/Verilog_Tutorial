
module full_adder(

    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire carry
);
    wire sum_half1;
    wire carry_half1;
    wire carry_half2;

    // First half adder
    half_adder ha1 (
        .a(a),
        .b(b),
        .sum(sum_half1),
        .carry(carry_half1)
    );

    // Second half adder
    half_adder ha2 (
        .a(sum_half1),
        .b(cin),
        .sum(sum),
        .carry(carry_half2)
    );

    // Final carry output
    assign carry = carry_half1 | carry_half2;

endmodule