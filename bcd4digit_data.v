`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:52:50 05/17/2015 
// Design Name: 
// Module Name:    bcd4digit_data 
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

module bcd4digit_data( A, B, C, D, done, carry, 
                       clk, rst, load_quotient, load_value, divide, value );

    output      [3:0]   A, B, C, D;
    output  reg [9:0]   quotient;
    output      [13:0]  remainder;
    output              done;
    output              carry;
    
    input           clk, rst;
    input           load_quotient;
    input           load_value;
    input           divide;
    input   [13:0]  value;
    
    
    reg     [3:0]   digits [0:3];
    reg     [13:0]  dividend;
    reg     [2:0]   ix;
    
    
    assign A = digits[0];
    assign B = digits[1];
    assign C = digits[2];
    assign D = digits[3];
    
    assign remainder = dividend;
    
    wire    [13:0]  difference;
    
    assign {carry, difference} = dividend + 14'h3FF6;
    assign done = carry && (quotient == 10'b0) || ix[2];
    
    
    always @( posedge clk or negedge rst ) begin
        
        if( ~rst ) begin
            
            digits[0] <= 4'hF;
            digits[1] <= 4'hF;
            digits[2] <= 4'hF;
            digits[3] <= 4'hF;
            quotient <= 0;
            dividend <= 0;
            ix <= 0;
            
        end
        else if( load_value ) begin
            
            quotient <= 0;
            dividend <= value;
            ix <= 0;
            
        end
        else if( load_quotient ) begin
            
            quotient <= 0;
            dividend <= quotient;
            digits[ix] <= dividend;
            ix <= ix + 1;
            
        end
        else if( divide ) begin
            
            quotient <= quotient + 1;
            dividend <= difference;
            
        end
        
    end
    

endmodule
