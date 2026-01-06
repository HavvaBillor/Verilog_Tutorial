module tb_reg_file ();

reg    clk_i;
reg    rst_ni;
reg    rw_en_i;
reg    [4:0] r1_addr_i;
reg    [4:0] r2_addr_i;
reg    [4:0] w_addr_i;
reg    [31:0] w_data_i;
wire   [31:0] r1_data_o;
wire   [31:0] r2_data_o;

reg_file dut(

clk_i,
rst_ni,
rw_en_i,
r1_addr_i,
r2_addr_i,
w_addr_i,
w_data_i,
r1_data_o,
r2_data_o

);


initial begin 

    clk_i = 0;
    forever begin 
        #5; clk_i = ~clk_i;
    end

end

initial begin

    rst_ni= 1;
    rw_en_i = 0;
    r1_addr_i = 0;
    r2_addr_i = 0;
    w_addr_i = 0;
    w_data_i = 0;
    #10;

    // reset atma

    rst_ni= 0;
    #10;
    rst_ni= 1;

    // yazma

    rw_en_i = 1;
    r1_addr_i = 0;
    r2_addr_i = 0;
    w_addr_i = 5;
    w_data_i = 7;
    #10;

    // okuma

    rw_en_i = 0;
    r1_addr_i = 0;
    r2_addr_i = 5;
    w_addr_i = 0;
    w_data_i = 0;
    #10;

    // yazma

    rw_en_i = 1;
    r1_addr_i = 0;
    r2_addr_i = 0;
    w_addr_i = 0;
    w_data_i = 3;
    #10;

    // okuma

    rw_en_i = 0;
    r1_addr_i = 5;
    r2_addr_i = 0;
    w_addr_i = 0;
    w_data_i = 0;
    #10;

end

endmodule
