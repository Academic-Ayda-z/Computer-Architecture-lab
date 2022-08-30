`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:51:24 11/29/2021
// Design Name:   IfIDReg
// Module Name:   C:/Xilinx/hw1/testIFID.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IfIDReg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testIFID;

	// Inputs
	reg clk;
	reg [31:0] next_pc;
	reg [31:0] instruction;
	reg hit;

	// Outputs
	wire [31:0] instruction_out;
	wire [31:0] next_pc_out;
	wire hit_out;

	// Instantiate the Unit Under Test (UUT)
	IfIDReg uut (
		.clk(clk), 
		.next_pc(next_pc), 
		.instruction(instruction), 
		.hit(hit), 
		.instruction_out(instruction_out), 
		.next_pc_out(next_pc_out), 
		.hit_out(hit_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		next_pc = 10;
		instruction = 7;
		hit = 1;
		#20 clk=1;
		#20 clk=0;
		#20 clk=1;
		hit=0;
		next_pc=3;
		#20 clk=0;
		#20 clk=1;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

