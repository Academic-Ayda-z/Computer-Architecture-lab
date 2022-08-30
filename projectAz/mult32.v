`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:50:12 10/11/2021 
// Design Name: 
// Module Name:    mul32 
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
// HW1_1
/////////////////////////////////////////////////////////////////////////////////
module mult32(pc,branch,target,select,result);
	 input [31:0] pc;
    input [31:0] branch;
	 input [31:0] target;
	 input select;
    output [31:0] result;
	 //assign result=(select==1'b1)? branch:pc ;
	 assign result =(target[31:27]==5'b11101)?{4'b0,target[25:0]}:( (select==1'b1)? branch:pc );

endmodule

/*    input [31:0] pc;
    input [31:0] branch;
    input [31:0] target;
	 input select;
    output reg [31:0] result;
     
always@(select or pc or branch)
begin 
	
	if(select == 1'b1)begin
		result = branch;
		end
	else begin
		result = pc;
		end
end		
	

endmodule*/