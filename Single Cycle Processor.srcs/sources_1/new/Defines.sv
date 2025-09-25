`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2025 07:34:26 PM
// Design Name: 
// Module Name: Defines
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


`ifndef DEFINES_SV
`define DEFINES_SV

typedef enum logic [3:0] {
    ALU_ADD   = 4'b0000,
    ALU_ADDI  = 4'b0001,
    ALU_SW    = 4'b0010,
    ALU_LW    = 4'b0011,
    ALU_SUB   = 4'b0100,
    ALU_AND   = 4'b0101,
    ALU_OR    = 4'b0110,
    ALU_MUL   = 4'b0111,
    ALU_SLLI  = 4'b1000,
    ALU_HALT  = 4'b1111
} ALU_OP_T;

typedef enum logic [6:0] {
    OPC_RTYPE = 7'b0110011, 
    OPC_ITYPE = 7'b0010011, 
    OPC_LW    = 7'b0000011, 
    OPC_SW    = 7'b0100011,  
    OPC_HALT  = 7'b1111111  
} OPCODE_T;

`endif