/*
Author: Nishaanth Sai Vinodh Kumar
Project: 8-Bit ALU
Language: Verilog HDL
*/


module ALU (
    input [7:0] a,      // First 8-bit operand
    input [7:0] b,      // Second 8-bit operand
    input [3:0] sel,    // Operation select signal
    output reg [7:0] out // ALU output
);

// 8-Bit Arithmetic Logic Unit (ALU)
// ---------------------------------
// Operation Codes:
//
// 0001 : Addition       (a + b)
// 0010 : Subtraction    (a - b)
// 0011 : Bitwise AND    (a & b)
// 0100 : Bitwise OR     (a | b)
// 0101 : Bitwise XOR    (a ^ b)
// 0111 : Bitwise NOT A  (~a)
// 1000 : Bitwise NOT B  (~b)
// 1001 : Shift Right    (a >> b)
// 1011 : Shift Left     (a << b)
// 1111 : Compare        (a < b)
//
// Any undefined outputs 0.

localparam ADD = 4'b0001;
localparam SUB = 4'b0010;
localparam AND = 4'b0011;
localparam OR = 4'b0100;
localparam XOR = 4'b0101;
localparam NOT_A = 4'b0111;
localparam NOT_B = 4'b1000;
localparam SHIFT_RIGHT = 4'b1001;
localparam SHIFT_LEFT = 4'b1010;
localparam COMPARISON = 4'b1011;

always @(*) begin

    // Select operation based on sel input
    case(sel)

        ADD:         out = a + b;      // Addition

        SUB:         out = a - b;      // Subtraction

        AND:         out = a & b;      // Bitwise AND

        OR:          out = a | b;      // Bitwise OR

        XOR:         out = a ^ b;      // Bitwise XOR

        NOT_A:       out = ~a;         // Bitwise NOT of A

        NOT_B:       out = ~b;         // Bitwise NOT of B

        SHIFT_RIGHT: out = a >> b;     // Logical right shift by B positions

        SHIFT_LEFT: out = a << b;     // Logical left shift by B positions

        COMPARISON: out = a < b;      // Outputs 1 if A < B, otherwise 0

        default: out = 0;          // Default output for undefined opcodes

    endcase

end

endmodule