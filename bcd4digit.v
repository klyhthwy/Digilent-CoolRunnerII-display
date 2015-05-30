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

module bcd4digit( ready, A, B, C, D, clk, rst, value, start );

    output  reg     ready;
    output  [3:0]   A;
    output  [3:0]   B;
    output  [3:0]   C;
    output  [3:0]   D;
    
    input           clk;
    input           rst;
    input   [13:0]  value;
    input           start;
    
    reg     [3:0]   digits [0:3];
    reg     [1:0]   dig_sel;
    reg             start_div, load_value;
    
    wire    [9:0]   quotient;
    wire    [3:0]   remainder;
    wire    [13:0]  div_value;
    wire            div_ready;
    
    assign A = digits[0];
    assign B = digits[1];
    assign C = digits[2];
    assign D = digits[3];
    
    // Multiplexer for division value
    assign div_value = load_value ? value : {4'h0, quotient};
    
    // Done encoding
    assign done = 0; //div_ready && (quotient < 4'hA);
    
    // Division unit
    divide10 M1(quotient, remainder, div_ready, clk, rst, start_div, div_value);
    
    
    always @( posedge clk or negedge rst or posedge start ) begin
    
        if( ~rst ) begin
            ready <= 0;
            digits[0] <= 4'hF;
            digits[1] <= 4'hF;
            digits[2] <= 4'hF;
            digits[3] <= 4'hF;
            dig_sel <= 0;
            start_div <= 0;
            load_value <= 0;
        end
        else if( start ) begin
            ready <= 0;
            digits[0] <= 4'hF;
            digits[1] <= 4'hF;
            digits[2] <= 4'hF;
            digits[3] <= 4'hF;
            dig_sel <= 0;
            start_div <= 1;
            load_value <= 1;
        end
        else if( div_ready ) begin
            digits[dig_sel] <= remainder;
            dig_sel <= dig_sel + 1;
            if( done )  ready <= 1;
            else        start_div <= 1;
        end
        else begin
            start_div <= 0;
            load_value <= 0;
        end
    
    end

endmodule
