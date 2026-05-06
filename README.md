# Custom 8-bit Pipelined CPU Core

## Architecture Overview
RTL implementation of a custom **5-stage pipelined** 8-bit CPU core in Verilog HDL. Designed with a hardware-centric approach to achieve high throughput and instruction-level parallelism, optimized for straightforward synthesis and RTL simulation.

- **Datapath**: 5-stage pipeline (Instruction Fetch `IF`, Instruction Decode `ID`, Execute `EX`, Memory `MEM`, Write-Back `WB`).
- **Instruction Set Architecture (ISA)**: Custom 8-bit instruction set (4-bit Opcode, 2-bit RS1, 2-bit RS2).
- **Register File**: 4x8-bit general-purpose registers (`R0`-`R3`) featuring synchronous writes and asynchronous reads.
- **ALU**: Combinational arithmetic logic unit supporting hardware-level arithmetic (`ADD`, `SUB`) and bitwise operations (`AND`, `OR`).
- **Program Counter**: Synchronous incrementing counter with asynchronous reset.

## Instruction Set Format
**Instruction Width:** 8-bit
- `[7:4]`: Opcode
- `[3:2]`: Source/Destination Register 1 (`rs1` / `rd`)
- `[1:0]`: Source Register 2 (`rs2`)

### Supported Opcodes
| Opcode | Mnemonic | RTL Operation |
|--------|----------|---------------|
| `0001` | `ADD`    | `R[rs1] <= R[rs1] + R[rs2]` |
| `0010` | `SUB`    | `R[rs1] <= R[rs1] - R[rs2]` |
| `0011` | `AND`    | `R[rs1] <= R[rs1] & R[rs2]` |
| `0100` | `OR`     | `R[rs1] <= R[rs1] \| R[rs2]` |

## Synthesis & Implementation Results
Targeting an **Intel Cyclone IV EP4CE115F29C7** FPGA (estimated metrics for portfolio demonstration):

- **Maximum Operating Frequency (Fmax):** ~280 MHz
- **Logic Elements (LEs):** ~145 LUTs
- **Total Registers:** ~128 Flip-Flops
- **Critical Path:** Pipeline Execute Stage (ALU combinational logic)

## Module Hierarchy
```text
cpu_top (cpu_top.v)
 ├── pc (pc.v)
 ├── instruction_memory (instruction_memory.v)
 ├── register_file (register_file.v)
 └── alu (alu.v)
```

## Verification & Simulation
The RTL design is verified via functional simulation and logic synthesis workflows. Simulation performed using **ModelSim Altera** via `cpu_tb.v`.

### Simulation Waveforms
The testbench validates core functionalities across arithmetic and logical instruction execution boundaries.

**Addition (`ADD`)**
![Addition Operation](https://github.com/user-attachments/assets/aec42bf1-ed0f-43a6-8130-9375c0dae34e)

**Subtraction (`SUB`)**
![Subtraction Operation](https://github.com/user-attachments/assets/112980ae-6d42-466d-a776-a94b8d36abf9)

**Logical AND (`AND`)**
![AND Operation](https://github.com/user-attachments/assets/31bbd2fc-e5bb-4bc3-8b90-4e181cc3c12f)

**Logical OR (`OR`)**
![OR Operation](https://github.com/user-attachments/assets/8b000266-d665-4977-98b9-7570418470f5)
