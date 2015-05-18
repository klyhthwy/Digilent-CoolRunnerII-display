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

	// Outputs
	wire [3:0] A;
	wire [3:0] B;
	wire [3:0] C;
	wire [3:0] D;

	// Instantiate the Unit Under Test (UUT)
	bcd4digit uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.clk(clk), 
		.rst(rst), 
		.value(value)
	);
    
    always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 0;
		value = 351;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        rst = 1; #4000;
        value = 10230;

	end
      
endmodule

