`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:52:50 05/17/2015 
// Design Name: 
// Module Name:    divide10 
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
module divide10( quotient, remainder, done, clk, start, dividend );

    output  reg [9:0]   quotient;
    output  reg [13:0]  remainder;
    output  reg         done;
    
    input   clk;
    input   start;
    input   [13:0]dividend;
    
    wire    dividend_less_than10;
    assign  dividend_less_than10 = (remainder < 14'hA ) ? 1:0;
    
    
    always @( posedge clk or posedge start ) begin
    
        if( !done ) begin
            
            remainder <= dividend - 14'd10;
            quotient <= quotient + 1;
            
        end
        else begin

            quotient <= 0;
            done <= 0;
            
        end
    end
    
    always @( posedge dividend_less_than10  ) done <= 1;

endmodule
