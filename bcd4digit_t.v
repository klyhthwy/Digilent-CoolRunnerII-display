`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:44:23 05/29/2015
// Design Name:   bcd4digit
// Module Name:   C:/Users/Kelly/ISE Projects/Digilent-CoolRunnerII-display/bcd4digit_t.v
// Project Name:  Digilent-CoolRunnerII-display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd4digit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcd4digit_t;

    // Inputs
    reg clk;
    reg rst;
    reg [13:0] value;
    reg start;
    
    // Outputs
    wire ready;
    wire [3:0] A;
    wire [3:0] B;
    wire [3:0] C;
    wire [3:0] D;
    
    // Instantiate the Unit Under Test (UUT)
    bcd4digit uut (
        .ready(ready), 
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D), 
        .clk(clk), 
        .rst(rst), 
        .value(value), 
        .start(start)
    );
    
    always #50 
        clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 1;
        rst = 0;
        value = 4934;
        start = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        rst = 1;
        start = 1; #100;
        start = 0;
        
    end
      
endmodule

