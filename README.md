# 8-Bit ALU in Verilog

## Overview

This project implements an 8-bit Arithmetic Logic Unit (ALU) in Verilog and verifies its functionality using a custom testbench and Surfer simulation.

## Features

Supported operations:

| Opcode | Operation |
|----------|----------|
| 0001 | Addition |
| 0010 | Subtraction |
| 0011 | AND |
| 0100 | OR |
| 0101 | XOR |
| 0111 | NOT A |
| 1000 | NOT B |
| 1001 | Shift Right |
| 1010 | Shift Left |
| 1011 | Compare (A < B) |

## Tools Used

- Visual Studio Code
- Extension:	
	- Verilog-HDL/SystemVerilog  
	- surfer

## Simulation Results

Waveform verification:

![Waveform](docs/waveform.png)

## How to Run

1. Open the project in VS Code.
2. Install the **Verilog-HDL/SystemVerilog** extension (for syntax highlighting, linting, and simulation) and the **Surfer** extension (for waveform viewing).
3. Open `src/alu.v` and `tb/alu_tb.v` in the editor.
4. Run the testbench using the Verilog-HDL/SystemVerilog extension — this compiles and simulates the design, generating a waveform dump.
5. Open the generated waveform file with the Surfer extension inside VS Code to inspect signal transitions and verify correct ALU behavior.

> **Note:** Opcodes `0110` and `1100`–`1111` are currently unassigned and reserved for future operations (see Future Improvements).

## Future Improvements

- Carry Flag
- Zero Flag
- Overflow Flag
- Negative Flag

## Author

Nishaanth Sai Vinodh Kumar
