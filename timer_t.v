`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:27:06 05/09/2015
// Design Name:   timer
// Module Name:   C:/Users/Kelly/ISE Projects/display/timer_t.v
// Project Name:  display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module timer_t;

    reg flg;

	// Inputs
	reg clk;
	reg rst;
	reg [23:0] tmr_period;

	// Outputs
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	timer uut (
		.flag(flag), 
		.clk(clk), 
		.rst(rst), 
		.tmr_period(tmr_period)
	);

	initial begin
		// Initialize Inputs
        flg = 0;
		clk = 0;
		rst = 0;
		tmr_period = 24'h2;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        rst = 1; #100;
        
        clk = 1; flg = 1; #50;
        clk = 0; flg = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        
        clk = 1; flg = 1; #50;
        clk = 0; flg = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        
        clk = 1; flg = 1; #50;
        clk = 0; flg = 0; #50;
        clk = 1; #50;
        clk = 0; tmr_period = 24'h3; #50;
        clk = 1; #50;
        clk = 0; #50;
        
        clk = 1; flg = 1; #50;
        clk = 0; flg = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        
        clk = 1; flg = 1; #50;
        clk = 0; flg = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        
        clk = 1; flg = 1; #50;
        clk = 0; flg = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
        clk = 1; #50;
        clk = 0; #50;
	end
      
endmodule

