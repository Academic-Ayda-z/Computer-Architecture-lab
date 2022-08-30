`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:59 11/06/2021 
// Design Name: 
// Module Name:    regfile 
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
module regfile(clock,regwrite,readReg1,readReg2,writeReg,writeData,data1,data2);
	input clock;
	input regwrite;
	input [4:0]readReg1;
	input [4:0]readReg2;
	input [4:0]writeReg;
	input [31:0]writeData;

	output [31:0]data1;
	output [31:0]data2;
	
	reg [31:0]regF[31:0];
	integer i=0;
	
	initial
		begin 
			for(i=0;i<32;i=i+1)begin 
				regF[i]=0;
			end
		end
	

assign data1 = regF[readReg1];
assign data2 = regF[readReg2];

always@(posedge clock)
begin
	if(regwrite==1 && writeReg!==5'b0)begin
		regF[writeReg] <= writeData;
		end
end



endmodule
