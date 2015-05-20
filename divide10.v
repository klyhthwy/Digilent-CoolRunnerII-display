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

module divide10( quotient, remainder, done, carry, 
                 clk, rst, load_quotient, load_value, value );

    output  reg [9:0]   quotient;
    output      [13:0]  remainder;
    output              done;
    output              carry;
    
    input           clk, rst;
    input           load_quotient;
    input           load_value;
    input   [13:0]  value;
    
    
    reg     [13:0]  dividend;
    
    assign remainder = dividend;
    
    wire    [13:0]  difference;
    
    assign {carry, difference} = dividend + 14'h3FF6;
    
    
    always @( posedge clk or negedge rst ) begin
        
        if( ~rst ) begin
            
            quotient <= 0;
            dividend <= 0;
            
        end
        else if( load_value ) begin
            
            quotient <= 0;
            dividend <= value;
            
        end
        else if( load_quotient ) begin
            
            quotient <= 0;
            dividend <= quotient;
            
        end
        else begin
            
            quotient <= quotient + 1;
            dividend <= difference;
            
        end
        
    end
    

endmodule
