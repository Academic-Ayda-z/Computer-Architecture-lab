`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:45:33 12/22/2021
// Design Name:   dataMemory
// Module Name:   C:/Xilinx/hw1/testDataMemory.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testDataMemory;

	// Inputs
	reg clk;
	reg [31:0] address;
	reg [31:0] writeData;
	reg MemRead;
	reg MemWrite;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	dataMemory uut (
		.clk(clk), 
		.address(address), 
		.writeData(writeData), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.readData(readData)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		address = 2;
		writeData = 2;
		MemRead = 1;
		MemWrite = 0;
		#20 clk=1;
		#20 clk=0;
		MemWrite=1;
		MemRead=0;
		#20 clk=1;
		#20 clk=0;
		#20 clk=1;
		#20 clk=0;
		MemRead=1;
		#20 clk=1;
		#20 clk=0;
		#20 clk=1;
		#20 clk=0;
		
	end
      
endmodule

