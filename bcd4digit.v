`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:37:13 05/13/2015 
// Design Name: 
// Module Name:    bcd4digit 
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

module bcd4digit( ready, A, B, C, D, clk, rst, value );

    output          ready;
    output  [3:0]   A;
    output  [3:0]   B;
    output  [3:0]   C;
    output  [3:0]   D;
    
    input   clk;
    input   rst;
    input   [13:0]  value;
    
    
    

endmodule
