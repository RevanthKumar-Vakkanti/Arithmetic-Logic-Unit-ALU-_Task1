`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2025 15:52:41
// Design Name: 
// Module Name: alu
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

module alu (
    input  [7:0] A, B,      // 8-bit input operands
    input  [3:0] ALU_Sel,   // 4-bit ALU operation selector
    output reg [7:0] res,   // 8-bit result output
    output reg carry        // Carry output for addition operation
);

// Always block triggered on any change in inputs (combinational logic)
always @(*) begin
    carry = 0;  // Default carry output is set to 0
    
    case (ALU_Sel)
        4'b0000: {carry, res} = A + B;  // Addition with CarryOut
        4'b0001: res = A - B;           // Subtraction
        4'b0010: res = A & B;           // Bitwise AND operation
        4'b0011: res = A | B;           // Bitwise OR operation
        4'b0100: res = A ^ B;           // Bitwise XOR operation
        4'b0101: res = ~A;              // Bitwise NOT operation (ignores B)
        4'b0110: res = A << 1;          // Left Shift by 1 bit
        4'b0111: res = A >> 1;          // Right Shift by 1 bit
        4'b1000: res = {A[6:0], A[7]};  // Rotate Left (Circular Shift Left)
        4'b1001: res = {A[0], A[7:1]};  // Rotate Right (Circular Shift Right)
        default: res = 8'b00000000;      // Default case (result set to zero)
    endcase
end

endmodule

