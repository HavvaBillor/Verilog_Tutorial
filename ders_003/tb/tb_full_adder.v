`timescale 1ns / 1ps

module tb_full_adder();

    // Testbench signals
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire carry;

    // Instantiate the half adder module
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    // Test procedure
    initial begin
       
        // Monitor changes
        $monitor(" num1: %b, num2: %b, num3: %b | sum: %b, carry: %b",  a, b, cin,  sum, carry);

        // Test all input combinations
        #10;
        a = 0; b = 0; cin=0;
        #10;
        a = 0; b = 0; cin=1; 
        #10;
        a = 0; b = 1; cin=0; 
        #10;
        a = 0; b = 1; cin=1;
        #10;
        a = 1; b = 0; cin=0;
        #10;
        a = 1; b = 0; cin=1; 
        #10;
        a = 1; b = 1; cin=0; 
        #10;
        a = 1; b = 1; cin=1;
        #10;
        
    end
endmodule