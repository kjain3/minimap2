`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 08:41:17 AM
// Design Name: 
// Module Name: vector_op_tb
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


module vector_op_tb;
    
     reg [127:0] a;
     //reg [7:0] t;
     reg [7:0] imm;
     reg [127:0] dst0;
     reg [127:0] dst1;   
     
     _mm_srli_si128 UUT0 (.dst(dst0), .a(a), .imm(imm));  
     _mm_slli_si128 UUT1 (.dst(dst1), .a(a), .imm(imm));
     
     initial a   = 128'hfafafafafafafafafafafafafafafafa;
     initial imm = 8'd15;
     //initial dst[4] = 128'hFFFFFFFFFFFFF00FFFFFFFF00000AA00;
     //                     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 
     /*initial
     begin
            
            t = 8'd54;
            #1000
            t = 8'd65;
      end
     
       
      assign  s =  dst [(t/16)][8*(t%16) +: 8];
     */
endmodule
