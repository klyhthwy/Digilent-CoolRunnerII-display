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

    reg     dp = 0;
    wire    a, b, c, d, e, f, g;
    wire    d1, d2, d3, d4;
    wire    [3:0] led;
    
    // Seven segment display is active low.
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
    
    // Seven segment digit logic
    wire [3:0] digit;
    seven_seg M1(a, b, c, d, e, f, g, digit[3], digit[2], digit[1], digit[0]);
    
    // Multiplexer for selected digit
    wire [3:0] A;
    wire [3:0] B;
    wire [3:0] C;
    wire [3:0] D;
    seg_multiplexer M2(digit, clk, en, A, B, C, D, {d1,d2,d3,d4});
    
    // Display desired value of digit A on board LEDs.
    not(led[3], A[3]);
    not(led[2], A[2]);
    not(led[1], A[1]);
    not(led[0], A[0]);
    
    // Timer and rotate for controlling time multiplexing of the digits
    wire plse;
    wire [15:0] nc1;
    timer #(16) M3(nc1, plse, clk, rst, 16'h7CF, 16'h3E8);
    rotate M4({d1,d2,d3,d4}, plse, rst, en, 1'b1, 4'b1);
    
    // 4 digit binary encoding of the desired value to display
    wire [13:0] value;
    bcd4digit M5(A, B, C, D, clk, rst, value);
    
    // Timers for generating desired value that increments every second
    wire incr;
    wire nc2;
    wire [22:0] nc3;
    timer #(14) M6(value, nc2, incr, rst, 14'd9999, 14'd1);
    timer #(23) M7(nc3, incr, clk, rst, 23'd7999999, 23'd4000000);

endmodule
