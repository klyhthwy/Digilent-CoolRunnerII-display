`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:13 05/20/2015 
// Design Name: 
// Module Name:    bcd4digit_control
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

module bcd4digit_control( load_quotient, load_value, divide,
                          clk, rst, start, done, carry, full );

    parameter   STATE_IDLE = 1, STATE_1 = 2, STATE_2 = 4, STATE_3 = 8;
    parameter   STATE_SIZE = 4;
    
    output  reg load_quotient, load_value, divide;

    input       clk, rst, start, done, carry, full;
    
    reg [STATE_SIZE-1:0]    state, next_state;
    
    
    always @( posedge clk or negedge rst ) begin
        
        if( ~rst ) begin
            state <= STATE_IDLE;
        end
        else            
            state <= next_state;
        
    end
    
    
    always @( state, start, done, carry, full ) begin
        
        case( state )
            
            STATE_IDLE: 
            
                if( start ) begin
                    load_value = 1;
                    next_state = STATE_1;
                end

            STATE_1:    // Load;
            
                if( 1 ) begin
                    load_quotient = 0;
                    load_value = 0;
                    divide = 1;
                    next_state = STATE_2;
                end
            
            STATE_2:    // Divide
            
                if( full ) begin
                    next_state = STATE_IDLE;
                end
                else if( done ) begin
                    load_quotient = 1;
                    divide = 0;
                    next_state = STATE_3;
                end
                else if( carry ) begin
                    load_quotient = 1;
                    divide = 0;
                    next_state = STATE_1;
                end
                
            STATE_3:    // Finish
            
                if( 1 ) begin
                    load_quotient = 0;
                    next_state = STATE_IDLE;
                end
            
        endcase
        
    end

endmodule
