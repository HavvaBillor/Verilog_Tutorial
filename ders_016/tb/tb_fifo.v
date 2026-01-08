module tb_fifo;

    localparam DATA_WIDTH = 8;
    localparam FIFO_DEPTH = 8;
    localparam CLK_PERIOD = 10; // clock period in ns

    //signals

    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH -1:0] wdata;
    wire [DATA_WIDTH -1:0] rdata;
    wire full;
    wire empty;

    fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) fifo_inst (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wdata(wdata),
        .rdata(rdata),
        .full(full),
        .empty(empty)
    );

    //CLOCK GENERATION

    initial begin 
        clk=0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // TEST STIMULUS
    initial begin 

        // VCD = value change dump
        // simulation sırasaında üretilen standart waveform dosyasıdır.
        // zamanla gerçekleşen sinyal değişimlerini kaydeder. Waveform viewer programları ile görüntülemek için kullanılır.
        //$dumpfile("dump.vcd");
        // $dumpvars(0,tb_fifo);

        rst   <= 1;
        wr_en <= 0;
        rd_en <= 0;
        wdata <= 0;

        //reset tfe fifo
        @(posedge clk) rst <= 0;
        $strobe("Reset completed at time: %0t", $time);

        // Test1: write to fifo until full
        $strobe("Test 1: Writing to FIFO until full");
        repeat (FIFO_DEPTH) begin
            @(posedge clk) ;
            wr_en <= 1;
            wdata <= $random % 256; // random 8-bit data
            #1;
            $strobe("Write data: %d, Full: %b, Empty: %b at time %0t",wdata,full,empty,$time);
        end
        @(posedge clk);
        wr_en <= 0; 

        // Test 2: Try writing when full
        $strobe("Test 2: Attempt writing when FIFO is full");
        @(posedge clk);
        wr_en <= 1;
        wdata <= $random % 256; // random 8-bit data
        #1
        $strobe("Attempt write when full, Full: %b, Empty: %b at time %0t",full,empty,$time);
        wr_en <= 0;

        //Test 3: Read from FIFO until empty
        $strobe("Test 3: Reading from FIFO until empty");
        repeat (FIFO_DEPTH)begin
            @(posedge clk) ;
            rd_en <= 1;
            #1;
            $strobe("Read data : %d, Full: %b, Empty: %b at time %0t", rdata, full, empty, $time);
        end
        @(posedge clk);
        rd_en <= 0;

        // Test 4: Try reading when empty
        $strobe("Test 4: Attempt Reading when FIFO is empty");
        @(posedge clk);
        rd_en <= 1;
        #1;
        $strobe("Attempt read when full, Full: %b, Empty: %b at time %0t",full,empty,$time);
        rd_en <= 0;

        // Test 5: Simultaneous write and read
        $strobe("Test 5: Simultaneous write and read");
        repeat (5)begin
            
            @(posedge clk);
            wr_en <= 1;
            rd_en <= 1;
            wdata <= $random % 256;
            #1;
            $strobe("Write Data: %d, Read data: %d, Full: %b, Empty: %b at time %0t",wdata,rdata,full,empty,$time);
        end
        @(posedge clk);
        wr_en <= 0;
        rd_en <= 0;

        //Test6: Reset during operation
        $strobe("Test 6: Reset during operation");
        repeat(3) begin 
            @(posedge clk);
            wr_en <= 1;
            wdata <= $random %256;
        end
        @(posedge clk);
        rst <= 1;
        @(posedge clk);
        rst <= 0;
        $strobe("Reset during operation, Full: %b, Empty: %b at time %0t",full,empty,$time);

        //End simulation
        repeat(2) @(posedge clk); // #20;
        $strobe("Simulation completed at time %0t",$time);
        $finish;
    end

    //Monitor signals
    initial begin 
        $monitor("Time: %0t | rst: %b | wr_en: %b | rd_en: %b | wdata: %d | rdata: %d | full: %b | empty: %b ", $time,rst,wr_en,rd_en,wdata,rdata,full,empty);
    end

endmodule
