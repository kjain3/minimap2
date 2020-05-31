`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 01:49:25 PM
// Design Name: 
// Module Name: loop_2_tb
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


module loop_2_tb();
    reg [9:0]   t;
    reg [127:0] u  [125:0];
    reg [127:0] v  [125:0];
    reg [127:0] x  [125:0];
    reg [127:0] y  [125:0];
    reg [127:0] x2 [125:0];
    reg [127:0] y2 [125:0];
    reg [127:0] s  [125:0];
	reg [127:0] ix1_  [941:0];
	reg [127:0] ix21_ [941:0];
	reg [127:0] iv1_  [941:0];
	
	
	loop_2 UUT (.t(t), .ix1_(ix1_), .ix21_(ix21_), .iv1_(iv1_), .s(s), .x(x), .x2(x2), .u(u), .v(v), .y(y), .y2(y2));
	
	initial $readmemh("data_x1.txt",ix1_);
    initial $readmemh("data_x21.txt",ix21_);
    initial $readmemh("data_v1.txt",iv1_);
	
    initial 
    begin
        t     = 10'd0;
        u[0]  = 128'hfafafafafafafafafafafafafafafafa;
        v[0]  = 128'hfafafafafafafafafafafafafafafafa;
        x[0]  = 128'hfafafafafafafafafafafafafafafafa;
        y[0]  = 128'hfafafafafafafafafafafafafafafafa;
        x2[0] = 128'he7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7;
        y2[0] = 128'he7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7;
        s[0]  = 128'h02fc02fc02fc02fc02fc02fcfcfcfc02;
    end 
	
	
	
    
    
endmodule
