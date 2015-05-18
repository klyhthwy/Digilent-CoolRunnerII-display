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

module bcd4digit( A, B, C, D, clk, rst, value );

    output  reg [3:0] A;
    output  reg [3:0] B;
    output  reg [3:0] C;
    output  reg [3:0] D;
    
    input   clk;
    input   rst;
    input   [13:0]  value;
    
    reg         done;
    reg         start_divide;
    reg [3:0]   digits [0:3];
    reg [1:0]   digit_count;
    reg [13:0]  dividend;
    
    wire    [9:0]   quotient;
    wire    [13:0]  remainder;
    wire    divide_done;
    divide10 M1(quotient, remainder, divide_done, clk, start_divide, dividend);
    
    wire    quotient_less_than10;
    assign  quotient_less_than10 = (quotient < 10'hA ) ? 1:0;
    
    always @( posedge clk or negedge rst ) begin
        
        if( ~rst ) begin
            A <= 4'hF;
            B <= 4'hF;
            C <= 4'hF;
            D <= 4'hF;
        end
        else begin
            if( divide_done && !done ) begin
                if( start_divide ) begin
                
                    start_divide <= 0;
                    digits[digit_count] <= remainder[3:0];
                    digit_count <= digit_count + 1;
                    dividend <= quotient;
                    
                end
                else begin
                    
                    if( quotient_less_than10 ) begin
                        digits[digit_count] <= quotient[3:0];
                        done <= 1;
                    end
                    else begin
                        start_divide <= 1;
                    end
                
                end
            end
        end
    end
    
    always @( value ) begin
        
        done <= 0;
        start_divide <= 1;
        digits[0] <= 4'hF;
        digits[1] <= 4'hF;
        digits[2] <= 4'hF;
        digits[3] <= 4'hF;
        digit_count <= 0;
        dividend <= value;
    
    end
    
    always @( posedge done ) begin
    
        A <= digits[0];
        B <= digits[1];
        C <= digits[2];
        D <= digits[3];
    
    end

endmodule
