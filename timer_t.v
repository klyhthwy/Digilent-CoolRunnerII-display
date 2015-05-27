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

    // Inputs
	reg clk;
	reg rst;
	reg [23:0] tmr_period;
    reg [23:0] tmr_compare;

	// Outputs
    wire [23:0] tmr_count;
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	timer uut (
        .tmr_count(tmr_count),
		.flag(flag), 
		.clk(clk), 
		.rst(rst), 
		.tmr_period(tmr_period),
        .tmr_compare(tmr_compare)
	);
    
    always #50 clk = ~clk;
    
    always #100 begin
        $display("tmr_count");
        $display(flag);
        $stop;
    end

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 0;
		tmr_period = 24'h7;
        tmr_compare = 24'h4;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        rst = 1; #1000;
        tmr_compare = 24'h1; #1000;
        tmr_compare = 24'h0; #1000;
        tmr_compare = 24'h8; #1000;
        tmr_compare = 24'h7; #1000;
        
	end
      
endmodule

