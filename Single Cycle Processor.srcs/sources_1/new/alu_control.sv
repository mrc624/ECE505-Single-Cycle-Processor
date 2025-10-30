`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 04:24:21 PM
// Design Name: 
// Module Name: alu_control
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

module alu_control(
	input logic [4:0] instr_split,	// {instr[30],instr[25], instr[14:12] (funct3)}
	input logic [1:0] aluop,
	output logic [4:0] aluopcode
);
    assign aluopcode = (aluop == ALU_OP_ADD) ? ALU_ADD :
                       (aluop == ALU_OP_SUB) ? ALU_SUB :
                       (instr_split == ALU_ADD) ? ALU_ADD :
                       (instr_split == ALU_SUB) ? ALU_SUB :
                       (instr_split == ALU_AND) ? ALU_AND :
                       (instr_split == ALU_OR) ? ALU_OR:
                       (instr_split == ALU_SHIFT) ? ALU_SHIFT:
                       ALU_ADD;
endmodule
