`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:37:02 11/29/2021 
// Design Name: 
// Module Name:    IfIDReg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IfIDReg(input clk, input [31:0] next_pc , input [31:0]instruction, input hit
	,output reg[31:0]instruction_out, output reg[31:0]next_pc_out ,output reg hit_out
    );
initial 
	begin 
		instruction_out = 0;
	end

always@(negedge clk)
	begin
		hit_out<=hit;
		instruction_out <= instruction;
		next_pc_out <= next_pc;
	end
endmodule
