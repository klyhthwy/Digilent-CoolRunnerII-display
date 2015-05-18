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

    output  reg[3:0] A;
    output  reg[3:0] B;
    output  reg[3:0] C;
    output  reg[3:0] D;
    
    input   clk;
    input   rst;
    
    input   [13:0]  value;
    
    reg         run_, done;
    reg [3:0]   digits [0:3];
    reg [2:0]   digit_count;
    reg [13:0]  dividend;
    reg [9:0]   quotient;
    
    wire    dividend_less_than10, quotient_less_than10;
    assign  dividend_less_than10 = (dividend < 14'hA ) ? 1:0;
    assign  quotient_less_than10 = (quotient < 10'hA ) ? 1:0;
    
    wire stop;
    and(stop, dividend_less_than10, quotient_less_than10);
    
    wire run, stop_l;
    not(stop_l, digit_count[2]);
    and(run, run_, stop_l);
    
    always @( negedge rst ) begin
        
        A <= 4'hF;
        B <= 4'hF;
        C <= 4'hF;
        D <= 4'hF;
        
        digits[0] <= 4'hF;
        digits[1] <= 4'hF;
        digits[2] <= 4'hF;
        digits[3] <= 4'hF;
        
        run_ <= 1;
        digit_count <= 0;
        dividend <= value;
        quotient <= 0;
        done <= 0;
        
    end
    
    always @( value ) begin
        
        digits[0] <= 4'hF;
        digits[1] <= 4'hF;
        digits[2] <= 4'hF;
        digits[3] <= 4'hF;
    
        run_ <= 1;
        digit_count <= 0;
        dividend <= value;
        quotient <= 0;
        done <= 0;
    
    end
    
    always @( posedge clk ) begin
        if( run ) begin
            
            if( !stop ) begin
                dividend <= dividend - 14'd10;
                quotient <= quotient + 1;
            end
            else begin
                digits[digit_count] <= dividend;
                done <= 1;
            end
    
        end
        else
            done <= 1;
    end
    
    always @( posedge dividend_less_than10 ) begin

        digits[digit_count] <= dividend;
        dividend <= quotient;
        quotient <= 0;
        digit_count <= digit_count + 1;
        
    end
    
    always @( posedge done ) begin
    
        A <= digits[0];
        B <= digits[1];
        C <= digits[2];
        D <= digits[3];
    
    end

endmodule
