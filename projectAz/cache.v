`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:20 11/01/2021 
// Design Name: 
// Module Name:    casheeeeeee 
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
module cashe(clock,address,data_line,hit,instruction);
	input [31:0]address;
	input clock;
	input [127:0] data_line;
	reg [153:0]storage[7:0];
	output reg hit;
	output reg [31:0]instruction;
	integer i=0;
	initial begin
		for(i=0;i<8;i=i+1)begin
			storage[i]=0;
			
		end
	end
	
	always@(data_line)
		begin
			if(data_line !== 128'bx)
				begin
					storage[address[6:4]]={1'b1,address[31:7],data_line};
                
				end
		end
	
	
	
	
   always@(posedge clock)
	begin
		if(storage[address[6:4]][153]==1)// && storage[address[6:4]][152:128]==address[31:7])
		begin
		if(storage[address[6:4]][152:128]==address[31:7])
				begin
					hit=1;	
					if (address[3:2] == 2'b00) begin instruction = storage[address[6:4]][31:0];end
					if (address[3:2] == 2'b01) begin instruction = storage[address[6:4]][63:32];end
					if (address[3:2] == 2'b10) begin instruction = storage[address[6:4]][95:64];end
					if (address[3:2] == 2'b11) begin instruction = storage[address[6:4]][127:96];end
				end
		else
			begin 
				hit=0;
				instruction=32'bx;
			end
			
		end
	   else
			begin
				hit=0;
				instruction=32'bx;
			end

	end
endmodule
