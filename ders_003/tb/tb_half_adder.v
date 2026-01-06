`timescale 1ns / 1ps

module tb_half_adder();

    // Testbench signals
    reg a;
    reg b;
    wire sum;
    wire carry;

    // Instantiate the half adder module
    half_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Test procedure
    initial begin
       
        // Monitor changes
        $monitor(" num1: %b, num2: %b | sum: %b, carry: %b",  a, b, sum, carry);

        // Test all input combinations
        #10;
        a = 0; b = 0; 
        #10;
        a = 0; b = 1; 
        #10;
        a = 1; b = 0; 
        #10;
        a = 1; b = 1; 
        #10;
        
    end
endmodule