`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:47 11/07/2021 
// Design Name: 
// Module Name:    decode 
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
module decode(clock,instruction,opcode,data1,data2,signex,rt,rd);
	input clock;
	wire writReg=0;
	wire [31:0]writeData=0;
	input[31:0]instruction;
	output [5:0]opcode;
	output [31:0]data1;
	output [31:0]data2;
	output [31:0]signex;
	output [4:0]rt;
	output [4:0]rd;
			
		regfile regFile (
		.clock(clock), 
		.regwrite(regwrite), 
		.readReg1(instruction[25:21]), 
		.readReg2(instruction[20:16]), 
		.writeReg(writeReg), 
		.writeData(instruction[15:11]),
		.data1(data1),
		.data2(data2)
	);
		signEx signextention (
		.address16(instruction[15:0]), 
		.address32(signex)
	);
	
	assign opcode = instruction[31:26];
	assign rt = instruction[20:16];
	assign rd = instruction[15:11];

endmodule
