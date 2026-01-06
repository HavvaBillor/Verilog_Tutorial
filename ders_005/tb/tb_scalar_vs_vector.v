module tb_scalar_vs_vector;

    wire wire_scalar;
    reg reg_scalar;

    // packed vs unpacked

    //packed

    // veri tanımlayıcısı isminden önce boyut belirtilir
    // tek bitlik veri türlerinden herhangi biri olabilir
    // tek boyutlu packed dizilere ayrıca vektör de denir
    // paketlenmiş bir dizi hafızada bitişik bit seti olarak temsil edilir

    wire [7:0] wire_vector;
    reg [7:0] reg_vector = 8'b0001_1010;

    //Unpacked
    // veri tanımlayıcısı isminden sonra boyut belirtilir
    //herhangi bir veri türünden olabilir
    // tek boyutlu unpacked dizilere ayrıca array da denir

    reg reg_unpacked [1:0];
    wire wire_unpacked [1:0];
    integer integer_unpacked [1:0];
    real real_unpacked [1:0];
    time time_unpacked [1:0];

initial begin
    
    // vector part select 
        reg_vector[3:1]=3'b000;
        $display("----------------------------");
        $display("7.bit : %b\n", reg_vector[7]);  
        $display("3-1 bitler : %b\n", reg_vector[3:1]); 


end

initial begin 

    #5;
    integer_unpacked[1]= -10;
    integer_unpacked[0]= -5;
    $display("----------------------------");
    $display("satir 1: %d\n", integer_unpacked[1]);  
    $display("satir 0: %d\n", integer_unpacked[0]);  

end

// assaigmnet ve truncation

reg [7:0] reg_a;
reg [3:0] reg_b;

initial begin 
    // zero padding

    #10;
    reg_b = 4'b1101;
    reg_a = reg_b;

    $display("----------------------------");
    $display("reg_a : %b\n", reg_a);

    // truncation

    #10;
    reg_a = 8'b1010_1111;
    reg_b = reg_a;

    $display("reg_b : %b\n", reg_b);

end

reg [7:0] image0 [63:0][63:0];
//  2.            0.     1. 
// image [0][1][2];
reg [0:7] image1 [0:63][0:63];

// bellekler memory

reg [7:0] mem [1:0]; 

initial begin 

#20;

$readmemh("mem.hex", mem);
$display("----------------------------");
$display("mem[0] : %h", mem[0]);
$display("mem[1] : %h", mem[1]);


end


endmodule