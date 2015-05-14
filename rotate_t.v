`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:07:58 05/14/2015
// Design Name:   rotate
// Module Name:   C:/Users/Kelly/ISE Projects/Digilent-CoolRunnerII-display/rotate_t.v
// Project Name:  Digilent-CoolRunnerII-display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rotate
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rotate_t;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	reg direction;
	reg [3:0] load;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	rotate uut (
		.out(out), 
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.direction(direction), 
		.load(load)
	);
    
    always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 0;
		en = 0;
		direction = 0;
		load = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        rst = 1; #100;
        en = 1; #500;
        direction = 1; #500;

	end
      
endmodule

