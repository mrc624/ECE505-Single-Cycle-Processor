`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 03:18:16 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input logic clk,
    input logic write,
    input logic [4:0] raddr1,
    input logic [4:0] raddr2,
    input logic [4:0] waddr,
    input logic [31:0] wdata,
    input logic [31:0] rdata1,
    input logic [31:0] rdata2
    );
    
    logic [31:0] regs [0:31];
    
    assign rdata1 = (raddr1 == 5'd0) ? 32'd0 : regs[raddr1];
    assign rdata2 = (raddr2 == 5'd0) ? 32'd0 : regs[raddr2];
    
    always_ff @ (posedge clk) begin
        if (wen && waddr != 5'd0) begin
            regs[waddr] <= wdata;
        end   
    end
endmodule
