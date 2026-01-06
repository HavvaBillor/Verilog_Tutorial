
module tb_verilog_data_types ();
    parameter integer size = 8;
    localparam integer width=16 ;

    wire        single_wire;
    wire [size-1 :0]  wire_8bit;
    wire [width-1 :0] wire_16bit;

    reg        single_reg;
    reg [size-1:0]  reg_8bit;
    reg [width-1:0] reg_16bit;

    assign single_wire  = single_reg;
    assign wire_8bit    = reg_8bit;
    assign wire_16bit   = reg_16bit;

    real point;
    time current_time;
    integer i;

    
    reg[15:0] string_;

// baslangıc değerlerini, başlangıç boyutu, signed mı unsigned 
    initial begin 

        $display("===VERILOG VERI TURLERI VE OZELLIKLERI===");

        #5; $display("\nWire baslangic degeri: %b", single_wire);
        #5; single_reg = 1'b0;
        #5; $display("atanan degeri: %b", single_wire);

        #5; $display("\nReg baslangic degeri: %b", wire_8bit);
        #5; reg_8bit = 10;
        #5; $display("atanan degeri: %d", reg_8bit);

        // wire başlangıç durumu 'z',  bir reg bağlı ise 'x', default unsigned 

        #5; $display("\nReg baslangic degeri: %b", reg_16bit);
        #5; reg_16bit = -10;
        #5; $display("atanan degeri: %d", reg_16bit);

        // reg başlangıç durumu 'x', default unsigned 

        #5; $display("\nReal baslangic degeri: %h", point);
        #5; point = -0.5;
        #5; $display("atanan degeri: %f", point);

        // real başlangıç durumu '0', default signed, bouyutu 32 bit

        #5; $display("\nTime baslangic degeri: %h", current_time);
        #5; current_time = $time;
        #5; $display("atanan degeri: %t", current_time);

        // time başlangıç durumu 'x', default signed

        #5; $display("\nInteger baslangic degeri: %h", i);
        #5; i = -10;
        #5; $display("atanan degeri: %d", i);

        // integer başlangıç durumu 'x', default signed, boyutu 32 bit 

        string_ = "FB";
        $display("\nString degeri: %s", string_);



    end


endmodule