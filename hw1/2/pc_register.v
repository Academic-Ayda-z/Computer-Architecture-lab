`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:36:24 10/11/2021 
// Design Name: 
// Module Name:    pc_register 
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
module pc_register(clk,nextPc,Pc);
	input clk;
	input [31:0] nextPc;
	output  [31:0] Pc;
	reg [31:0] pcReg;
	initial begin
		pcReg<=0;
	end

	always @(posedge clk)
	begin
	pcReg=nextPc;
	//$display("PC=%h",Pc);
	end	 
	assign Pc=pcReg;
endmodule
