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
    
    logic [10:0] PC = -4;
    logic [4:0] PC_word_aligned;
    logic [10:0] PC_next;
    logic [10:0] PC_plus;
    logic [10:0] PC_offset;
    logic to_branch;
    
    logic [31:0] A;
    logic [31:0] B;
    logic [31:0] Y;
    logic [1:0] aluop;
    logic [4:0] aluopcode;
    logic zero;
    
    logic[31:0] instr;
    logic [6:0] opcode;
    logic [4:0] rd, rs1, rs2;
    logic [6:0] funct7;
    logic [31:0] imm;
    logic ALUSrc;
    logic Branch;
    logic MemRead;
    logic MemtoReg;
    logic MemWrite;
    logic RegWrite;
    logic Jump;
    logic [31:0] rd1, rd2;
    logic clk_main;
    logic clk_secondary;
    logic locked = 1;
    logic run;
    logic [31:0] mem_data;
    logic [31:0] wd;
    logic [4:0] ALU_instr_split;
    logic take_branch;
    logic [2:0] funct3;
    
    assign opcode = instr[6:0];
    assign rd = instr[11:7];
    assign funct3 = instr[14:12];
    assign rs1 = instr[19:15];
    assign ALU_instr_split = {instr[30], instr[25], funct3};
    
    assign rs2 = instr[24:20];
    assign funct7 = instr[31:25];
 
    assign run = opcode == OPC_HALT ? 1'b0: 1'b1;
 
    assign clk_main = CLOCK_20;
 
    // PC
    always_ff @ (posedge clk_main) begin
        if (run) begin
            PC <= PC_next;
        end
    end
    
    assign PC_plus = PC + 4;
    assign PC_offset = opcode == OPC_JALR ? rd1 + $signed(imm[10:0]): PC + $signed(imm[10:0]);
    assign take_branch = (funct3 == BTYPE_FUNCT3_BEQ) ? zero :
                         (funct3 == BTYPE_FUNCT3_BNE) ? ~zero :
                         1'b0;
    assign to_branch = (Branch & take_branch) | Jump;
    assign PC_next = to_branch ? PC_offset : PC_plus;
    assign PC_word_aligned = PC >> 2;
    
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
        .instr_split(ALU_instr_split),
        .aluop(aluop),
        .aluopcode(aluopcode)
   );
   
   // Register File
    assign wd = (Jump) ? PC_plus: 
                (MemtoReg) ? mem_data :
                Y;
    
    reg_file a4 ( 
        .clk(clk_main),
        .write(RegWrite),
        .rr1(rs1),
        .rr2(rs2),
        .wr(rd),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );
    
   // Immediate Generator
   imm_gen a5 (
        .instr(instr),
        .imm_out(imm)
   );
   
   //RAM
   ram a6 (
        .clka(clk_main),
        .wea(MemWrite),
        .addra(Y),
        .dina(rd2),
        .douta(mem_data)
   );
   
   //Register ROM
    reg_rom a7 (
        .addr(PC_word_aligned),
        .q(instr)
    );
    
   //MCM
   
   // uncomment when not simulating
   /*clk_wiz_0 a8 (
    .clk_in1(CLOCK_20),   // input clock
    .clk_out1(clk_main),       // main processor clock
    .clk_out2(clk_secondary),       // optional second-phase clock
    .locked(locked)        // locked signal
    );*/

endmodule
