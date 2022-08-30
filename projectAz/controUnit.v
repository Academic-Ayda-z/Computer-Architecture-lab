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
module controUnit(input [7:0]opCode,output egDst, aluSrc , memtoReg,
 regWrite , memRead , memWrite , 
branch ,output[3:0]  aluOp );
//output egDst, aluSrc , memtoReg,regWrite , memRead , memWrite , branch ;
//output[3:0] aluOp;

wire [10:0]out;

assign out=opCode==6'b000000?1001000000:
		opCode==6'b000100?0111100011;
		opCode==6'b000101?0100010011;
		opCode==6'b000111?0101000011;
		opCode==6'b000110?0000001001;
		opCode==6'b000001?0101000010;//:0000000000;


assign egDst=out[0];
assign aluSrc=out[1];
assign memtoReg=out[2];
assign regWrite=out[3];
assign memRead=out[4];
assign memWrite=out[5];
assign branch=out[6];
assign aluOp=out[7:10];


endmodule
