`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:21 12/22/2021 
// Design Name: 
// Module Name:    writeBack 
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
module writeBack(
	input MemtoReg,input[31:0] readData,input[31:0] ALUResult,
	output[31:0] writeData
    );
	assign writeData= MemtoReg==1?readData:ALUResult;
	
endmodule