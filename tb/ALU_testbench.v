/*
Author: Nishaanth Sai Vinodh Kumar
Project: 8-Bit ALU
Language: Verilog HDL
*/

`timescale 1ns/1ps

module ALU_tb;

    // Testbench inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] op;

    // DUT output
    wire [7:0] out;

    // Instantiate Device Under Test (DUT)
    ALU dut (
        .a(a),
        .b(b),
        .sel(op),
        .out(out)
    );

    initial begin

        // Display signal values whenever they change
        $monitor($time,
                 " A = %b , B = %b, Sel =%b, out= %b",
                 a,b,op,out);

        // Create waveform dump file for GTKWave
        $dumpfile("result.vcd");

        // Dump all signals in the testbench hierarchy
        $dumpvars(0, ALU_tb);

        #5;

        // ==========================
        // ADDITION TESTS
        // ==========================

        a = 8'b00000011; b = 8'b00000010; op = 4'b0001; #5; // 3 + 2 = 5
        a = 8'b00001111; b = 8'b00000001; op = 4'b0001; #5; // 15 + 1 = 16

        // ==========================
        // SUBTRACTION TESTS
        // ==========================

        a = 8'b00000110; b = 8'b00000011; op = 4'b0010; #5; // 6 - 3 = 3
        a = 8'b00000010; b = 8'b00000100; op = 4'b0010; #5; // 2 - 4 = 254

        // ==========================
        // BITWISE AND TEST
        // ==========================

        a = 8'b11001100; b = 8'b10101010; op = 4'b0011; #5;

        // ==========================
        // BITWISE OR TEST
        // ==========================

        a = 8'b11001100; b = 8'b10101010; op = 4'b0100; #5;

        // ==========================
        // BITWISE XOR TEST
        // ==========================

        a = 8'b11001100; b = 8'b10101010; op = 4'b0101; #5;

        // ==========================
        // NOT A TEST
        // ==========================

        a = 8'b10101010; b = 8'b00000000; op = 4'b0111; #5;

        // ==========================
        // NOT B TEST
        // ==========================

        a = 8'b00000000; b = 8'b11001100; op = 4'b1000; #5;

        // ==========================
        // SHIFT RIGHT TESTS
        // ==========================

        a = 8'b10000000; b = 8'b00000001; op = 4'b1001; #5; // 128 >> 1
        a = 8'b10000000; b = 8'b00000100; op = 4'b1001; #5; // 128 >> 4

        // ==========================
        // SHIFT LEFT TESTS
        // ==========================

        a = 8'b00000001; b = 8'b00000010; op = 4'b1011; #5; // 1 << 2
        a = 8'b10000000; b = 8'b00000001; op = 4'b1011; #5; 

        // ==========================
        // COMPARISON TESTS
        // ==========================

        a = 8'b00000011; b = 8'b00000101; op = 4'b1111; #5; // True
        a = 8'b00001000; b = 8'b00000010; op = 4'b1111; #5; // False
        a = 8'b00000100; b = 8'b00000100; op = 4'b1111; #5; // Equal

        // End simulation
        #10;
        $finish;

    end

endmodule