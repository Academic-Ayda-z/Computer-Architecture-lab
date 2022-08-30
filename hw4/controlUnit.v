`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:09 11/28/2021 
// Design Name: 
// Module Name:    controUnit 
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
module controlUnit(opCode, regDst, aluSrc , memtoReg,
 regWrite , memRead , memWrite , 
branch , aluOp );

input [5:0]opCode;
output regDst, aluSrc , memtoReg,regWrite , memRead , memWrite , branch ;
output[2:0] aluOp;
wire [9:0]out;

assign out=opCode==6'b000000 ? 10'b1001000000:
			opCode==6'b000100 ? 10'b0111100011:
			opCode==6'b000101 ? 10'b0100010011:
			opCode==6'b000111 ? 10'b0101000011:
			opCode==6'b000110 ? 10'b0000001001:
  			opCode==6'b000001 ? 10'b0101000010:0000000000;


assign regDst=out[9];
assign aluSrc=out[8];
assign memtoReg=out[7];
assign regWrite=out[6];
assign memRead=out[5];
assign memWrite=out[4];
assign branch=out[3];
assign aluOp=out[2:0];


endmodule
