`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:02 12/09/2021 
// Design Name: 
// Module Name:    Alu 
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
module Alu( input [3:0]ALUCnt, input [31:0]input1,input[31:0] input2 ,input[4:0] shamt,
	output [31:0]result,output zero
	);

assign result = ALUCnt == 4'b0000 ? input1 + input2:
					 ALUCnt == 4'b0001 ? input1 - input2:
					 ALUCnt == 4'b0010 ? ~input1:
					 ALUCnt == 4'b0011 ? input1 << shamt:
					 ALUCnt == 4'b0100 ? input1 >> shamt:
					 ALUCnt == 4'b0101 ? input1 & input2:
					 ALUCnt == 4'b0110 ? input1 | input2:
					 ALUCnt == 4'b0111 ? (input1 < input2 ? 1 : 0):
					 0;
							
assign zero = result == 0 ? 1 : 0 ;


endmodule
