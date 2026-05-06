module instruction_memory(
input [7:0] address,
output [7:0] instruction
);

reg [7:0] memory [255:0];

initial begin
    memory[0] = 8'b00010001; // ADD R0,R1
    memory[1] = 8'b00100010; // SUB R0,R2
    memory[2] = 8'b00110001; // AND R0,R1
    memory[3] = 8'b01000011; // OR  R0,R3
end

assign instruction = memory[address];

endmodule
