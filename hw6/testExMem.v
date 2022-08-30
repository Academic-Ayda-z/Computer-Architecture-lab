`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:23:02 12/22/2021
// Design Name:   exMemReg
// Module Name:   C:/Xilinx/hw1/testExMem.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: exMemReg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testExMem;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] branchTarget;
	reg zeroFlag;
	reg [31:0] ALUResult;
	reg [31:0] readData2;
	reg [4:0] writeReg;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg RegWrite;
	reg MemToReg;

	// Outputs
	wire [31:0] branchTargetOut;
	wire zeroFlagOut;
	wire [31:0] ALUResultOut;
	wire [31:0] readData2Out;
	wire [4:0] writeRegOut;
	wire MemReadOut;
	wire MemWriteOut;
	wire BranchOut;
	wire RegWriteOut;
	wire MemToRegOut;
	wire hitOut;

	// Instantiate the Unit Under Test (UUT)
	exMemReg uut (
		.clk(clk), 
		.hit(hit), 
		.branchTarget(branchTarget), 
		.zeroFlag(zeroFlag), 
		.ALUResult(ALUResult), 
		.readData2(readData2), 
		.writeReg(writeReg), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.branchTargetOut(branchTargetOut), 
		.zeroFlagOut(zeroFlagOut), 
		.ALUResultOut(ALUResultOut), 
		.readData2Out(readData2Out), 
		.writeRegOut(writeRegOut), 
		.MemReadOut(MemReadOut), 
		.MemWriteOut(MemWriteOut), 
		.BranchOut(BranchOut), 
		.RegWriteOut(RegWriteOut), 
		.MemToRegOut(MemToRegOut), 
		.hitOut(hitOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		hit = 0;
		branchTarget = 2;
		zeroFlag = 0;
		ALUResult = 12;
		readData2 = 23;
		writeReg = 0;
		MemRead = 0;
		MemWrite = 0;
		Branch = 1;
		RegWrite = 0;
		MemToReg = 0;
		
		#20 clk=1;
		#20 clk=0;
		hit=1;
		#20 clk=1;
				hit=0;
		#20 clk=0;
		
		MemToReg=1;
		#20 clk=1;
		#20 clk=0;
		#20 clk=1;
		#20 clk=0;
		// Wait 100 ns for global reset to finish

        
		// Add stimulus here

	end
      
endmodule

