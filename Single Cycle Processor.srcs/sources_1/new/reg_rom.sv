`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 01:04:09 PM
// Design Name: 
// Module Name: reg_rom
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


module reg_rom(
    input logic [4:0] addr,
    output logic [31:0] q
    );
    
    logic [31:0] file [31:0];
    integer i;
    
    initial begin
        // program1
        file[0] = 32'h00000093; // addi x1, x0, 0
        file[1] = 32'h01000113; // addi x2, x0, 16
        file[2] = 32'h06400193; // addi x3, x0, 100
        file[3] = 32'h00800213; // addi x4, x0, 8
        file[4] = 32'h002081B3; // add x5, x1, x2
        file[5] = 32'h00418233; // add x6, x3, x4
        file[6] = 32'h00510023; // sw x5, 0(x1)
        file[7] = 32'h00611023; // sw x6, 4(x2)
        file[8] = 32'hFFFFFFFF; // HALT

        for (i = 9; i < 32; i = i + 1) begin
            file[i] = 32'b0;
        end
    
    end
    
    assign q = file[addr];
    
endmodule
