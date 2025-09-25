`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2025 07:20:16 PM
// Design Name: 
// Module Name: ALU
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
`include "Defines.sv"

module ALU(
    input logic [31:0] a,
    input logic [31:0] b,
    input ALU_OP_T alu_opcode,
    output logic [31:0] result
    );
    
    always_comb begin
        result = 32'd0;
        
        unique case (alu_opcode)
            ALU_ADD:   result = a + b;
            ALU_ADDI:  result = a + b;      // same hardware as ADD, immediate comes from decode
            ALU_SUB:   result = a - b;
            ALU_AND:   result = a & b;
            ALU_OR:    result = a | b;
            ALU_MUL:   result = a * b;
            ALU_SLLI:  result = a << b[4:0]; // shift by lower 5 bits only (RISC-V spec)
            ALU_SW:    result = a + b;       // effective address calculation
            ALU_LW:    result = a + b;       // effective address calculation
            ALU_HALT:  result = 32'd0;       // could trigger halt elsewhere
            default:   result = 32'd0;
        endcase
    end
endmodule
