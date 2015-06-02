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

    parameter   S_IDLE      = 2'b00,
                S_LOAD_V    = 2'b01,
                S_DIVIDE    = 2'b11,
                S_LOAD_Q    = 2'b10;

    output          ready;
    output  [3:0]   A;
    output  [3:0]   B;
    output  [3:0]   C;
    output  [3:0]   D;
    
    input           clk;
    input           rst;
    input   [13:0]  value;
    input           start;
    
    reg     [1:0]   state;
    reg     [3:0]   digits [0:3];
    reg     [1:0]   dig_sel;
    reg             start_div;
    reg     [13:0]  div_value;
    
    wire    [9:0]   quotient;
    wire    [3:0]   remainder;
    wire            div_ready;
    
    // Module ready
    assign ready = state == S_IDLE;

    // Outputs
    assign A = digits[0];
    assign B = digits[1];
    assign C = digits[2];
    assign D = digits[3];
    
    // Multiplexer for division value
    assign div_value = ~state[1] ? value : {4'h0, quotient};
    
    // Division unit
    divide10 M1(quotient, remainder, div_ready, clk, rst, start_div, div_value);
    
    // Done...
    assign done = quotient < 10'hA;
    
    
    always @( posedge clk or negedge rst ) begin
    
    
        if( ~rst ) begin
            state <= S_IDLE;
            digits[0] <= 4'hF;
            digits[1] <= 4'hF;
            digits[2] <= 4'hF;
            digits[3] <= 4'hF;
            dig_sel <= 0;
            start_div <= 0;
            div_value <= 0;
        end
        else begin
        
            div_value <= ~state[1] ? value : {4'h0, quotient};
        
            case( state )
            
                S_IDLE:
                
                    if( start ) begin
                        state <= S_LOAD_V;
                        start_div <= 1;
                    end
                
                S_LOAD_V:
                
                    if( 1 ) begin
                        state <= S_DIVIDE;
                        start_div <= 0;
                    end
                
                S_LOAD_Q:
                
                    if( 1 ) begin
                        state <= S_DIVIDE;
                        start_div <= 0;
                    end
                
                S_DIVIDE:
                    
                    if( div_ready ) begin
                        
                        digits[dig_sel] <= remainder;
                        dig_sel <= dig_sel + 1;
                        
                        if( done ) begin
                            state <= S_IDLE;
                        end
                        else begin
                            state <= S_LOAD_Q;
                            start_div <= 1;
                        end
                    end
            
            endcase
        end
    
    end

endmodule
