module alu(
input [7:0] a,
input [7:0] b,
input [3:0] opcode,
output reg [7:0] result
);

always @(*) begin
 case(opcode)

 4'b0001: result = a + b;
 4'b0010: result = a - b;
 4'b0011: result = a & b;
 4'b0100: result = a | b;

 default: result = 8'b00000000;

 endcase
end

endmodule