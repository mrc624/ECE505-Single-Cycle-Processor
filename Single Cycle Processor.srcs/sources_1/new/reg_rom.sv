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
        /*file[0] = 32'h00000093;
        file[1] = 32'h01000113;
        file[2] = 32'h06400193;
        file[3] = 32'h00800213;
        file[4] = 32'h002082b3;
        file[5] = 32'h00418333;
        file[6] = 32'h0050a023;
        file[7] = 32'h00612223;
        file[8] = 32'hFFFFFFFF;*/
        
        // program2
        file[0] = 32'h00800293;
        file[1] = 32'h00f00313;
        file[2] = 32'h0062a023;
        file[3] = 32'h005303b3;
        file[4] = 32'h40530e33;
        file[5] = 32'h03c384b3;
        file[6] = 32'h00428293;
        file[7] = 32'hffc2a903;
        file[8] = 32'h41248933;
        file[9] = 32'h00291913;
        file[10] = 32'h0122a023;
        file[11] = 32'hFFFFFFFF;

        for (i = 9; i < 32; i = i + 1) begin
            file[i] = 32'b0;
        end
    
    end
    
    assign q = file[addr];
    
endmodule
