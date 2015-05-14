`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:37:13 05/13/2015 
// Design Name: 
// Module Name:    display_driver 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module display_driver( 
    output  a_l, b_l, c_l, d_l, e_l, f_l, g_l, dp_l, dig1, dig2, dig3, dig4,
    input   clk, rst, en
    );

    reg dp = 0;
    wire a, b, c, d, e, f, g;
    wire d1, d2, d3, d4;
   
    not(a_l, a);
    not(b_l, b);
    not(c_l, c);
    not(d_l, d);
    not(e_l, e);
    not(f_l, f);
    not(g_l, g);
    not(dp_l, dp);
    
    not(dig1, d1);
    not(dig2, d2);
    not(dig3, d3);
    not(dig4, d4);
    
    wire [3:0] digit;
    seven_seg M1(a, b, c, d, e, f, g, digit[3], digit[2], digit[1], digit[0]);
    
    seg_multiplexer M2(digit, clk, en, 4'h1, 4'h3, 4'h5, 4'hF, {d1,d2,d3,d4});
    
    wire [15:0]count;
    wire plse;
    timer #(16) M3(count, plse, clk, rst, 16'h7CF, 16'h3E8);
    
    rotate M4({d1,d2,d3,d4}, plse, rst, en, 1'b1, 4'b1);

endmodule
