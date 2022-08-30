`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:18:18 11/01/2021
// Design Name:   fetch
// Module Name:   C:/Xilinx/hw1/fetchTest.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fetchTest;

	// Inputs
	reg clock;
	reg [31:0] branchT;
	reg pcS;
	reg pc;

	// Outputs
	wire [31:0] instruction;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	
	fetch uut (
		.clock(clock), 
		.branchT(branchT), 
		.pcS(pcS), 
		.pc(pc), 
		.instruction(instruction), 
		.hit(hit)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		branchT = 0;
		pcS = 1;
		pc = 0;
		#20 clock=1;
		
		#20 clock=0;
		
		#20 clock=1;
		
		#20 clock=0;
		
		#20 clock=1;
		
		#20 clock=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

