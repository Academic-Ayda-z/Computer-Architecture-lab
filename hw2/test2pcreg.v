`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:09:13 11/01/2021
// Design Name:   pc_register
// Module Name:   C:/Xilinx/hw1/test2pcreg.v
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

module test2pcreg;

	// Inputs
	reg clk;
	reg hit;
	reg [31:0] nextPc;

	// Outputs
	wire [31:0] Pc;

	// Instantiate the Unit Under Test (UUT)
	pc_register uut (
		.clk(clk), 
		.hit(hit), 
		.nextPc(nextPc), 
		.Pc(Pc)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		hit = 0;
		nextPc = 4;
		#20 clk=1;
		#20 clk=0;
		hit = 1;
		#20 clk=1;
		#20 clk=0;
		
		nextPc = 7;
		
		#20 clk=1;
		#20 clk=0;
		
		hit =0;
		nextPc=5;
		#20 clk=1;
		#20 clk=0;
		#20 clk=1;
		#20 clk=0;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

