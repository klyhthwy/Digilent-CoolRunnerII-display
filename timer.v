`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:     12:37:19 05/08/2015 
// Design Name: 
// Module Name:     timer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:     Default 24-bit timer
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module timer #(parameter size = 24)( tmr_count, flag, clk, rst, tmr_period, tmr_compare );

    output  reg [size-1:0]tmr_count;
    output  flag;
    
    input   clk, rst;
    input   [size-1:0]tmr_period;
    input   [size-1:0]tmr_compare;
    
    reg     [size-1:0]tmr_load;
    reg     [size-1:0]tmr_cmp;

    always@( posedge clk or negedge rst )
    begin
        if( rst == 0 )
        begin
            tmr_count <= 0;
            tmr_load  <= 0;
            tmr_cmp   <= 0;
        end
        else
        begin
            if( tmr_count == tmr_load )
            begin
                tmr_count <= 0;
                tmr_load  <= tmr_period;
                tmr_cmp   <= tmr_compare;
            end
            else
            begin
                tmr_count <= tmr_count + 1;
            end
        end
    end
    
    assign flag = tmr_cmp > tmr_count;

endmodule
