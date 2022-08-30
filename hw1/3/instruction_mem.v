`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:51 10/11/2021 
// Design Name: 
// Module Name:    instruction_mem 
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
module instruction_mem(clk,address,instruction);

input clk;
input [31:0]address;
output reg [127:0]instruction;

reg [31:0] mem[1023:0];
reg [2:0] counter;

integer i;//,counter;
initial
	begin
	counter=0;
	for(i=0;i<1024;i=i+1)
		begin
			mem[i]=i;
		end
end
		
always @(address<<28)
	begin 
	counter=0;
	end

always @(posedge clk)
	begin
	if(counter==4)
		begin 
		instruction={mem[(address >> 2)],mem[((address >> 2))+1],mem[((address >> 2))+2],mem[((address >> 2))+3]};
		counter=0;
		end
//	else		
	//	begin 
		counter=counter+1;	
		//end
	end	 
//$display("instruction=%d",instruction);
endmodule
