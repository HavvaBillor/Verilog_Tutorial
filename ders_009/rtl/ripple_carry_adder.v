module ripple_carry_adder #(parameter SIZE = 4, parameter my_sum = 0)(

input [SIZE -1 :0] a,
input [SIZE -1 :0] b,
output [SIZE -1 :0] sum,
output cout
);

/*

    1111
    1111
  + _____
  11110
*/

wire [SIZE :0] cin;
assign cin[0] = 1'b0;

genvar i;
generate 

    if(my_sum) begin

        for (i = 0; i<SIZE ; i=i+1) begin :full_adder 
            full_adder fa0(
        
            .a(a[i]),
            .b(b[i]),
            .cin(cin[i]),
            .sum(sum[i]),
            .carry(cin[i+1])
        );

        end
        assign cout = cin[SIZE];
    end else begin 
        assign {cout,sum}= a+b;
    end
endgenerate



/*
full_adder fa0(

    .a(a[0]),
    .b(b[0]),
    .cin(1'b0),
    .sum(sum[0]),
    .carry(cin[0])
);

full_adder fa1(

    .a(a[1]),
    .b(b[1]),
    .cin(cin[0]),
    .sum(sum[1]),
    .carry(cin[1])
);

full_adder fa2(

    .a(a[2]),
    .b(b[2]),
    .cin(cin[1]),
    .sum(sum[2]),
    .carry(cin[2])
);

full_adder fa3(

    .a(a[3]),
    .b(b[3]),
    .cin(cin[2]),
    .sum(sum[3]),
    .carry(cin[3])
);
assign cout = cin[3];

*/ 


endmodule
