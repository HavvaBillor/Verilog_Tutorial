module tb_task_func;

    reg [2:0] a;
    reg [2:0] b;
    reg [6:0] c;
    reg [6:0] comb;
    reg [6:0] assgn;
    reg flag;
    wire [2:0] wait_wire;

    reg clk = 0;
    always #5 clk = ~clk;

    // always @(*)begin   // fonksiyon input larını hassasiyet listesine almaz
    //     comb = calculator(2'b10,2'b01);
    // end

    assign assgn = calculator(2'b10,2'b01);

    initial begin 

        a = 0;
        b = 0;
        c = 0;
        


        $display("\nTime: %0t",$time);

        /* Function 

            - Simulasyon zamanı tüketmezler
            - Sadece 1 değer dönerler(return)
            - Herhangi bir zaman ifadesi içeremezler #10, @(posedge clk), vs.
            - Fonksiyon çağrıldığında çalışırlar
            - Task çağrılmaz 
   
        */
        #10;
        c = calculator(2'b10,2'b01);

        $display("\n Time : %0t  c_diff: %0d, c_sum : %0d", $time, c[6:4], c[3:0]);

        /* Task

            - Simulasyon zamanı tüketecek ifadeler içerebilirler #10, @(posedge clk), vs.
            - Birden fazla değer döndürebilirler (output, input)
            - Task içinde task veya function çağrılabilir
            - assign ile kullanılamazlar
   
        */
        a=2;
        b=3;
        wait(wait_wire == 2'b11);
        my_proc(a,b,flag);
        $display("\n Time : %0t  flag: %0d", $time, flag);
        $stop;

    end

    assign #40 wait_wire = 2'b11;

    task my_proc;
        input [2:0] a ;
        input [2:0] b ;
        output flag;
        begin 
            @(posedge clk);
            flag = ($signed((a-b))< 0);
        end
        
       

    endtask


    function [3:0] add ;

        input [2:0] a;
        input [2:0] b;
        add = a + b;
    endfunction

    function [2:0] sub ;

        input [2:0] a;
        input [2:0] b;
        sub = a - b;
    endfunction


    function [6:0] calculator ;

        input [2:0] a;
        input [2:0] b;
        reg [3:0] sum;
        reg [2:0] diff;
        begin
            sum = add(a,b);
            diff= sub(a,b);
            calculator = {diff,sum};
            
        end
    endfunction


        



endmodule