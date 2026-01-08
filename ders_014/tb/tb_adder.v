`define WIDTH 8

module tb_adder;

    reg [`WIDTH-1:0] a;
    reg [`WIDTH-1:0] b;
    wire [`WIDTH-1:0] y;

    adder dut(a,b,y);

    initial begin 

        // non-blocking assignment ile strobe kullan ve sonrasında delay ekle öncesinde değil

        a<= 0;
        b<= 0;
        $strobe("a: %d, b: %d, y: %d",a,b,y);
        #10;

        a<= 1;
        b<= 0;
        $strobe("a: %d, b: %d, y: %d",a,b,y);
        #10;

        $finish;

    end




endmodule