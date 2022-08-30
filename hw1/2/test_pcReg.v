`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:49:27 10/11/2021
// Design Name:   pc_register
// Module Name:   C:/Xilinx/hw1/test_pcReg.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pcReg;

	// Inputs
	reg clk;
	reg [31:0] nextPc;

	// Outputs
	wire [31:0] Pc;

	// Instantiate the Unit Under Test (UUT)
	pc_register uut (
		.clk(clk), 
		.nextPc(nextPc), 
		.Pc(Pc)
	);

	initial begin
		// Initialize Inputs
		nextPc=0;
		clk=0;
		#20 nextPc=4;
		#20 clk=1;
		
		#20 clk=0;
		#20 nextPc=8;
		#20 clk=1;
		
		#20 clk=0;
		#20 clk=1;
		
		#20 clk=0;
		#20 clk=1;
		
		#20 clk=0;
		end
		initial #180 $finish;
endmodule

