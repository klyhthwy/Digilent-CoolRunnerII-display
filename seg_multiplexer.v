`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:13 05/09/2015 
// Design Name: 
// Module Name:    seg_multiplexer 
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
module seg_multiplexer( digit, clk, enable, A, B, C, D, select );
    
    output  reg [7:0]digit;
    
    input   clk;
    input   enable;
    
    input   [7:0]A;
    input   [7:0]B;
    input   [7:0]C;
    input   [7:0]D;
    
    input   [3:0]select;
    
    always @( posedge clk )
    if( enable )
    begin
        
        case( select )
            4'h1:  digit <= A;
            4'h2:  digit <= B;
            4'h4:  digit <= C;
            4'h8:  digit <= D;
        endcase
        
    end
    else
    begin

        digit <= 8'h00;

    end


endmodule