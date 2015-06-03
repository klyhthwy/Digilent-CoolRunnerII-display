`timescale 1ns / 100ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:19:51 05/14/2015
// Design Name:   display_driver
// Module Name:   C:/Users/Kelly/ISE Projects/Digilent-CoolRunnerII-display/display_driver_t.v
// Project Name:  Digilent-CoolRunnerII-display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display_driver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module display_driver_t;

	// Inputs
	reg clk;
	reg rst;
	reg en;

	// Outputs
	wire a_l;
	wire b_l;
	wire c_l;
	wire d_l;
	wire e_l;
	wire f_l;
	wire g_l;
	wire dp_l;
	wire dig1;
	wire dig2;
	wire dig3;
	wire dig4;

	// Instantiate the Unit Under Test (UUT)
	display_driver uut (
		.a_l(a_l), 
		.b_l(b_l), 
		.c_l(c_l), 
		.d_l(d_l), 
		.e_l(e_l), 
		.f_l(f_l), 
		.g_l(g_l), 
		.dp_l(dp_l), 
		.dig1(dig1), 
		.dig2(dig2), 
		.dig3(dig3), 
		.dig4(dig4), 
		.clk(clk), 
		.rst(rst), 
		.en(en)
	);
    
    always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 0;
		en = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        rst = 1; #100;
        en = 1; #200;

	end
      
endmodule

