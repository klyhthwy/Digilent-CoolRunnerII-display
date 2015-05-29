`timescale 1ns / 1ps


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
        $display("dividend: %14b", uut.dividend);
        $display("divisor:  %14b", uut.divisor);
        $display("quotient: %14b", quotient);
        $display("ready:    %1b", ready);
        $display("fit:      %1b", uut.fit);
        $stop;
    end

    initial begin
        // Initialize Inputs
        clk = 1;
        rst = 0;
        value = 4934;
        start = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        rst = 1; start = 1; #100
        start = 0;

    end
endmodule