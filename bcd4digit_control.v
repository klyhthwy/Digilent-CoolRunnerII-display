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

module bcd4digit_control( ready, load_quotient, load_value, divide,
                          clk, rst, done, carry, value );

    parameter   STATE_IDLE = 0, STATE_1 = 1, STATE_2 = 2, STATE_3 = 3;
    parameter   STATE_SIZE = 2;

    output      ready;
    output  reg load_quotient, load_value, divide;

    input       clk, rst, done, carry;
    
    reg [STATE_SIZE-1:0]    state, next_state;
    
    
    always @( posedge clk or negedge rst ) begin
        
        if( ~rst )
            state <= STATE_IDLE;
        else            
            state <= next_state;
        
    end
    
    
    always @( state, value, done, carry ) begin
        
        case( state )
            
            STATE_IDLE: ;
            
            STATE_1:    ;
            
            STATE_2:    ;
            
            STATE_3:    ;
            
        endcase
        
    end

endmodule
