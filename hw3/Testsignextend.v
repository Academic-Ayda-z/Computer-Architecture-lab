`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:04:42 11/06/2021
// Design Name:   signEx
// Module Name:   C:/Xilinx/hw1/Testsignextend.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signEx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Testsignextend;

	// Inputs
	reg[15:0] address16;

	// Outputs
	wire[31:0] address32;

	// Instantiate the Unit Under Test (UUT)
	signEx uut (
		.address16(address16), 
		.address32(address32)
	);

	initial begin
		// Initialize Inputs
		address16 = 16'b1111111111110000;
		#100;
		
		address16 = 16'b0011111111110000;
	//	address16=16'b0111100000011011;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

