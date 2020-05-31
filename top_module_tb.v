`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2020 05:53:03 PM
// Design Name: 
// Module Name: top_module_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module_tb();

    /*reg [127:0] u  [125:0];
    reg [127:0] v  [125:0];
    reg [127:0] x  [125:0];
    reg [127:0] y  [125:0];
    reg [127:0] x2 [125:0];
    reg [127:0] y2 [125:0];*/
	reg clk;
	
    reg [7:0] sf [999:0];
    reg [7:0] qr [1015:0];
    wire [9:0] r;
    wire [9:0] t;
    wire [15:0] st0;
    wire [15:0] en0;
	
	//wire [5:0]  column;
	//wire [5:0]  row;
	//reg [9:0] r;
	
	
	top_module UUT (.sf(sf), .qr(qr), .clk(clk));
	
	
	//assign column = (r/16);
	//assign row = 8*(r%16);
	
	initial $readmemh("sf.txt",sf);
    initial $readmemh("qr.txt",qr);
    //initial r = 10'd0;
	
	initial clk = 1'b1;
	
	always
	#10 clk = ~clk;
	
	always@(posedge clk)
	begin
	   $display("st0: %d, en0: %d, t: %d, r: %d", UUT.st0, UUT.en0, UUT.t, UUT.r);
	   $display("s[0]: %x", UUT.s[0]);
	   $display("s[1]: %x", UUT.s[1]);
	   $display("s[1]: %x", UUT.s[2]);
	end
	
endmodule
