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
module mul32(a,b,select,result);
    input [31:0] a;
    input [31:0] b;
	 input select;
    output reg [31:0] result;
	 wire [31:0] a,b;
     
 always @(a,b,select)
 begin	 
 result= select?b:a;
$display("result=%d",result);
 end    

endmodule