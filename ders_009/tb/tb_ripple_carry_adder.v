module tb_ripple_carry_adder;

localparam PROC_SIZE = 16;
reg [PROC_SIZE -1  :0] a;
reg [PROC_SIZE -1  :0] b;
wire [PROC_SIZE -1 :0] sum;
wire cout;

wire [PROC_SIZE :0] com;
assign com ={cout , sum};

ripple_carry_adder #(PROC_SIZE )dut (
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout)
);


initial begin 

a=16'd0; 
b=16'd0;
#10;
a=16'd1; 
b=16'd2;
#10;
a=16'd9; 
b=16'd10;
#10;
a=16'd15; 
b=16'd15;
#10;

end 
endmodule