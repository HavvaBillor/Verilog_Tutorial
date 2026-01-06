module reg_file (

input clk_i,
input rst_ni,
input rw_en_i,
input [4:0] r1_addr_i,
input [4:0] r2_addr_i,
input [4:0] w_addr_i,
input [31:0] w_data_i,
output reg [31:0] r1_data_o,
output reg [31:0] r2_data_o
);


reg [31:0] registers [31:0];
integer i;

always @(posedge clk_i) begin 

    if(!rst_ni) begin
    
        for(i =0; i<32; i=i+1) begin
            registers[i] <= 0;
        end
    end else if (rw_en_i && w_addr_i != 0) begin
        registers[w_addr_i] <= w_data_i;
    end

end

always @(*) begin 

    r1_data_o = registers[r1_addr_i];
    r2_data_o = registers[r2_addr_i];

end

endmodule