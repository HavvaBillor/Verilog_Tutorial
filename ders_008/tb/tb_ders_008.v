
module tb_ders_008 ();

//--------------concatenation ve replication--------------------

wire [3:0]  wire_4bit;
wire [7:0]  wire_8bit;
wire [11:0] wire_12bit;
wire [15:0] wire_16bit;


assign wire_4bit = 4'b0010;                    // veri etiketi
assign wire_8bit = 8'b1111_1010;              // veri sırası
assign wire_12bit = {wire_8bit, wire_4bit};  // concatenation (birleştirme)
assign wire_16bit = {wire_8bit, {2{wire_4bit}}};         // replication (tekrarlama) 


// initial begin : concatenation 
// 
//     #10;
//     $display("12 bit : %b", wire_12bit);
//     $display("16 bit : %b", wire_16bit);
// 
// end 

// ----------------------------sized & unsized constants ------------------------------

// wire [31:0] data_w;
// assign data_w =31'd5; 
// 
// initial begin 
// 
//     #10;
//     $display("data_w : %b", data_w);
// 
// end


reg [31:0] data_reg;

initial begin : sized 

    data_reg = 32'hFFCC_DD??;
    #10;
    $display("data_reg : %b", data_reg);

end

endmodule