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
module Alu( input [3:0]ALUCnt, input [31:0]input1,input[31:0] input2 , input[31:0] input3
,input[4:0] shamt,
	output [31:0]result,output zero
	);//input3 is aludata2 for branch
//
									
assign result = ALUCnt == 4'b0000 ? input1 + input2:
					 ALUCnt == 4'b0001 ? input1 - input2:
					 ALUCnt == 4'b0010 ? ~input1:
					 ALUCnt == 4'b0011 ? input1 << shamt:
					 ALUCnt == 4'b0100 ? input1 >> shamt:
					 ALUCnt == 4'b0101 ? input1 & input2:
					 ALUCnt == 4'b0110 ? input1 | input2:
					 ALUCnt == 4'b0111 ? (input1 < input2 ? 1 : 0):
					 ALUCnt == 4'b1000 ? (input1-input3): //beq
					 
					 ALUCnt == 4'b1001 ? ( (input1-input3)>0  ? 0:(input1-input3) )://bgt
					 ALUCnt == 4'b1010 ? ( (input1-input3)>=0 ? 0:(input1-input3) ): //bge
					 ALUCnt == 4'b1011 ? ( (input1-input3)<0  ? 0:(input1-input3) ): //blt
					 ALUCnt == 4'b1100 ? ( (input1-input3)<=0 ? 0:(input1-input3) ): //ble
					 ALUCnt == 4'b1101 ? ( (input1-input3)!=0 ? 0:(input1-input3) ): //bne
					
					 ALUCnt == 4'b1110 ? 1://j
 					 ALUCnt == 4'b1111 ? 1://jal
					 
					 ALUCnt == 4'b0100 ? input1*input2: //multi
					 ALUCnt == 4'b0101 ? input1/input2: //divi
					 ALUCnt == 4'b0110 ? input1>>input2: //divi
				
					 32'bx;
							
assign zero = result == 0 ? 1 : 0 ;


endmodule
