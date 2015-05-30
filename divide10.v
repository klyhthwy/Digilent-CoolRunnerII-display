`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:     12:37:19 05/29/2015 
// Design Name: 
// Module Name:     divide10 
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

module divide10( quotient, remainder, ready, clk, rst, start, value );

    output  reg [9:0]   quotient;
    output      [3:0]   remainder;
    output              ready;
    
    input               clk, rst, start;
    input   [13:0]      value;
    
    reg         run;
    reg [13:0]  dividend;
    reg [13:0]  divisor;
    
    
    assign ready = dividend < 4'b1010;
    assign fit   = dividend >= divisor;
    
    assign remainder = dividend[3:0];
    
    
    always @( posedge clk or negedge rst or posedge start ) begin
        
        if( ~rst ) begin
            quotient <= 0;
            run <= 0;
            dividend <= 0;
            divisor <= 0;
        end
        else if( start ) begin
            quotient <= 0;
            run <= 1;
            dividend <= value;
            divisor <= 14'h2800;
        end
        else if( ready ) begin
            run <= 0;
        end
        else if( run ) begin
            quotient <= {quotient[8:0], fit};
            if( fit ) dividend <= dividend - divisor;
            divisor <= divisor >> 1;
        end
        
    end
    
endmodule
