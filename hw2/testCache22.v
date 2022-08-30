`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:17:29 11/01/2021
// Design Name:   cashe
// Module Name:   C:/Xilinx/hw1/testCache22.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cashe
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testCache22;

	// Inputs
	reg clock;
	reg [31:0] address;
	reg [127:0] data_line;

	// Outputs
	wire hit;
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	cashe uut (
		.clock(clock), 
		.address(address), 
		.data_line(data_line), 
		.hit(hit), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		address = 12;
		data_line = 127;
		#20 clock=1;
		address=2;
		
		#20 clock=0;
		
		#20 clock=1;
		address=12;
		
		#20 clock=0;
		
		#20 clock=1;
		
		address=25;
		
		#20 clock=0;
		
		#20 clock=1;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

