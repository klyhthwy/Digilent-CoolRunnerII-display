`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:17:25 05/18/2015
// Design Name:   divide10
// Module Name:   C:/Users/Kelly/ISE Projects/Digilent-CoolRunnerII-display/divide10_t.v
// Project Name:  Digilent-CoolRunnerII-display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divide10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divide10_t;

	// Inputs
	reg clk;
	reg start;
	reg [13:0] dividend;

	// Outputs
	wire [9:0] quotient;
	wire [13:0] remainder;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	divide10 uut (
		.quotient(quotient), 
		.remainder(remainder), 
		.done(done), 
		.clk(clk), 
		.start(start), 
		.dividend(dividend)
	);
    
    always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		start = 0;
		dividend = 351;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        start = 1;

	end
      
endmodule

