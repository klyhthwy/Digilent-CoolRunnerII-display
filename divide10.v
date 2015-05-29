`timescale 1ns / 1ps


module divide10( quotient, remainder, ready, clk, rst, start, value );

    output  reg [9:0]   quotient;
    output      [3:0]   remainder;
    output              ready;
    
    input               clk, rst, start;
    input   [13:0]      value;
    
    reg         run;
    reg [13:0]  dividend;
    reg [13:0]  divisor;
    
    
    assign ready = dividend < 14'b1010;
    assign fit   = dividend >= divisor;
    
    
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
