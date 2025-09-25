`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 02:49:29 PM
// Design Name: 
// Module Name: Data_Memory
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

module Data_Memory
# (parameter WORDS = 256 )
(
    input logic clk,
    input logic mem_write,
    input logic mem_read,
    input logic [31:0] address,
    input logic [31:0] write_data,
    input logic [31:0] read_data
    );
    
    logic [31:0] memory [0: MEM_WORDS - 1];
    
    // write
    always_ff @ (posedge clk) begin
        if (mem_write) begin
            mem[addr >> 2] <= write_data;
        end
    end
    
    always_comb begin
        if (mem_read) begin
            read_data = mem[addr >> 2];
        end else begin
            read_data = 32'd0;
        end
    end
endmodule
