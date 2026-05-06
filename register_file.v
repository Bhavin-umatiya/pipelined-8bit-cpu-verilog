module register_file(
input clk,
input reset,
input [1:0] rs1,
input [1:0] rs2,
input [1:0] rd,
input [7:0] write_data,
input reg_write,
output [7:0] read_data1,
output [7:0] read_data2
);

reg [7:0] regfile [3:0];

assign read_data1 = regfile[rs1];
assign read_data2 = regfile[rs2];

integer i;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=0;i<4;i=i+1)
            regfile[i] <= 8'b00000000;
    end
    else
    begin
        if(reg_write)
            regfile[rd] <= write_data;
    end
end

endmodule