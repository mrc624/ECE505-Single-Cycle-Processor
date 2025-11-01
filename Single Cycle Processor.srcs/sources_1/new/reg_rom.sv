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
        for (i = 0; i < 32; i = i + 1) begin // update the beginning position of i when switching programs
            file[i] = 32'b0;
        end
    
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
        /*file[0] = 32'h00800293;
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
        file[11] = 32'hFFFFFFFF;*/
        
        if (addr == 3) begin
            $display("HALT ADDRESS REACHED");
        end
        
        // program 3
        file[0] = 32'h00c00513;
        file[1] = 32'h00c000ef;
        file[2] = 32'h00a02023;
        file[3] = 32'hffffffff;
        file[4] = 32'hff810113;
        file[5] = 32'h00112223;
        file[6] = 32'h00a12023;
        file[7] = 32'hfff50513;
        file[8] = 32'h00051863;
        file[9] = 32'h00100513;
        file[10] = 32'h00810113;
        file[11] = 32'h00008067;
        file[12] = 32'hfe1ff0ef;
        file[13] = 32'h00050293;
        file[14] = 32'h00012503;
        file[15] = 32'h00412083;
        file[16] = 32'h00810113;
        file[17] = 32'h02550533;
        file[18] = 32'h00008067;
        file[19] = 32'hFFFFFFFF;
    
    end
    
    assign q = file[addr];
    
endmodule
