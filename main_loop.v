`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 08:38:03 PM
// Design Name: 
// Module Name: main_loop
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
module main_loop(r, st, en, st0, en0, y, y2, u);
    
    input  [9:0] r;
    	
    output reg [127:0] y  [125:0];
    output reg [127:0] y2 [125:0];
    output reg [127:0] u  [125:0];
    output reg [15:0]  st;  
	output reg [15:0]  en; 
	output reg [15:0]  st0; 
	output reg [15:0]  en0;
	//output reg t [70:0];
	
	reg [4:0] q          = 5'd4;
	reg [4:0] q2         = 5'd24;
	reg [4:0] e          = 5'd2;
	reg [4:0] e2         = 5'd1;
	reg [4:0] long_thres = 5'd19;
	reg [4:0] long_diff  = -5'd2;
	reg [9:0] i;			
				
	parameter [8:0] tlen_      = 9'd126;
    parameter [8:0] qlen_      = 9'd313;
    parameter [12:0] tlen      = 13'd2007;
    parameter [12:0] qlen      = 13'd5000;
    parameter [5:0] n_col_     = 6'd48;
	parameter [9:0] w          = 10'd751;
	parameter [9:0] wl         = 10'd751;
	parameter [9:0] wr         = 10'd751;
	
	always @(r)
    begin
        if (r > 750) 
            begin
            st = (r-wr+1)>>1;
            en = (r+wl)>>1;
            end
        else
            begin
            st = 16'd0;
            en = r;
            end
		    
		st0 = st;
		en0 = en;
		st  = st / 16 * 16;
		en  = (en + 16) / 16 * 16 - 1; 
		    
		    
	   /*if (en >= r) 
		begin
		  y  [(r/16)][8*(r%16) +: 8] = -q - e; 
		  y2 [(r/16)][8*(r%16) +: 8] = -q2 - e2;
		  u  [(r/16)][8*(r%16) +: 8] = r == 0? -q - e : r < long_thres? -e : r == long_thres? long_diff : -e2;
		end
		 */  
    end
endmodule



















































/*    //input clk;
    parameter [8:0] tlen_      = 9'd126;
    parameter [8:0] qlen_      = 9'd313;
    parameter [12:0] tlen      = 13'd2007;
    parameter [12:0] qlen      = 13'd5000;
    parameter [127:0] zero_    = 128'd0;  
	parameter [4:0] q          = 5'd4;
	parameter [4:0] q2         = 5'd24;
	parameter [4:0] e          = 5'd2;
	parameter [4:0] e2         = 5'd1;
	parameter [4:0] long_thres = 5'd19;
	parameter [4:0] long_diff  = -5'd2;
	parameter [4:0] max_sc     = 5'd2;
	parameter [4:0] min_sc     = -5'd5;
	parameter [5:0] n_col_     = 6'd48;
	parameter [9:0] w          = 10'd751;
	parameter [9:0] wl         = 10'd751;
	parameter [9:0] wr         = 10'd751;
	parameter [1:0] end_bonus  = -2'd1;
	
	reg [9:0] last_st;
	reg [9:0] last_en;
	//reg zdrop;
	reg zdropped;
	//reg [9:0] r; 
	
	reg [127:0] u  [(tlen_)-1:0];
    reg [127:0] v  [(tlen_)-1:0];
    reg [127:0] x  [(tlen_)-1:0];
    reg [127:0] y  [(tlen_)-1:0];
    reg [127:0] x2 [(tlen_)-1:0];
    reg [127:0] y2 [(tlen_)-1:0];
    
    reg [15:0] st;  
	reg [15:0] en; 
	reg [15:0] st0; 
	reg [15:0] en0; 
	reg [15:0] st_; 
	reg [15:0] en_;
	
	reg [7:0] x1;
	reg [7:0] x21;
	reg [7:0] v1;
	
	reg [127:0] x1_;
	reg [127:0] x21_;
	reg [127:0] v1_;

		
	integer i;
	integer r;
	
	initial
	begin
      for(i=0; i<(tlen_); i=i+1)
        begin
            u[i]  = {8{(-q-e)}};
            v[i]  = {8{(-q-e)}};
            x[i]  = {8{(-q-e)}};
            y[i]  = {8{(-q-e)}};
            x2[i] = {8{(-q2-e2)}};
            y2[i] = {8{(-q2-e2)}};
        end
    end
	
	       initial
	           begin
             
		      if (st > 0) 
		      begin
			         if (st - 1 >= last_st && st - 1 <= last_en) 
			         begin
				        x1  = x [((st-1)/16)][8*((st-1)%16) +: 8];
				        x21 = x2[((st-1)/16)][8*((st-1)%16) +: 8]; 
				        v1  = v [((st-1)/16)][8*((st-1)%16) +: 8]; // (r-1,s-1) calculated in the last round
			         end 
			         else
		      	     begin
				        x1  = -q - e;
				        x21 = -q2 - e2;
				        v1  = -q - e;
		      	     end
		      end
		      else
              begin
		              x1  = -q - e;
		              x21 = -q2 - e2;
		              v1  = r == 0? -q - e : r < long_thres? -e : r == long_thres? long_diff : -e2;
		      end
		
        	  if (en >= r) 
		      begin
			     y [(r/16)][8*(r%16) +: 8] = -q - e; 
			     y [(r/16)][8*(r%16) +: 8] = -q2 - e2;
			     u [(r/16)][8*(r%16) +: 8] = r == 0? -q - e : r < long_thres? -e : r == long_thres? long_diff : -e2;
		      end
              
              //r = r + 1'b1;
	          last_st = st;
              last_en = en;
              end
      

*/