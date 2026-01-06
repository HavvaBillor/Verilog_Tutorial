`timescale 1ns/1ps

module tb_control_flow;

reg [3:0] a,b;
integer i;

initial begin 

    $display("-------------------------------- ");
// koşullu dallanma : if-else

    a=3;
    b=7;

    #5;
    if(a==b) begin
        $display("a=b\n");
    end 
    else if(a<b) begin 
        $display("a<b\n");
    end
    else begin 
        $display("buyuk degil\n");
    end 
    #50;

    // case yapısı

    $display("-----------case yapisi---------------------");

    case(a) 
        4'd0: begin 
             $display("a = 0\n");
        end
        4'd5: $display("a = 5\n");
        4'd7: $display("a = 7\n");
        default : $display("a bilinmeyen bir deger\n"); 
    endcase


    // for döngüsü 
    // başlatma veya dizi erişimi için kullanılır

    $display("-----------for dongusu---------------------");
    for (i=0; i<4; i= i+1) begin 
        $display("for: i = %d", i);
    end

    // while döngüsü
    // koşul sağlandığı sürece döngü devam eder. Sentezde kullanımı önerilmez.

    $display("-----------while dongusu---------------------");
    i=0;
    while (i<4) begin 
        $display("while: i = %d", i);
        i = i+1;
    end

    //repeat döngüsü
    // belirli sayıda tekrarlama için kullanılır
    $display("-----------repeat dongusu---------------------");
    i=0;
    repeat (4) begin
        $display("repeat: i = %d", i);
        i = i+1;
    end

    $display("-------------------------------- ");
    repeat (2) begin
        $display("repeat tekrarlandi");
        
    end
end

//forever döngüsü
// sürekli tekrar eden işlemler için kullanılır
//reg clk;
//initial begin 
//    clk=0;
//    forever begin
//    
//        #5; clk= ~clk;
//
//    end
//end


endmodule