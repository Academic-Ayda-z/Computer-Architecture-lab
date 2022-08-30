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
												 funct ==  6'b000110 ? 4'b0100://slt
												 funct ==  6'b000111 ? 4'b0010:
												 4'bx
											 ) :
								ALUOp == 3'b001 ? 4'b0001://beq
								ALUOp == 3'b010 ? 4'b0111:
								ALUOp == 3'b011 ? 4'b0000:
								//branch
								ALUOp == 3'b100 ?(
									funct == 6'b000000 ? 4'b1000: //beq
									funct ==	6'b000001 ? 4'b1001: //bgt
									funct ==	6'b000010 ? 4'b1010: //bge
									funct ==	6'b000011 ? 4'b1011: //blt
									funct ==	6'b000100 ? 4'b1100: //ble
									funct ==	6'b000101 ? 4'b1101: //bne
									
									funct == 6'b111010 ? 4'b1110://j
									funct == 6'b111011 ? 4'b1111://jal
 									4'bx
									):
								ALUOp == 3'b101 ?(
									funct == 6'b100000 ? 4'b0100: //multi
									funct == 6'b100001 ? 4'b0101://divi
									funct == 6'b100010 ? 4'b0110://sar
									4'bx
								):
						
								0;
				

endmodule
