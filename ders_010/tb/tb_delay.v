module tb_delay ;

reg [2:0] a;
reg [5:0] b;
reg [5:0] c;
reg clk =0;

always #5 clk =~clk;

initial begin
    // #10;
    // a=3;
    // b=0;
    // c=0;
    // $display("time :%0t a: %d",$time , a);
// 
    // @(posedge clk);
    // $display("time :%0t, posedge",$time);
    // // c=b*a;                                           // bu şekilde iken sıralı akış olur 
    // // b= 2*a;                                            // bu şekilde iken sıralı akış olur
    // c <= b*a;
    // b <= 2*a;
    // $display("time :%0t b: %d, c: %d",$time , b, c);  

    // !!!!!!!!!!!! RACE CONDITION !!!!!!!!!!!!
    // --------------------------------------------

    // bu öneriliyor

    a<=0;
    b<=0;

    @(posedge clk);

    #10;
    $stop;




end

endmodule