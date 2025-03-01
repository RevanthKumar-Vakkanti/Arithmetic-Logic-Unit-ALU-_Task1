`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2025 15:54:34
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module alu_tb();

    // Declare testbench signals
    reg [7:0] A, B;          // 8-bit input operands
    reg [3:0] ALU_Sel;       // 4-bit control signal to select ALU operation
    wire [7:0] res;          // 8-bit output result from ALU
    wire carry;              // Carry output for addition

    // Instantiate the ALU module (Device Under Test)
    alu dut(A, B, ALU_Sel, res, carry);

    // Testbench execution block
    initial begin
        // Monitor changes and display output values
        $monitor("Time=%0t | A=%d, B=%d, ALU_Sel=%b, Result=%d, Carry=%b", $time, A, B, ALU_Sel, res, carry);

        // Test ADDITION
        A = 8'd25; B = 8'd17; ALU_Sel = 4'b0000; #10;
        
        // Test ADDITION WITH CARRY (checking overflow case)
        A = 8'd240; B = 8'd31; ALU_Sel = 4'b0000; #10;
        
        // Test SUBTRACTION
        A = 8'd50; B = 8'd30; ALU_Sel = 4'b0001; #10;
        
        // Test BITWISE AND operation
        A = 8'b10101010; B = 8'b11001100; ALU_Sel = 4'b0010; #10;
        
        // Test BITWISE OR operation
        A = 8'b10101010; B = 8'b11001100; ALU_Sel = 4'b0011; #10;
        
        // Test BITWISE XOR operation
        A = 8'b11110000; B = 8'b00001111; ALU_Sel = 4'b0100; #10;
        
        // Test BITWISE NOT operation (ignores B)
        A = 8'b11010101; B = 8'b00000000; ALU_Sel = 4'b0101; #10;
        
        // Test LEFT SHIFT by 1 bit
        A = 8'b00001111; B = 8'b00000000; ALU_Sel = 4'b0110; #10;
        
        // Test RIGHT SHIFT by 1 bit
        A = 8'b11110000; B = 8'b00000000; ALU_Sel = 4'b0111; #10;
        
        // Test ROTATE LEFT (Circular Shift Left)
        A = 8'b10000001; B = 8'b00000000; ALU_Sel = 4'b1000; #10;
        
        // Test ROTATE RIGHT (Circular Shift Right)
        A = 8'b10000001; B = 8'b00000000; ALU_Sel = 4'b1001; #10;
        
        // Terminate simulation
        $finish;
    end
endmodule
