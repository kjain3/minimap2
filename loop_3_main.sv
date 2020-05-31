`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2020 12:36:59 PM
// Design Name: 
// Module Name: loop_3_main
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


module loop_3_main(r, st0, en0, u, v, mtei, mte_qi, mqei, mqe_ti, mteo, mte_qo, mqeo, mqe_to, score, en);

    input [9:0]   r;
    input [15:0]  st0;
    input [15:0]  en0;
    input [15:0]  en;
    input [127:0] u  [125:0];
    input [127:0] v  [125:0];
    input [9:0] mtei;
    input [9:0] mte_qi;
    input [9:0] mqei;
    input [9:0] mqe_ti;
    output reg [9:0] mteo;
    output reg [9:0] mte_qo;
    output reg [9:0] mqeo;
    output reg [9:0] mqe_to;
    output reg [31:0] score;
    
    parameter [12:0] tlen      = 13'd2007;
    parameter [12:0] qlen      = 13'd5000;
            
    reg [31:0] max_H;
    reg [31:0] max_t;
    reg [31:0] i;
    reg [31:0] H [2015:0];
    reg en1;
    reg [127:0] max_H_;
    reg [127:0] max_t_;
    reg u8;
    reg v8;
//    reg [31:0] H [2015:0];
    reg [127:0] H1;
    reg [127:0] H1_tmp;
    reg [127:0] tmp;
    reg [127:0] t_;
    reg [127:0] HH;
    reg [127:0] tt;
    
      
      
    //initialize H   
    assign en1 = st0 + (en0 - st0) / 4 * 4;
    assign u8 = u[(en0/16)][8*(en0%16) +: 8];
    assign v8 = v[(en0/16)][8*(en0%16) +: 8];
    
    assign max_t = en0;
    assign H[0] = (en0 > 0) ? (H[en0-1] + u8) : (H[en0] + v8);  
    assign max_H = H[en0];
    assign max_t = en0;
            
    _mm_set1_epi32  a0 (max_H_, max_H);
	_mm_set1_epi32  a1 (max_t_, max_t);   
		    
    _mm_loadu_si128  a2  (H1_tmp, H[t +: 0]);
	_mm_setr_epi32   a3  (t1_, v[t+:0], v[t+1+:0], v[t+2+:0], v[t+3+:0]);
	_mm_add_epi32    a4  (H1, H1_tmp, t_);    
	_mm_storeu_si128 a5  (H, H1, t);
    _mm_set1_epi32   a6  (t_, t);
    _mm_cmpgt_epi32  a7  (tmp, H1, max_H_);
    _mm_blendv_epi8  a8  (max_H_, max_H_, H1, tmp);
    _mm_blendv_epi8  a9  (max_t_, max_t_, t_, tmp);
    
    _mm_storeu_si128 a10  (HH, max_H_);
	_mm_storeu_si128 a11 (tt, max_t_);
	
	
	
	always@(*)
	begin
	
	if (en0 == tlen - 1 && H[en0] > mtei)
	begin
		mteo = H[en0]; 
		mte_qo = r - en;
    end
	if (r - st0 == qlen - 1 && H[st0] > mqei)
	begin
		mqeo = H[st0];
		mqe_to = st0;
	end
	if (r == qlen + tlen - 2 && en0 == tlen - 1)
		score = H[tlen - 1];
	end
        
    
endmodule
