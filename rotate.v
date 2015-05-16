`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:01:24 05/14/2015 
// Design Name: 
// Module Name:    rotate 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    size-bit rotate (circular shift)
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rotate #(parameter size = 4)(
    output  reg[size-1:0] out,
    input   clk,
    input   rst,
    input   en,
    input   direction,
    input   [size-1:0] load
    );

    always @( posedge clk or negedge rst )
    begin
        
        if( rst == 0 )
            out <= load;
        else if( en )
        begin
        
            if( direction )
                out <= {out[size-2:0],out[size-1]};
            else
                out <= {out[0],out[size-1:1]};
        
        end
        
    end

endmodule
