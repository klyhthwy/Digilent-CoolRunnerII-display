`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:     12:37:19 05/29/2015 
// Design Name: 
// Module Name:     divide10_t 
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

module divide10_t();

    // Inputs
    reg clk;
    reg rst;
    reg [13:0] value;
    reg start;
    
    // Outputs
    wire [9:0] quotient;
    wire [3:0] remainder;
    wire ready;
    
    // Instantiate the Unit Under Test (UUT)
    divide10 uut (
        .quotient(quotient),
        .remainder(remainder),
        .ready(ready),
        .clk(clk), 
        .rst(rst),
        .start(start),
        .value(value)
    );
    
    always #50 
        clk = ~clk;
    
    always #100 begin
        $display("%14b %4d %14b %10b %3d   %1b   %1b     %1b", 
            uut.dividend, uut.dividend, uut.divisor, quotient, quotient, uut.run, uut.fit, ready);
    end
    
    always @( posedge ready ) begin
        #200;
        $finish;
    end

    initial begin
        
        $display("\n           dividend        divisor       quotient run fit ready");
        
        // Initialize Inputs
        clk = 1;
        rst = 0;
        value = 1024;
        start = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        rst = 1;
        start = 1; #100;
        start = 0; #1100;

    end
    
    
endmodule