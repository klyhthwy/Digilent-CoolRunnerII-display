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
    a_l, b_l, c_l, d_l, e_l, f_l, g_l, dp_l, dig1, dig2, dig3, dig4, led,
    clk, rst, en
    );
    
    output  a_l, b_l, c_l, d_l, e_l, f_l, g_l, dp_l, dig1, dig2, dig3, dig4;
    output  [3:0] led;
    input   clk, rst, en;

    reg     dp = 0;
    wire    a, b, c, d, e, f, g;
    wire    d1, d2, d3, d4;
    
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
    wire [13:0] value;
    not(led[3], value[3]);
    not(led[2], value[2]);
    not(led[1], value[1]);
    not(led[0], value[0]);
    
    // Timer and rotate for controlling time multiplexing of the digits
    wire plse;
    wire [15:0] nc1;
    timer #(16) M3(nc1, plse, clk, rst, 16'h7CF, 16'h3E8);
    rotate M4({d1,d2,d3,d4}, plse, rst, en, 1'b1, 4'b1);
    
    // 4 digit binary encoding of the desired value to display
    bcd4digit M5(rdy, A, B, C, D, clk, rst, value, incr);
    
    // Timers for generating desired value that increments every second
    wire [19:0] nc2;
    timer #(20) M6(nc2, incr, clk, rst, 20'd799999, 20'd1);
    timer #(14) M7(value, tick, incr, rst, 14'd9999, 14'd1);
//    timer #(4) M8(B, tick1, tick, rst, 4'd9, 4'd1);
//    timer #(4) M9(C, tick2, tick1, rst, 4'd9, 4'd1);
//    timer #(4) M10(D, tick3, tick2, rst, 4'd9, 4'd1);

endmodule
