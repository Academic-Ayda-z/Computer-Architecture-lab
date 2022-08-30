`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:27:01 12/22/2021 
// Design Name: 
// Module Name:    DataMemory 
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
module dataMemory(
	input clk, input [31:0]address,input[31:0] writeData,input MemRead, MemWrite,
	output reg[31:0] readData   
	);

reg [7:0] datamem [1023:0];

integer i;

initial 
begin
for ( i =0 ; i<8; i = i+1)
	begin
	datamem[i] = 0;
	end
end

always@(*)
begin
	if(MemWrite==1)begin
		datamem[address] <= writeData[7:0];
		datamem[address+1] <= writeData[15:8];
		datamem[address+2]<=writeData[23:16];
		datamem[address+3]<=writeData[31:24];
	end
	
	if(MemRead)begin
		readData[7:0] <= datamem[address];
		readData[15:8] <= datamem[address+1];
		readData[23:16] <= datamem[address+2];
		readData[31:24] <= datamem[address+3];
	end
end
endmodule
