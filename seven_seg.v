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

    assign a = ~d3 & ~d2 & ~d1 & d0 | d2 & ~d1 & ~d0;
    assign b = d2 & ~d1 & d0 | d2 & d1 & ~d0;
    assign c = ~d2 & d1 & ~d0;
    assign d = ~d2 & ~d1 & d0 | d2 & ~d1 & ~d0 | d2 & d1 & d0;
    assign e = d0 | d2 & ~d1;
    assign f = ~d3 & ~d2 & d0 | ~d2 & d1 | d1 & d0;
    assign g = ~d3 & ~d2 & ~d1 | d2 & d1 & d0;

endmodule
