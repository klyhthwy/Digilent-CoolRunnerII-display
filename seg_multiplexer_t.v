`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:13 05/09/2015 
// Design Name: 
// Module Name:    seg_multiplexer_t
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
module seg_multiplexer_t;

    reg     clk;
    reg     enable;
    
    reg     [7:0]A;
    reg     [7:0]B;
    reg     [7:0]C;
    reg     [7:0]D;
    
    reg     [3:0]select;
    
    wire    [7:0]digit;
    
    seg_multiplexer uut(
        .digit(digit),
        .clk(clk),
        .enable(enable),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .select(select)
    );
    
    always #50 begin
        clk = ~clk;
    end
    
    initial begin
    
        clk = 1;
        enable = 1;

        A = 8'b10010110;    // 4
        B = 8'b10110000;    // 3
        C = 8'b10100100;    // 2
        D = 8'b11110110;    // 1
        
        select = 4'h1;

        #101;
        select = 4'h2; #200;
        select = 4'h4; #200;
        select = 4'h8; #200;
        enable = 0; #200;
        
    end

endmodule