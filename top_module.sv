`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2020 09:42:52 PM
// Design Name: 
// Module Name: top_module
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


module top_module(sf, qr, clk);


    input [7:0] sf [999 : 0];                                                       //target
    input [7:0] qr [1015 : 0];                                                      //query
    input clk;
    
    reg [127:0] q_       = 128'h04040404040404040404040404040404;   
    reg [127:0] q2_      = 128'h18181818181818181818181818181818;  
	reg [127:0] qe_      = 128'h06060606060606060606060606060606;
	reg [127:0] qe2_     = 128'h19191919191919191919191919191919;  
	reg [127:0] sc_mch_  = 128'h02020202020202020202020202020202;
	reg [127:0] sc_mis_  = 128'hfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfc; 
	reg [127:0] sc_N_    = 128'hffffffffffffffffffffffffffffffff;
	reg [127:0] m1_      = 128'h04040404040404040404040404040404;
	
	reg [15:0] st;                                                                  //loop boundries
	reg [15:0] en; 
	reg [15:0] st0; 
	reg [15:0] en0;
	
	reg inc = 1'b0;
	reg [9:0] i = 10'd0;
    reg [9:0] t = 10'd0;                                                           //inner loop variable
	reg [9:0] r = 10'd0;                                                           //main loop variable
				
	reg [127:0] u  [125:0];
    reg [127:0] v  [125:0];
    reg [127:0] x  [125:0];
    reg [127:0] y  [125:0];
    reg [127:0] x2 [125:0];
    reg [127:0] y2 [125:0];
	reg [127:0] s  [125:0];
	
	always@(posedge clk)
	begin
	   if(inc == 1'b1)
	       r = r + 1'b1;
	end
	
	main_loop A0 (.r(r), .st(st), .en(en), .st0(st0), .en0(en0), .y(y), .y2(y2), .u(u));
	
	always@(posedge clk)
    begin
        if(i <= en0)
            begin
            t = st0 + i;
            i = i + 5'd16;
            inc = 1'b0;
            end
        if (i > en0)
            begin 
            inc = 1'b1;
            i = 10'b0;
            end
    end
	
	loop_fission A1 (.r(r), .t(t), .sf(sf), .qr(qr), .m1_(m1_), .sc_mis_(sc_mis_), .sc_mch_(sc_mch_), .sc_N_(sc_N_), .s(s));

endmodule
