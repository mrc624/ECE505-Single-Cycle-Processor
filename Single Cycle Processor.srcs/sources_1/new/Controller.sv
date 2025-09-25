`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 03:52:10 PM
// Design Name: 
// Module Name: Controller
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

module Controller(
    input OPCODE_T opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output ALU_OP_T alu_opcode,
    output logic reg_write,
    output logic mem_write,
    output logic mem_read
    );
    
    always_comb begin
        alu_opcode = ALU_HALT;
        reg_write = 0;
        mem_write = 0;
        mem_read = 0;
        
        unique case (opcode)
            OPC_RTYPE: begin
                reg_write = 1;
                case (funct3)
                    3'b000: alu_opcode = (funct7 == 7'b0000000) ? ALU_ADD :
                                         (funct7 == 7'b0100000) ? ALU_SUB :
                                         (funct7 == 7'b0000001) ? ALU_MUL : ALU_HALT;
                    3'b111: alu_opcode = ALU_AND;
                    3'b110: alu_opcode = ALU_OR;
                    default: alu_opcode = ALU_HALT;
                endcase
            end

            OPC_ITYPE: begin
                reg_write = 1;
                case (funct3)
                    3'b000: alu_opcode = ALU_ADDI; 
                    3'b001: alu_opcode = ALU_SLLI;
                    default: alu_opcode = ALU_HALT;
                endcase
            end

            OPC_LW: begin
                alu_opcode = ALU_LW;  
                reg_write  = 1;   
                mem_read   = 1;
            end

            OPC_SW: begin
                alu_opcode = ALU_SW; 
                mem_write  = 1;    
            end

            OPC_HALT: begin
                alu_opcode = ALU_HALT;
            end

            default: begin
                alu_opcode = ALU_HALT;
            end
        endcase
    end
endmodule
