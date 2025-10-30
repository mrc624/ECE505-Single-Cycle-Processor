`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 01:21:03 PM
// Design Name: 
// Module Name: lab505
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

module lab505(
    input CLOCK_20
    );
    
    logic [10:0] PC;
    logic [10:0] PC_next;
    logic [10:0] PC_plus;
    logic [10:0] PC_offset;
    logic to_branch;
    
    logic [31:0] A;
    logic [31:0] B;
    logic [31:0] Y;
    logic [1:0] Y;
    logic [1:0] aluop;
    logic [4:0] aluopcode;
    logic zero;
    
    logic[31:0] instr;
    logic [6:0] opcode;
    logic [4:0] rd, rs1, rs2;
    logic [2:0] func3;
    logic [6:0] funct7;
    logic [31:0] imm;
    logic ALUSrc;
    logic Branch;
    logic MemRead;
    logic MemtoReg;
    logic MemWrite;
    logic Jump;
    
    assign opcode = instr[6:0];
    assign rd = instr[11:7];
    assign funct3 = instr[14:12];
    assign rs1 = instr[19:15];
    assign rs2 = instr[24:20];
    assign funct7 = instr[31:25];
    
    initial 
        PC = -4;
        
        assign run = instr[6:0] == OPC_HALT ? 1'b0: 1'b1;
    // PC
    always_ff @ (posedge CLOCK_20) begin
        if (run) begin
            PC = PC + 4;
        end
    end
    
    assign PC_plus = PC + 4;
    assign PC_offset = PC + imm[10:0];
    assign PC_next = to_branch ? PC_offset : PC_plus;
    assign to_branch = (Branch & ~zero) | Jump;
    
    // ALU
    assign A = rd1;
    assign B = (ALUSrc) ? imm : rd2;
    
    ALU a1 (
        .Y(Y),
        .zero(zero),
        .A(A),
        .B(B),
        .opcode(aluopcode)
   );

   //Controller
   control_unit a2 (
        .instr(opcode),
        .aluop(aluop),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .Jump(Jump)
    );

   //ALU Controller
   alu_control a3 (
        .instr_split( {instr[30], instr[25], funct3} ),
        .aluop(aluop),
        .aluopcode(aluopcode)
   );
   
   // Register File
    assign wd = (MemtoReg) ? mem_data : Y;
    
    reg_rom a4 (
        .addr(PC),
        .q(instr)
    );
    
   // Immediate Generator
   
   //RAM
   
   //Register ROM
   
   //MCM
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
