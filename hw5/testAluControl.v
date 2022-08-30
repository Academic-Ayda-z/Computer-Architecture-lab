`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:31:50 12/09/2021
// Design Name:   aluControl
// Module Name:   C:/Xilinx/hw1/testAluControl.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: aluControl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testAluControl;

	// Inputs
	reg [2:0] ALUOp;
	reg [5:0] funct;

	// Outputs
	wire [3:0] aluCnt;

	// Instantiate the Unit Under Test (UUT)
	aluControl uut (
		.ALUOp(ALUOp), 
		.funct(funct), 
		.aluCnt(aluCnt)
	);

	initial begin
		// Initialize Inputs
		ALUOp = 000;
		funct = 6'b000111;

		// Wait 100 ns for global reset to finish
		#100;
		ALUOp=010;
        
		// Add stimulus here

	end
      
endmodule

