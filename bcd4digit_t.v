`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:32:32 05/17/2015
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
    
    always #50 clk = ~clk;
    
//    always #100 begin
//        $display("A: %1d B: %1d C: %1d D: %1d",A,B,C,D);
//        $display("ix:       %4d", uut.M2.ix);
//        $display("quotient: %4d", uut.M2.quotient);
//        $display("dividend: %4d", uut.M2.dividend);
//        $display("carry:    %4d", uut.M2.carry);
//        $display("done:     %4d", uut.M2.done);
//        $display("---Control---");
//        $display("state:         %4d", uut.M1.state);
//        $display("next_state:    %4d", uut.M1.state);
//        $display("divide:        %4d", uut.M1.divide);
//        $display("load_quotient: %4d", uut.M1.load_quotient);
//        $stop;
//    end

    initial begin
        // Initialize Inputs
        clk = 1;
        rst = 0;
        value = 36;
        start = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        rst = 1; start = 1; #100
        start = 0;

    end
      
endmodule

