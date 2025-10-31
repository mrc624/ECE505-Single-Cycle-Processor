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

    logic [2:0] funct3;
    logic funct7;

    assign funct3 = instr_split[2:0];
    assign funct7 = instr_split[4];

    always_comb begin
        if (aluop == ALU_OP_LOAD_STORE) begin
            aluopcode = ALU_ADD;
        end
        else if (aluop == ALU_OP_BRANCH) begin
            aluopcode = ALU_SUB;
        end
        else if (aluop == ALU_OP_R) begin
            case (funct3)
                3'b000: aluopcode = funct7 ? ALU_SUB : ALU_ADD;
                3'b010: aluopcode = ALU_ADD;
                3'b110: aluopcode = ALU_OR;
                3'b111: aluopcode = ALU_AND;
                default: aluopcode = ALU_ADD;
            endcase
        end
        else begin
            aluopcode = ALU_ADD;
        end
    end
endmodule
