`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:13:48 12/22/2021
// Design Name:   Mips
// Module Name:   C:/Xilinx/hw1/testMips.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testMips;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Mips uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
	end
      
		
	always #10 clk = ~clk;   
endmodule

