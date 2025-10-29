`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 01:26:20 PM
// Design Name: 
// Module Name: control_unit
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

module control_unit(
	input logic [6:0] instr,
	output logic [1:0] aluop,
	output logic	Branch,
	output logic  MemRead,
	output logic  MemtoReg,
	output logic  MemWrite,
	output logic  ALUSrc,
	output logic  RegWrite,
	output logic  Jump
	//output reg  halt
);

    always_comb begin
        Branch = 0;
        MemRead = 0;
        MemtoReg = 0;
        MemWrite = 0;
        ALUSrc = 0;
        RegWrite = 0;
        Jump = 0;
        aluop = ALU_OP_ADD;
        
        case(instr)
            OPC_RTYPE: begin
                RegWrite = 1;
                aluop = ALU_OP_R_FUNC_2;
            end
            
            OPC_ITYPE: begin
                ALUSrc = 1;
                RegWrite = 1;
                aluop = ALU_OP_I_FUNC_3;
            end
            
            OPC_LTYPE: begin
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead = 1;
                aluop = ALU_OP_ADD;
            end
            
            OPC_STYPE: begin
                ALUSrc = 1;
                MemWrite = 1;
                aluop = ALU_OP_ADD;
            end
            
            OPC_BTYPE: begin
                Branch = 1;
                aluop = ALU_OP_SUB;
            end
            
            OPC_JAL: begin
                RegWrite = 1;
                Jump = 1;
                aluop = ALU_OP_ADD;
            end
            
            default: begin
                Branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
                Jump = 0;
                aluop = ALU_OP_ADD;
            end
        endcase
    end
endmodule
