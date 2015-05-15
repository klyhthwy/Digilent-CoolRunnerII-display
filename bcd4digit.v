
module bcd4digit( A, B, C, D, clk, rst, value );

    output  reg [3:0]A;
    output  reg [3:0]B;
    output  reg [3:0]C;
    output  reg [3:0]D;
    
    input   clk;
    input   rst;
    
    input   [13:0]value;
    
    reg [13:0]dividend;
    reg [9:0]quotient;
    
    always @( rst ) begin
        
        A = 4'b0;
        B = 4'b0;
        C = 4'b0;
        D = 4'b0;
        
    end
    
    always @( posedge clk ) begin
        
        while( dividend > 10 ) begin
        
            dividend <= dividend - 10;
            quotient <= quotient + 1;
        
        end
        
    end

endmodule
