`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:59:14 12/10/2021
// Design Name:   Execute
// Module Name:   C:/Xilinx/hw1/testExecute.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testExecute;

	// Inputs
	reg clk;
	reg [31:0] ALUReadData1;
	reg [31:0] ALUReadData2;
	reg [31:0] immediate;
	reg [5:0] funct;
	reg [2:0] ALUOp;
	reg ALUSrc;

	// Outputs
	wire [31:0] ALUResult;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.clk(clk), 
		.ALUReadData1(ALUReadData1), 
		.ALUReadData2(ALUReadData2), 
		.immediate(immediate), 
		.funct(funct), 
		.ALUOp(ALUOp), 
		.ALUSrc(ALUSrc), 
		.ALUResult(ALUResult), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ALUReadData1 = 7;
		ALUReadData2 = 3;
		immediate = 32'b00000000000000000000000001000000;
		funct = 6'b000110;
		ALUOp = 0;
		ALUSrc = 1;

		// Wait 100 ns for global reset to finish
       #20 clk=1;
		 #20 clk=0;
		// Add stimulus here

	end
      
endmodule

