`define WIDTH 8
`define SUM

module adder(
    input [`WIDTH-1:0] a,b,
    output reg [`WIDTH-1:0] y
);

// `ifdef SUM
//     assign y= a + b ;
// `endif 

`include "adder.vh"

reg [`WIDTH-1:0] temp;
`my_always(temp,a,b,y)

endmodule