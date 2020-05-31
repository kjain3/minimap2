`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:40:13 AM
// Design Name: 
// Module Name: loop_fission_tb
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


module loop_fission_tb();
    
reg [7:0] sf [999:0];
reg [7:0] qr [1015:0];

reg [127:0] m1_;
reg [127:0] sc_mis_;
reg [127:0] sc_mch_;
reg [127:0] sc_N_;
reg [7:0] t;    
reg [11:0] r;
wire [127:0] s [125:0];

reg clk;
wire [127:0] sq;
wire [127:0] st; 


initial $readmemh("sf.txt",sf);
initial $readmemh("qr.txt",qr);


initial
    begin
        sc_mis_ = 128'HFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC;
        sc_mch_ = 128'H02020202020202020202020202020202;
        sc_N_   = 128'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        m1_     = 128'H04040404040404040404040404040404;
        t       = 8'd0;
        r       = 12'd0;
        clk     = 1'b0;   
        
    end
    
loop_fission UUT0 (.r(r), .t(t), .sf(sf), .qr(qr), .m1_(m1_), .sc_mis_(sc_mis_), .sc_mch_(sc_mch_), .sc_N_(sc_N_), .s(s));

always
    begin
    #10 clk = ~clk;
    end
    
always@(posedge clk)
begin    
    if (r < 12'd10)
    begin
        r = r + 1;
        $display("s[0] = %x\n", s[0]);
    end 
    end


/*  

always@(posedge clk)
    begin
    for(int i=0; i < 5; i = i + 1)
    begin
        for(int i=st0[r]; i < en0[r]; i = i + 16)
        begin
            t = i;
        end
        r = r+1;
    end
    end
*/    
endmodule
