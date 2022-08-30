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
	 wire [31:0]branchT;
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
	 
	 wire [4:0]writeReg;//[31:0]
	 wire [31:0]branchTargetOut;
	 wire[31:0]signExImmediateOutIDEX;
	 
	wire [31:0]nextPCOutIDEX;
	wire [5:0]functOutIDEX;
	wire [4:0]rdOutIDEX;
	wire [4:0]rtOutIDEX;
	wire [2:0]ALUOpOutIDEX;
	wire BranchOutIDEX;
	wire MemWriteOutIDEX;
	wire MemReadOutIDEX;
	wire RegWriteOutIDEX;
	wire MemtoRegOutIDEX;
	wire ALUSrcOutIDEX;
	wire regDestOutIDEX;
	wire[31:0] data1OutIDEX;
	wire[31:0] data2OutIDEX;
	
	wire zero;
	wire[31:0] ALUResultExc;

	wire MemToRegOutEXMEM;
	wire RegWriteOutEXMEM;
	wire BranchOutEXMEM;
	wire MemWriteOutEXMEM;
	wire MemReadOutEXMEM;
	wire [4:0] writeRegOutEXMEM;
	wire [31:0] readData2OutEXMEM;
	wire [31:0]ALUResultOutEXMEM;
	wire zeroFlagOutEXMEM;
	wire [31:0]readDataM;
	
	 wire [31:0]ALUResultOutMemWB;
	 wire [31:0]readDataOutMemWB;
	 wire [4:0]writeRegOutMemWB; 
	 wire RegWriteOutMemWB;
	 wire MemtoRegOutMemWB;

	wire [31:0] writeData;
	wire BranchOutEXEM;
	
	//wire [31:0] target;
	
	wire [31:0] pcOrJump;
	wire [31:0] nextPcIFID;
	wire jumpOutIDEX;
	wire jumpOutEXEM;
	
	 fetch Fetch(
		.clock(clk),
		.branchT(branchTargetOut),
		.pcS(pcSrc),
		.pc(pcOut),
		.instruction(instruction),
		.hit(hit) 
//		.target(target)
		//.instru(instructionOut)
		);
		
	IfIDReg IF(
		.clk(clk), 
		.next_pc(pcOut), 
		.instruction(instruction),
		.hit(hit),
		.instruction_out(instructionOut),
		.next_pc_out(nextPc) ,
		.hit_out()
		);
			
			
	controlUnit ControlUNIT(
	 .opCode(opCode),
	 .regDst(regDest), 
	 .aluSrc(aluS) , 
	 .memtoReg(memtoReg),
	 .regWrite(regWrite) ,
	 .memRead(memRead) , 
	 .memWrite(memWrite), 
	 .branch(branch) , 
	 .aluOp(aluOp), 
	 .jump(jump)//d
	);

	decode Decode(
	 .clock(clk),
	 .writeReg(writeRegOutMemWB),
	 .regwrite(RegWriteOutMemWB),
	 .writeData(writeData),
	 .instruction(instruction),
	 .opcode(opCode),
	 .data1(data1),
	 .data2(data2),
	 .signex(signex),
	 .rt(rt),
	 .rd(rd)
	 );
	 
	 IDEXreg IDEX(
		.clk(clk) ,
		.hit(hit) ,
		.readData1(data1) , 
		.readData2(data2),
		.signExImmediate(signex),
		.RegDst(regDest), 
		.ALUSrc(aluS) ,
		.MemtoReg(memtoReg) , 
		.RegWrite(regWrite) ,
		.MemRead(memRead) , 
		.MemWrite(memWrite),
		.Branch(branch) ,
		.ALUOp(aluOp), 
		.jump(jump),//d
		.rt(rt), 
		.rd(rd),
		.funct(signex[5:0]),
		.nextPC(nextPc),
		.readData1Out(data1OutIDEX),
		.readData2Out(data2OutIDEX),
		.signExImmediateOut(signExImmediateOutIDEX),
		.RegDstOut(regDestOutIDEX), 
		.ALUSrcOut(ALUSrcOutIDEX),
		.MemtoRegOut(MemtoRegOutIDEX),
		.RegWriteOut(RegWriteOutIDEX),
		.MemReadOut(MemReadOutIDEX),
		.MemWriteOut(MemWriteOutIDEX), 
      .BranchOut(BranchOutIDEX),
		.ALUOpOut(ALUOpOutIDEX), 
		.rtOut(rtOutIDEX),
		.rdOut(rdOutIDEX),
		.functOut(functOutIDEX),
		.nextPCOut(nextPCOutIDEX),
		.jumpOut(jumpOutIDEX),//d
		.hitOut()
	);
	
	Execute exc( 
		.clk(clk) , 
		.ALUReadData1(data1OutIDEX) ,
		.ALUReadData2(data2OutIDEX) ,
		.immediate(signExImmediateOutIDEX) ,
		.funct(functOutIDEX) , 
		.ALUOp(ALUOpOutIDEX) , 
		.ALUSrc(ALUSrcOutIDEX) ,
		.ALUResult(ALUResultExc) ,
		.zero(zero)
    );
	 
	 assign branchT=nextPCOutIDEX+(signExImmediateOutIDEX<<2);///
	 assign writeReg=(regDestOutIDEX==1)?rd:rt;
	 assign rt=(jumpOutIDEX==1'b1)?{5'b11111}:rt;
    assign pcSrc = zeroFlagOutEXMEM & BranchOutEXEM;
	
exMemReg exmemR(
	.clk(clk),
	.hit(hit) , 
	.branchTarget(branchT), 
	.zeroFlag(zero),
	.ALUResult(ALUResultExc), 
	.readData2(data2OutIDEX), 
	.writeReg(writeReg),
	.MemRead(MemReadOutIDEX),
	.MemWrite(MemWriteOutIDEX),
	.Branch(BranchOutIDEX),
	.RegWrite(RegWriteOutIDEX), 
	.MemToReg(MemtoRegOutIDEX),
	.jump(jumpOutIDEX),//d
	.jumpOut(jumpOutEXEM),//d
	.branchTargetOut(branchTargetOut),
	.zeroFlagOut(zeroFlagOutEXMEM), 
	.ALUResultOut(ALUResultOutEXMEM),
	.readData2Out(readData2OutEXMEM), 
	.writeRegOut(writeRegOutEXMEM),
	.MemReadOut(MemReadOutEXMEM), 
	.MemWriteOut(MemWriteOutEXMEM), 
	.BranchOut(BranchOutEXEM), 
	.RegWriteOut(RegWriteOutEXMEM), 
	.MemToRegOut(MemToRegOutEXMEM), 
	.hitOut()   
	);
//	assign target=instructionOut[25:0]<<2+nextPc;//jump
		
	dataMemory datamem(
		.clk(clk),
		.address(ALUResultOutEXMEM), 
		.writeData(readData2OutEXMEM),
		.MemRead(MemReadOutEXMEM), 
		.MemWrite(MemWriteOutEXMEM),
		.readData(readDataM) 		
	);
	
	MemWbReg wbReg( 
		.clk(clk),
		.hit(hit), 
		.readData(readDataM),
		.ALUResult(ALUResultOutEXMEM),
		.writeReg(writeRegOutEXMEM), 
		.RegWrite(RegWriteOutEXMEM),
		.MemtoReg(MemToRegOutEXMEM),
		.hitOut(), 
		.readDataOut(readDataOutMemWB), 
		.ALUResultOut(ALUResultOutMemWB),
		.writeRegOut(writeRegOutMemWB),
		.RegWriteOut(RegWriteOutMemWB),
		.MemtoRegOut(MemtoRegOutMemWB)
	 );

	writeBack wb(
	.MemtoReg(MemtoRegOutMemWB),
	.readData(readDataOutMemWB),
	.ALUResult(ALUResultOutMemWB),
	.writeData(writeData)
    );
	 
	endmodule
