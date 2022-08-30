`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:02:06 11/07/2021
// Design Name:   decode
// Module Name:   C:/Xilinx/hw1/testdecode.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testdecode;

	// Inputs
	reg clock;
	reg [31:0] instruction;

	// Outputs
	wire [5:0] opcode;
	wire [31:0] data1;
	wire [31:0] data2;
	wire [31:0] signex;
	wire [4:0] rt;
	wire [4:0] rd;

	// Instantiate the Unit Under Test (UUT)
	decode uut (
		.clock(clock),  
		.instruction(instruction), 
		.opcode(opcode), 
		.data1(data1), 
		.data2(data2), 
		.signex(signex), 
		.rt(rt), 
		.rd(rd)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		instruction = 32'b01110101101101001111000111010101;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
   always#50 clock = ~clock;   
      
endmodule

