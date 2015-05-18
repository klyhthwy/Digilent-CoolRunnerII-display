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
    
    reg     run;
    
    wire    dividend_less_than10;
    assign  dividend_less_than10 = (remainder < 14'hA ) ? 1:0;
    
    
    always @( posedge start ) begin
        
        quotient <= 0;
        remainder <= dividend;
        run <= 1;
        
    end
    
    
    always @( posedge clk ) begin
        
        if( run ) begin
            
            quotient <= quotient + 1;
            remainder <= remainder - 14'd10;
            
        end
        
    end
    
    always @( posedge dividend_less_than10  ) begin
        
        done <= 1;
        run <= 0;
        
    end

endmodule
