module tb_dff ;

reg clk =0;
reg rst;
reg [3:0] d;
wire [3:0] q;

dff dut(
clk,
rst,
d,
q
);

always #5 clk = ~clk;

initial begin 

    // VCD = value change dump
    // simulation sırasaında üretilen standart waveform dosyasıdır.
    // zamanla gerçekleşen sinyal değişimlerini kaydeder. Waveform viewer programları ile görüntülemek için kullanılır.
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_dff);

    // blocking assignment yazılımcı mantığı ile çalışır ama bu race condition oluşturabilir.
    // non-blocking assignment ise donanım mantığı ile çalışır ve race condition için daha güvenlidir.

    /*
    $random                    returns a 32 bit signed pseudo-random integer           r= $random;
    $urandom                   returns a 32 bit unsigned pseudo-random integer         r= $urandom;
    $urandom_range(min,max)    bounded unsgined random                                 r= $urandom_range(0,15);
    
    */

    rst <= 0;
    d <= $random;
    @(posedge clk);

    rst <= 1;
    @(posedge clk);
    
    rst <= 0;
    d <= $urandom;
    @(posedge clk);

    d <= $urandom_range(0,15);
    @(posedge clk);

    $stop;

end


endmodule