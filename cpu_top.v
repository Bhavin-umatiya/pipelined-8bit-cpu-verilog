module cpu_top(
input clk,
input reset
);

wire [7:0] pc_out;
wire [7:0] instruction;

wire [7:0] reg_data1;
wire [7:0] reg_data2;
wire [7:0] alu_result;

wire [3:0] opcode;
wire [1:0] rs1;
wire [1:0] rs2;

assign opcode = instruction[7:4];
assign rs1 = instruction[3:2];
assign rs2 = instruction[1:0];

pc PC(
.clk(clk),
.reset(reset),
.pc_out(pc_out)
);

instruction_memory IM(
.address(pc_out),
.instruction(instruction)
);

register_file RF(
.clk(clk),
.reset(reset),
.rs1(rs1),
.rs2(rs2),
.rd(rs1),
.write_data(alu_result),
.reg_write(1'b1),
.read_data1(reg_data1),
.read_data2(reg_data2)
);

alu ALU(
.a(reg_data1),
.b(reg_data2),
.opcode(opcode),
.result(alu_result)
);

endmodule