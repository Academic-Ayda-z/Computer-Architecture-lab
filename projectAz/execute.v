`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:23:21 12/10/2021 
// Design Name: 
// Module Name:    execute 
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
module Execute( input clk ,input[31:0] ALUReadData1 ,
	input[31:0] ALUReadData2 ,input[31:0] immediate,input[5:0] funct, 
	input [2:0]ALUOp ,input ALUSrc ,
	output[31:0] ALUResult ,output zero
    );
	 
wire [3:0]aluC;
wire [31:0]input2Alu;

assign input2Alu=ALUSrc==1?ALUReadData2:immediate;

aluControl ALUCONTROL( .ALUOp(ALUOp) , .funct(funct) , .aluCnt(aluC) 
	);

Alu ALU( .ALUCnt(aluC), .input1(ALUReadData1) , .input2(input2Alu),.input3(ALUReadData2) , .shamt(immediate[10:6]),
	.result(ALUResult), .zero(zero)
	);


endmodule
