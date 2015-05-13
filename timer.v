`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:19 05/08/2015 
// Design Name: 
// Module Name:    timer 
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
module timer( flag, clk, rst, tmr_period );

    output  reg flag;
    
    input   clk, rst;
    input   [23:0]tmr_period;
    
    reg     [23:0]tmr_count;
    reg     [23:0]tmr_load;

    always@( posedge clk, negedge rst )
    begin
        if( rst == 0 )
        begin
            tmr_count <= 0;
            tmr_load  <= 0;
            flag = 0;
        end
        else
        begin
            if( tmr_count == 0 )
            begin
                tmr_count <= tmr_load;
                tmr_load  <= tmr_period;
                flag = 1;
            end
            else
            begin
                tmr_count <= tmr_count - 1;
                flag = 0;
            end
        end
    end

endmodule
