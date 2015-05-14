`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:02:03 05/14/2015
// Design Name:   seven_seg
// Module Name:   C:/Users/Kelly/ISE Projects/Digilent-CoolRunnerII-display/seven_seg_t.v
// Project Name:  Digilent-CoolRunnerII-display
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_seg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_seg_t;

	// Inputs
	reg d3;
	reg d2;
	reg d1;
	reg d0;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;

	// Instantiate the Unit Under Test (UUT)
	seven_seg uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.d3(d3), 
		.d2(d2), 
		.d1(d1), 
		.d0(d0)
	);

	initial begin
        
		// Add stimulus here
        {d3,d2,d1,d0} = 4'b0000; #100;
        {d3,d2,d1,d0} = 4'b0001; #100;
        {d3,d2,d1,d0} = 4'b0010; #100;
        {d3,d2,d1,d0} = 4'b0011; #100;
        {d3,d2,d1,d0} = 4'b0100; #100;
        {d3,d2,d1,d0} = 4'b0101; #100;
        {d3,d2,d1,d0} = 4'b0110; #100;
        {d3,d2,d1,d0} = 4'b0111; #100;
        {d3,d2,d1,d0} = 4'b1000; #100;
        {d3,d2,d1,d0} = 4'b1001; #100;
        {d3,d2,d1,d0} = 4'b1010; #100;
        {d3,d2,d1,d0} = 4'b1011; #100;
        {d3,d2,d1,d0} = 4'b1100; #100;
        {d3,d2,d1,d0} = 4'b1101; #100;
        {d3,d2,d1,d0} = 4'b1110; #100;
        {d3,d2,d1,d0} = 4'b1111; #100;

	end
      
endmodule

