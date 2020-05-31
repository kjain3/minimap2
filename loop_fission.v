`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2020 03:18:53 PM
// Design Name: 
// Module Name: loop_fission
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

module loop_fission(r, t, sf, qr, m1_, sc_mis_, sc_mch_, sc_N_, s);

    parameter tlen_ = 126;
    
    input [9:0] t;
    input [9:0] r;    
    input [7:0] sf [999 : 0];
    input [7:0] qr [1015 : 0];
    input [127:0] m1_;
    input [127:0] sc_mis_;
    input [127:0] sc_mch_;
    input [127:0] sc_N_;
    //input sig;
   	output [127:0] s [125:0];
   	
   	reg [127:0] sq;
    reg [127:0] st;
    reg [127:0] tmp;
    reg [127:0] tmp1;
    reg [127:0] mask;
    reg [127:0] dst0;
    reg [127:0] dst1;
    reg [127:0] dst2;
    reg [127:0] s [tlen_ - 1: 0];
    reg [7:0] qrr [999 : 0];
  
    assign qrr = qr[(999 - r) +: 1000];
    
    _mm_loadu_si8  a0 (sq, sf[t +: 16]);
    _mm_loadu_si8  a1 (st, qrr[t +: 16]);
    
    _mm_cmpeq_epi8   a2 (dst0, sq, m1_);
    _mm_cmpeq_epi8   a3 (dst1, st, m1_);
        
    _mm_or_si128     a4 (mask, dst0, dst1);   
        
    _mm_cmpeq_epi8   a5 (tmp, sq, st);
      
    _mm_blendv_epi8  a6 (dst2, sc_mis_, sc_mch_, tmp);
      
    _mm_blendv_epi8  a7 (tmp1, dst2, sc_N_, mask);
       
    _mm_storeu_si128 a8 (s, tmp1, (t>>4));       

endmodule
