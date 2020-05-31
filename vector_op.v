`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2019 03:43:03 PM
// Design Name: 
// Module Name: vector_op
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

module _mm_add_epi8(dst, a, b);

input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = a[(j*8)+7:(j*8)] + b[(j*8)+7:(j*8)];
        end
endgenerate 
endmodule

module _mm_add_epi32(dst, a, b);

input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 4; j = j + 1)
        begin
            assign dst[(j*32)+31:(j*32)] = a[(j*32)+31:(j*32)] + b[(j*32)+31:(j*32)];
        end
endgenerate 
endmodule

module _mm_sub_epi8(dst, a, b);
             
input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = a[(j*8)+7:(j*8)] - b[(j*8)+7:(j*8)];
        end
endgenerate 
endmodule

module _mm_or_si128(dst, a, b);
             
input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

assign dst = a | b;
endmodule

module _mm_andnot_si128(dst, a, b);
input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

assign dst = (!a) & b;
endmodule

module _mm_and_si128(dst, a, b);
input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

assign dst = a & b;
endmodule

module _mm_srli_si128(dst, a, imm);
input  [127:0] a;
input  [7:0] imm;
output [127:0] dst;

assign dst = (imm <= 8'd15) ? (a >> (imm * 8)) : (a >> (16*8)) ;
endmodule

module _mm_slli_si128(dst, a, imm);
input  [127:0] a;
input  [7:0] imm;
output [127:0] dst;

assign dst = (imm <= 8'd15) ? (a << (imm*8)) : (a << (16*8)) ;
endmodule

module _mm_set1_epi8(dst, a);
             
input  [7:0] a;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = a;
        end
endgenerate 
endmodule

module _mm_set1_epi32(dst, a);
             
input  [7:0] a;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 4; j = j + 1)
        begin
            assign dst[(j*32)+31:(j*32)] = a;
        end
endgenerate 
endmodule

module _mm_setr_epi32(dst, a, b, c, d);
             
input  [31:0] a;
input  [31:0] b;
input  [31:0] c;
input  [31:0] d;
output [127:0] dst;

assign dst[31:0]   = a;
assign dst[63:32]  = b;
assign dst[95:64]  = c;
assign dst[127:96] = d;
endmodule

module _mm_cmpeq_epi8(dst, a, b);
input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = (a[(j*8)+7:(j*8)] == b[(j*8)+7:(j*8)]) ? 8'hFF : 8'd0;   
        end
endgenerate 
endmodule

module _mm_cmplt_epi8(dst, a, b);
input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = (a[(j*8)+7:(j*8)] < b[(j*8)+7:(j*8)]) ? 8'hFF : 8'd0;
        end
endgenerate 
endmodule

module _mm_cmpgt_epi8(dst, a, b);
input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = (a[(j*8)+7:(j*8)] > b[(j*8)+7:(j*8)]) ? 8'hFF : 8'h00;
        end
endgenerate 
endmodule

module _mm_cmpgt_ep32(dst, a, b);
input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 4; j = j + 1)
        begin
            assign dst[(j*32)+31:(32*8)] = (a[(j*32)+31:(j*32)] > b[(j*32)+31:(j*32)]) ? 32'hFFFFFFFF : 32'h00000000;
        end
endgenerate 
endmodule

module _mm_blendv_epi8(dst, a, b, mask);
input  [127:0] a;
input  [127:0] b;
input  [127:0] mask;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = mask[(j*8)+7] ? b[(j*8)+7:(j*8)] : a[(j*8)+7:(j*8)];
        end
endgenerate 
endmodule

module _mm_min_epi8(dst, a, b);

input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = a[(j*8)+7:(j*8)] < b[(j*8)+7:(j*8)] ? a[(j*8)+7:(j*8)] : b[(j*8)+7:(j*8)];
        end
endgenerate 
endmodule

module _mm_max_epi8(dst, a, b);

input  [127:0] a;
input  [127:0] b;
output [127:0] dst;

genvar j;
generate
        for(j = 0; j < 16; j = j + 1)
        begin
            assign dst[(j*8)+7:(j*8)] = a[(j*8)+7:(j*8)] > b[(j*8)+7:(j*8)] ? a[(j*8)+7:(j*8)] : b[(j*8)+7:(j*8)];
        end
endgenerate 
endmodule

module _mm_mcvtsi32_si128(dst, a);

input  [31:0] a;
output [127:0] dst;

assign dst [31:0] = a;
assign dst [127:32] = 0;
endmodule

module _mm_load_si128(dst, a, t);
input  [127:0] a [125:0];
output [127:0] dst;
input [9:0] t;

assign dst = a[t];
endmodule

module _mm_loadu_si8(dst, a);
input  [7:0] a [15:0];
output [127:0] dst;

assign dst [127:120] = a[15];
assign dst [119:112] = a[14];
assign dst [111:104] = a[13];
assign dst [103:96]  = a[12];
assign dst [95:88]   = a[11];
assign dst [87:80]   = a[10];
assign dst [79:72]   = a[9];
assign dst [71:64]   = a[8];
assign dst [63:56]   = a[7];
assign dst [55:48]   = a[6];
assign dst [47:40]   = a[5];
assign dst [39:32]   = a[4];
assign dst [31:24]   = a[3];
assign dst [23:16]   = a[2];
assign dst [15:8]    = a[1];
assign dst [7:0]     = a[0];

endmodule

module _mm_storeu_si128(dst, a, t);
input  [127:0] a;
output reg [127:0] dst [125 : 0];
input [7:0] t;
//reg [127:0] c;

    always@(*)
        dst[t] = a;

endmodule

module _mm_storeu_8(dst, a, t);
input  [127:0] a;
output reg [127:0] dst [125 : 0];
input [7:0] t;
//reg [127:0] c;

    always@(*)
        dst[t] = a;



endmodule
