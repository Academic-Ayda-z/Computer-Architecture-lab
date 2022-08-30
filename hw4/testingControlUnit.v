`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:50:32 11/29/2021
// Design Name:   controUnit
// Module Name:   C:/Xilinx/hw1/testingControlUnit.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testingControlUnit;

	// Inputs
	reg [5:0] opCode;

	// Outputs
	wire regDst;
	wire aluSrc;
	wire memtoReg;
	wire regWrite;
	wire memRead;
	wire memWrite;
	wire branch;
	wire [2:0] aluOp;

	// Instantiate the Unit Under Test (UUT)
	controlUnit uut (
		.opCode(opCode), 
		.regDst(regDst), 
		.aluSrc(aluSrc), 
		.memtoReg(memtoReg), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.aluOp(aluOp)
	);

	initial begin
		// Initialize Inputs
		opCode = 6'b000000;
		#100;
		opCode=6'b000110;
		#100;
       opCode=000110;
		#100;

	end
      
endmodule

