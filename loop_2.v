`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2020 06:18:10 PM
// Design Name: 
// Module Name: loop_2
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

module loop_2(t, ix1_, ix21_, iv1_, s, x, x2, u, v, y, y2);

    input [9:0] t;
    input [127:0] s [125 : 0];
    input [127:0] u [125 : 0];
    input [127:0] y [125 : 0];
    input [127:0] y2 [125 : 0];
    input [127:0] v [125 : 0];
    input [127:0] x [125 : 0];
    input [127:0] x2 [125 : 0];
    
    input [127:0] ix1_  [941:0];
    input [127:0] ix21_ [941:0];
    input [127:0] iv1_  [941:0];
    
    reg [127:0] d;
    reg [127:0] d0;
    reg [127:0] d1;
    reg [127:0] d2;
    reg [127:0] d3;
    reg [127:0] d4;
    reg [127:0] z;
    reg [127:0] z0;
    reg [127:0] z1;
    reg [127:0] z2;
    reg [127:0] z3;
    reg [127:0] z4;
    reg [127:0] z5;
    
    
    reg [127:0] a;
    reg [127:0] b;
    reg [127:0] a2;
    reg [127:0] b2;
    reg [127:0] xt1;
    reg [127:0] xt1_or;
    reg [127:0] x2t1;
    reg [127:0] x2t1_or;
    reg [127:0] vt1;
    reg [127:0] vt1_or;
    reg [127:0] ut;
    //reg [127:0] u_out [125 : 0];
    reg [127:0] tmp_x;
    reg [127:0] tmp_v;
    reg [127:0] tmp_x2;
    reg [127:0] dst;
    reg [127:0] dst0;
    reg [127:0] dst1;
    reg [127:0] dst2;
    reg [127:0] dst3;
    reg [127:0] dst4;
    reg [127:0] dst5;
    reg [127:0] dst6;
    reg [127:0] dst7;
    reg [127:0] dst8;
    reg [127:0] dst9;
    reg [127:0] dst10;
    reg [127:0] dst11;
    reg [127:0] dst12;
    reg [127:0] dst13;
    
    reg [127:0] x1_;
    reg [127:0] x21_;
    reg [127:0] v1_;    
    
    
    ////dp_block1
    _mm_load_si128  a0  (z, s, t);
    _mm_load_si128  a1  (xt1, x, t);
    _mm_srli_si128  a02 (tmp_x, xt1, 8'd15);
    _mm_slli_si128  a3  (dst0, xt1, 8'd1);
    _mm_or_si128    a4  (xt1_or, dst0, ix1_[t]);
    assign x1_ = tmp_x;
    _mm_load_si128  a5  (vt1, v, t);
    _mm_srli_si128  a6  (tmp_v, vt1, 8'd15);       
    _mm_slli_si128  a7  (dst1, vt1, 8'd1);
    _mm_or_si128    a8  (vt1_or, dst1, iv1_[t]);
    assign v1_ = tmp_v;
    _mm_add_epi8    a9  (a, xt1_or, vt1_or);
    _mm_load_si128  a10 (ut, u, t);
    _mm_load_si128  a11 (dst2, y, t);
    _mm_add_epi8    a12 (b, dst2, ut);
    _mm_load_si128  a13 (x2t1, x2, t);
    _mm_srli_si128  a14 (tmp_x2, x2t1, 8'd15);
    _mm_slli_si128  a15 (dst, x2t1, 8'd1);
    _mm_or_si128    a16 (x2t1_or, dst, ix21_[t]);
    assign x21_ = tmp_x2;
    _mm_add_epi8    a17 (a2, x2t1_or, vt1_or);
    _mm_load_si128  a18 (dst3, y2, t);
    _mm_add_epi8    a19 (b2, dst3, ut);
    ////
    
    
    _mm_cmpgt_epi8  a20 (dst4, a, z);
    _mm_set1_epi8   a21 (dst5, 8'd1);
    _mm_and_si128   a22 (d, dst4, dst5);
    _mm_max_epi8    a23 (z0, z, a);
        
    _mm_set1_epi8   a24 (dst6, 8'd2);
    _mm_cmpgt_epi8  a25 (dst7, b, z0);
    _mm_blendv_epi8 a26 (d0, d, dst6, dst7);
    _mm_max_epi8    a27 (z1, z0, b);

    _mm_set1_epi8   a28 (dst8, 8'd3);
    _mm_cmpgt_epi8  a29 (dst9, a2, z1);
    _mm_blendv_epi8 a30 (d1, d0, dst8, dst9);
    _mm_max_epi8    a31 (z2, z1, a2);

    _mm_set1_epi8   a32 (dst10, 8'd4);
    _mm_cmpgt_epi8  a33 (dst11, b2, z);
    _mm_blendv_epi8 a34 (d2, d1, dst10, dst11);
    _mm_max_epi8    a35 (z3, z2, b2);

    _mm_max_epi8    a36 (z4, z3, b2);
	_mm_min_epi8    a37 (z5, z4, sc_mch_);
    
    
    /*    
    ////dp_block2
    _mm_sub_epi8    a38 (dst12, z5, vt1_or);
    _mm_store_si128 a39 (x, dst18, t);
        
    _mm_sub_epi8    a40 (dst13, z5, ut);
    _mm_store_si128 a41 (v, t, dst);
    _mm_sub_epi8    a42 (dst14, z5, q_);
    _mm_sub_epi8    a43 (a, a, dst14);
    _mm_sub_epi8    a44 (b, b, dst14);
    _mm_sub_epi8    a45 (dst15, z5, q2_);
    _mm_sub_epi8    a46 (a2, a2, dst15);
    _mm_sub_epi8    a47 (b2, b2, dst15);
    ////
       
    _mm_cmpgt_epi8  a48 (dst16, a, zero_);
    _mm_and_si128   a49 (dst17, dst16, a);
    _mm_sub_epi8    a50 (dst18, dst17, qe_);
    _mm_store_si128 a51 (x, ds18, t);
        
    _mm_set1_epi8   a52 (dst19, 8'H08);  
    _mm_and_si128   a53 (dst20, dst16, dst19);
    _mm_or_si128    a54 (d3, d2, dst20);
        
    _mm_cmpgt_epi8  a55 (dst21, b, zero_);
    _mm_and_si128   a56 (dst22, dst21, b);
    _mm_sub_epi8    a57 (dst23, dst22, qe_);
    _mm_store_si128 a58 (y[t], dst23);
    _mm_set1_epi8   a59 (dst24, 8'H10);  
    _mm_and_si128   a60 (dst25, dst21, dst24);
    _mm_or_si128    a61 (d4, d3, dst25);
 
    _mm_cmpgt_epi8  a62 (dst26, a2, zero_);
    _mm_and_si128   a63 (dst27, dst26, a2);
    _mm_sub_epi8    a64 (dst28, dst27, qe2_);
    _mm_store_si128 a65 (x2[t], dst28);
    _mm_set1_epi8   a66 (dst29, 8'H20);  
    _mm_and_si128   a67 (dst30, dst26, dst29);
    _mm_or_si128    a68 (d5, d4, dst1);
        
    _mm_cmpgt_epi8  a69 (dst31, b2, zero_);
    _mm_and_si128   a70 (dst32, dst31, b2);
    _mm_sub_epi8    a71 (dst33, dst32, qe2_);
    _mm_store_si128 a72 (y2[t], dst33);
    _mm_set1_epi8   a73 (dst34, 8'h40);  
    _mm_and_si128   a74 (dst35, dst31, dst34);
    _mm_or_si128    a75 (d6, d5, dst35);
    */
endmodule