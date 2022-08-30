`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:43 12/09/2021
// Design Name:   Alu
// Module Name:   C:/Xilinx/hw1/testAlu.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testAlu;

	// Inputs
	reg [3:0] ALUCnt;
	reg [31:0] input1;
	reg [31:0] input2;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	Alu uut (
		.ALUCnt(ALUCnt), 
		.input1(input1), 
		.input2(input2), 
		.shamt(shamt), 
		.result(result), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		ALUCnt = 4'b0000;
		input1 = 1;
		input2 = 2;
		shamt = 1;

		// Wait 100 ns for global reset to finish
		#100;
		ALUCnt = 4'b0011;
		input1 = 11;
		input2 = 22;
		shamt = 2;
        
		// Add stimulus here

	end
      
endmodule

