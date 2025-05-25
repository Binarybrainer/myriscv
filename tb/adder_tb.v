`timescale 1ns / 1ps

module adder_tb;

    parameter WIDTH = 31;

    // Inputs
    reg [WIDTH-1:0] a;
    reg [WIDTH-1:0] b;

    // Outputs
    wire cout;
    wire [WIDTH-1:0] sum;

    // Instantiate the adder
    adder #(.WIDTH(WIDTH)) uut (
        .a(a),
        .b(b),
        .cout(cout),
        .sum(sum)
    );

    // Task to check and report results
    task automatic check;
        input [WIDTH-1:0] a_in;
        input [WIDTH-1:0] b_in;
        reg   [WIDTH:0] expected;
    begin
        a = a_in;
        b = b_in;
        #1; // Wait for propagation
        expected = a_in + b_in;
        if ({cout, sum} !== expected)
            $display("FAIL: a=%h b=%h -> sum=%h cout=%b (expected %h)", a, b, sum, cout, expected);
        else
            $display("PASS: a=%h b=%h -> sum=%h cout=%b", a, b, sum, cout);
    end
    endtask

    integer i;

    initial begin
        $display("Starting 32-bit adder testbench...");

        // Edge test cases
        check(32'h00000000, 32'h00000000);  // 0 + 0
        check(32'hFFFFFFFF, 32'h00000001);  // Overflow test
        check(32'h7FFFFFFF, 32'h00000001);  // Signed boundary
        check(32'h80000000, 32'h80000000);  // MSB addition
        check(32'hFFFFFFFF, 32'hFFFFFFFF);  // Max + Max

        // Random samples
        for (i = 0; i < 20; i = i + 1) begin
            check($random, $random);
        end

        $display("Finished.");
        $finish;
    end
initial begin
  $dumpfile("output/wave.vcd");    // VCD = Value Change Dump
  $dumpvars(0, adder_tb); // dump all signals in the design
  // your simulation code
end
endmodule

