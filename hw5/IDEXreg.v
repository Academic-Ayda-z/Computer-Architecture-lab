`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:58 12/09/2021 
// Design Name: 
// Module Name:    IDEXreg 
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
//hw5
//////////////////////////////////////////////////////////////////////////////////
module IDEXreg(
input clk ,input hit ,input[31:0] readData1 , input[31:0] readData2,
	input [31:0] signExImmediate,input RegDst, 
input ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite, Branch,input[2:0] ALUOp, 
input [4:0]rt,input[4:0] rd,input[5:0] funct,input[31:0] nextPC,


output reg [31:0]readData1Out,output reg[31:0] readData2Out,output reg[31:0] signExImmediateOut,
output reg RegDstOut, ALUSrcOut, MemtoRegOut, RegWriteOut, MemReadOut, MemWriteOut, 
BranchOut,output reg[2:0]ALUOpOut,output reg[4:0] rtOut,output reg[4:0] rdOut,
output reg[5:0]functOut,output reg [31:0] nextPCOut,output reg hitOut
);

always@(negedge clk)
begin 
	if(hit)begin
		readData1Out<=readData1;
		readData2Out<=readData2;
		signExImmediateOut<=signExImmediate;
		RegDstOut<=RegDst;
		ALUSrcOut<=ALUSrc;
		MemtoRegOut<=MemtoReg;
		RegWriteOut<=RegWrite;
		MemReadOut<=MemRead;
		MemWriteOut<=MemWrite;
		BranchOut<=Branch;
		ALUOpOut<=ALUOp;
		rtOut<=rt;
		rdOut<=rd;
		functOut<=funct;
		nextPCOut<=nextPC;
		hitOut<=hit;
	end
end


endmodule
