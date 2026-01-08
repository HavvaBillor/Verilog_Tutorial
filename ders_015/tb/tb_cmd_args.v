module tb_cmd_args ;

    integer seed;
    reg verbose;

    initial begin
        // Get numeric seed from command line
        if (!$value$plusargs("SEED=%d",seed))begin 
            seed = 0; // default seed
        end

        // check for verbose
        if($test$plusargs("VERBOSE"))begin
            verbose = 1;
            $display("verbose mode is on.");
        end else begin
            verbose =0;
        end

        $display("Simulation Seed = %0d",seed);
        #10 $finish;


    end


endmodule

/*
  AMAÇ:
  Bu testbench, simülasyon çalıştırılırken terminalden
  parametre (plusargs) almayı gösterir.

  +SEED=<sayi> :
    - Terminalden sayısal seed okunur
    - Verilmezse seed = 0 olur (default)
    - Random testlerin tekrar edilebilir olmasını sağlar

  +VERBOSE :
    - Sadece var mı diye kontrol edilir
    - Varsa verbose/debug modu açılır

  Örnek çalıştırma:
    vsim tb_cmd_args +SEED=10 +VERBOSE

  Kullanılan sistem task'ler:
    $value$plusargs -> sayısal parametre okur
    $test$plusargs  -> parametrenin varlığını kontrol eder
*/
