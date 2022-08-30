`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:13:21 12/22/2021 
// Design Name: 
// Module Name:    exMemReg 
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
module exMemReg(
	input clk,input hit , input [31:0]branchTarget,input zeroFlag, input[31:0] ALUResult,
	input[31:0] readData2, 
	input [4:0]writeReg,input MemRead,input MemWrite,input Branch, input RegWrite,input MemToReg,
	output reg [31:0]branchTargetOut,output reg zeroFlagOut,output reg[31:0] ALUResultOut,
	output reg[31:0] readData2Out, 
	output reg[4:0] writeRegOut,output reg MemReadOut, output reg MemWriteOut,output reg BranchOut
	,output reg RegWriteOut, output reg MemToRegOut,output reg hitOut   
	);
initial begin BranchOut = 0; end
always@(negedge clk)
begin 
	if(hit)begin
		branchTargetOut=branchTarget;
		zeroFlagOut=zeroFlag;
		ALUResultOut=ALUResult;
		readData2Out=readData2;
		writeRegOut=writeReg;
		MemReadOut=MemRead;
		MemWriteOut=MemWrite;
		BranchOut=Branch;
		MemToRegOut=MemToReg;
		hitOut=hit;
		RegWriteOut=RegWrite;
	end
end

endmodule
