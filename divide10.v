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
    
    reg     [13:0]  dividend;
    reg     [13:0]  divisor;
    reg             run;
    
    
    assign ready = divisor[0];
    assign fit   = dividend >= divisor;
    
    assign remainder = dividend[3:0];
    
    
    always @( posedge clk or negedge rst or posedge start ) begin
        
        if( ~rst ) begin
            quotient <= 0;
            dividend <= 0;
            divisor <= 0;
            run <= 0;
        end
        else if( run ) begin
            if( ~ready ) begin
                quotient <= {quotient[8:0], fit};
                divisor <= divisor >> 1;
                if( fit ) begin
                    dividend <= dividend - divisor;
                end
            end
            else begin
                run <= 0;
            end
        end
        else if( start ) begin
            quotient <= 0;
            dividend <= value;
            divisor <= 14'h2800;
            run <= 1;
        end
        
    end
    
endmodule
