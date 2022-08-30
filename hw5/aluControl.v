`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:42 12/09/2021 
// Design Name: 
// Module Name:    aluControl 
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
module aluControl(input wire[2:0] ALUOp ,input[5:0] funct ,output[3:0]aluCnt );
	assign aluCnt = ALUOp == 3'b000 ?(
												 funct ==  6'b000000 ? 4'b0000:
												 funct ==  6'b000001 ? 4'b0001:
												 funct ==  6'b000010 ? 4'b0101:
												 funct ==  6'b000011 ? 4'b0110:
												 funct ==  6'b000100 ? 4'b0111:
												 funct ==  6'b000101 ? 4'b0011:
												 funct ==  6'b000110 ? 4'b0100:
												 funct ==  6'b000111 ? 4'b0010:
												 0
												 ) :
								ALUOp == 3'b001 ? 4'b0001:
								ALUOp == 3'b010 ? 4'b0111:
								ALUOp == 3'b011 ? 4'b0000:
								0;
				

endmodule
