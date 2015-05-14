`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:13 05/09/2015 
// Design Name: 
// Module Name:    seven_seg 
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
module seven_seg( output a, b, c, d, e, f, g, input d3, d2, d1, d0 );

    assign a = ~d2 & ~d0 | ~d3 & d1 | ~d3 & d2 & d0 | d3 & ~d2;
    assign b = ~d2 | ~d1 & ~d0 | ~d3 & d1 & d0;
    assign c = ~d1 | ~d3 & d0 | ~d3 & d2;
    assign d = ~d2 & ~d0 | ~d2 & d1 | d1 & ~d0 | d2 & ~d1 & d0;
    assign e = ~d2 & ~d0 | d1 & ~d0;
    assign f = ~d1 & ~d0 | d2 & ~d1 | d2 & ~d0 | d3 & ~d2;
    assign g = ~d2 & d1 | d2 & ~d1 | d2 & ~d0 | d3 & ~d2;

endmodule
