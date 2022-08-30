`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:09:19 11/06/2021
// Design Name:   regfile
// Module Name:   C:/Xilinx/hw1/testRegF.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: regfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testRegF;

	// Inputs
	reg clock;
	reg regwrite;
	reg [4:0] readReg1;
	reg [4:0] readReg2;
	reg [4:0] writeReg;
	reg [31:0] writeData;
	wire [31:0]data1;
	wire [31:0]data2;
	
	// Instantiate the Unit Under Test (UUT)
	regfile uut (
		.clock(clock), 
		.regwrite(regwrite), 
		.readReg1(readReg1), 
		.readReg2(readReg2), 
		.writeReg(writeReg), 
		.writeData(writeData),
		.data1(data1),
		.data2(data2)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		regwrite = 1;
		readReg1 = 2;
		readReg2 = 3;
		writeReg = 3;
		writeData = 6;
		// Wait 100 ns for global reset to finish
		#100;
		regwrite = 2;
		writeReg = 8;
		#100;
	
		regwrite = 1;
		readReg1 = 2;
		readReg2 = 3;
		writeReg = 2;
		writeData = 127;
        
		// Add stimulus here

	end
   always#30 clock = ~clock;   
endmodule
