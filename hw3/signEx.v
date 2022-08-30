`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:53 11/06/2021 
// Design Name: 
// Module Name:    signEx 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module signEx(address16,address32 );
	input [15:0]address16;
	output [31:0]address32;
	assign address32={{16{address16[15]}},address16}; 

endmodule
