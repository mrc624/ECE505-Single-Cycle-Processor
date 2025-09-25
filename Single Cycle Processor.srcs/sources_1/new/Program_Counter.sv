`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 03:47:03 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input logic clk,
    input logic reset,
    input logic enable,
    input logic [31:0] next,
    output logic [31:0] pc
    );
    
    always_ff @(posedge clk) begin
        if (reset) begin
            pc <= 32'd0;
        end else if (enable) begin
            pc <= next;
        end
    end    
endmodule
