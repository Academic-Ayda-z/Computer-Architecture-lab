`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:53 12/22/2021 
// Design Name: 
// Module Name:    MemWbReg 
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
module MemWbReg(
   input clk, hit,input[31:0] readData,input[31:0] ALUResult, input [4:0]writeReg,input RegWrite,
	input MemtoReg,
	output reg hitOut,output reg[31:0] readDataOut ,output reg[31:0] ALUResultOut,output reg[4:0] writeRegOut,
	output reg RegWriteOut, output reg MemtoRegOut
	 );


always@(negedge clk)
begin 
	if(hit)begin		
		hitOut=hit;
		readDataOut=readData;
		ALUResultOut=ALUResult;
		writeRegOut=writeReg;
		RegWriteOut=RegWrite;
		MemtoRegOut=MemtoReg;
	end
end
endmodule
