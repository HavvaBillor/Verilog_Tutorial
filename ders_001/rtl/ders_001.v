/*
    ders 1'in kodlarını yazıyorum
*/
module ders_001(
    input wire [3:0]a,  // wire
    input wire [3:0]b,
    output wire [3:0]y
);

    assign y = a & b;

endmodule