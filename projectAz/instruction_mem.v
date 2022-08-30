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
	input wire clk;
	input wire [31:0]address;
	output reg [127:0]instruction;
	reg [31:0]addressreg;
	reg [3:0]counter=0;
	reg [7:0]memory[1023:0];
	reg flag=0;
	
	integer i;
	initial begin
		for(i=0;i<9000;i=i+1)begin//9000
			memory[i]=i%200;
		end
	end	
  
	always @(posedge clk)begin
		if(address[31:4] !== addressreg[31:4])begin
			instruction <= 128'bx;
			counter <= 0;
			flag <= 1;
			addressreg[31:4] <= address[31:4];
		end
		else if(flag == 1)begin
			if(counter < 5)begin
				counter <= counter+1;
			end
			else if(counter == 5) begin
				instruction<={
					
					{32'b1000000000100001000000000000000011},
//j					{32'b11101011111111111111111111111111},
//jal					{32'b11101111111111111111111111111111},
					{32'b00000000000000000000000000000000},
					{32'b00000000000000000000000000000000},
					{32'b00000000000000000000000000000000}
	
				/*	beq
					{32'b00100000010000001000000010000000},
					{32'b00000000000000000000000000000000},
					{32'b00000000000000000000000000000000},
					{32'b00000000000000000000000000000000}
*/			
			/*beq
				{32'b00000000000000000000000000000000},
				{32'b00000000000000000000000000000000},
				{32'b00000000000000000000000000000000},
				{32'b00011000000000010000000000000000}
*/
	/*
				{32'b00010100000000010000000000000000},
				{32'b00010100001000000000000000000000},
				{32'b00011000000000010000000000000000},
				{32'b00011000000000010000000000000000}
*/
	/*			
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}],
				memory[{addressreg[31:4],4'd0}]
*/				};
				counter <= 0;
				flag <= 0;
			end
		end
	end
	
endmodule

/*
input clk;
input [31:0]address;
output reg [127:0]instruction;

reg [31:0] mem[1023:0];
reg [2:0] counter;

reg [31:0]lastAddress;
		
integer i;//,counter;
initial
	begin
	counter=0;
	lastAddress=32'b0;
	for(i=0;i<1024;i=i+3)
		begin
		mem[i]=32'b0;
		mem[i+1]=32'b00011100000000000000000000000000;
		mem[i+2]=32'b0;	
		end

end
//always @(address<<28)
//	begin 
//	counter=0;
	//end
//
always @(posedge clk)
	begin
	if (lastAddress[31:4]!=address[31:4])
		begin
		counter=0;
		lastAddress=address;
		end	
		else begin
	if(counter==5)
		begin 
		instruction={mem[(address >> 2)],mem[((address >> 2))+1],mem[((address >> 2))+2],mem[((address >> 2))+3]};
		counter=0;
		end
	else begin
		counter=counter+1;
		end
	end	 
	end
//$display("instruction=%d",instruction);
*/