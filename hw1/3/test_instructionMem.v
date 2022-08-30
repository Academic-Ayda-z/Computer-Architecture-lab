`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:27:51 10/13/2021
// Design Name:   instruction_mem
// Module Name:   C:/Xilinx/hw1/test_instructionMem.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_instructionMem;

	// Inputs
	reg clk;
	reg [31:0] address;

	// Outputs
	wire [127:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	instruction_mem uut (
		.clk(clk), 
		.address(address), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		address = 7;
		clk = 0;
		#20 clk=1;
		
		#20 clk=0;
		#20 clk=1;
		
		#20 clk=0;
      #20 clk=1;
		
		#20 clk=0;
      #20 clk=1;
		
		#20 clk=0;
      #20 clk=1;

		#20 clk=0;
      #20 clk=1;		
		#0 address=10;
		
		#20 clk=0;
      #20 clk=1;
		
		#20 clk=0;
      #20 clk=1;// Add stimulus here

		#20 clk=0;
      #20 clk=1;
		
		#20 clk=0;
      #20 clk=1;
		
		#20 clk=0;
      #20 clk=1;
		
		#20 clk=0;
      #20 clk=1;

		#20 clk=0;
      #20 clk=1;		
	end
	
	initial #41000 $finish;
endmodule

