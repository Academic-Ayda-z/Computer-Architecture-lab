`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:38 10/30/2021 
// Design Name: 
// Module Name:    fetch 
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
module fetch(clock,branchT,pcS,
	pc,instruction,hit
    );
	input clock;
	input [31:0]branchT;
	input pcS;
	
	output reg hit;
	output reg [31:0]instruction;
	output reg [31:0]pc;
	
	wire [31:0]branchOrPc;
	wire [31:0]NextPc;
	wire [127:0]DataLine;
	wire Hit;
	wire [31:0]Instruction;
	
	reg [31:0]pc4;

	
	mul32 mul(.a(branchT),
	.b(pc4),
	.select(pcS),
	.result(branchOrPc));	

	pc_register pcReg(.clk(clock), 
			 .hit(Hit), 
			 .nextPc(branchOrPc), 
			 .Pc(NextPc)
			 );
	always@(NextPc)begin
	 pc4 = NextPc + 4;
	end

   instruction_mem instMem(.clk(clock),
	.address(NextPc),
	.instruction(DataLine));


	cashe cache(.clock(clock),
	.address(NextPc),
	.data_line(DataLine),
	.hit(Hit),
	.instruction(Instruction));
		
			
	always @(Hit or Instruction or pc4)
		begin
			hit = Hit;
			instruction = Instruction;
			pc=pc4;
		end
	
	endmodule
