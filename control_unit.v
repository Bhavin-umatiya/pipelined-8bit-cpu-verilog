module control_unit(
input [3:0] opcode,
output reg alu_op,
output reg reg_write
);

always @(*) begin

case(opcode)

4'b0001:
begin
 alu_op = 1;
 reg_write = 1;
end

default:
begin
 alu_op = 0;
 reg_write = 0;
end

endcase

end

endmodule