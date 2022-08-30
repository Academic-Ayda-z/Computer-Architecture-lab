`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:22:16 11/29/2021 
// Design Name: 
// Module Name:    Mips 
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
module Mips(input clk
    );
	 wire hit;
	 wire hitOut;
	 wire[31:0]pc;
	 wire[31:0]nextPc;
	 wire[31:0]pcOut;
	 wire pcS;
	 wire branchT;
	 wire [31:0]instruction;
	 wire [31:0]instructionOut;
	 wire [5:0]opCode;
	 wire aluS;
	 wire memtoReg;
	 wire regDest;
	 wire regWrite;
	 wire memWrite;
	 wire [2:0]aluOp;
	 wire branch;
	 wire mamrRead;
	 wire [31:0]data1;
	 wire[31:0]data2;
	 wire[31:0]signex;
	 wire[4:0]rt;
	 wire[4:0]rd;

	 fetch Fetch(.clock(clk),.branchT(branchT),.pcS(pcS),
		.pc(pc),.instruction(instruction),.hit(hit) );
	
	IfIDReg IfId(.clk(clk), .next_pc(nextPc) , .instruction(instruction), .hit(hit)
		,instruction_out(instructionOut),next_pc_out(pcOut) ,.hit_out(hitOut));

	controlUnit ControlUNIT(.opCode(opCode), .regDst(regDest), .aluSrc(aluS) , .memtoReg(memtoReg),
	 .regWrite(regWrite) , .memRead(memRead) , .memWrite(memWrite) , 
	.branch(branch) , .aluOp(aluOp) );

	decode Decode(.clock(clk),.instruction(instruction),.opcode(opCode),
	 .data1(data1),.data2(data2),.signex(signex),.rt(rt),.rd(rd));