`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:35:00 10/11/2021
// Design Name:   mul32
// Module Name:   C:/Xilinx/hw1/testtt.v
// Project Name:  hw1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mul32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testtt;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg select;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	mul32 uut (
		.a(a), 
		.b(b), 
		.select(select), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 8;
		select = 1;
		#20 select=0;
		#20 a=7;
		#20 select=1;
		end
      initial $monitor("a=%d,b=%d,select=%d,result=%d",a,b,select,result);
		initial #60 $finish;
endmodule

