

module tb_ders_001;

    reg [3:0]a;
    reg [3:0]b;
    wire [3:0]y;
    wire temp;

    ders_001 dut(

        .a(a),
        .b(b),
        .y(y)    

    );

    initial begin 

        #10;
        a=4'b0101; b=4'd10;   // default 32 bit
        #5;
        a=4'hC; b=0;
        $display("out\n");
        $display("a=%b b=%b y:%h \n", a, b, y);


    end 

endmodule 