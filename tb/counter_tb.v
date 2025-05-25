`timescale 1ns / 1ps

module counter_tb;

    parameter WIDTH = 32;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [WIDTH-1:0] count;

    // Instantiate the adder
    counter_scratch #(.WIDTH(WIDTH)) uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );
    //Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Task: apply_reset
    task apply_reset;
    begin
        $display("[%0t] Applying reset",$time);
        rst = 1;
        @(posedge clk);
        @(posedge clk);
        rst = 0;
        $display("[%0t] Release reset", $time);
    end
    endtask
    //Task: Wait for N clock cycles
    task wait_clocks(input integer n);
        integer i;
        begin
            for(i=0;i<n;i=i+1)begin
                @(posedge clk);
            end
        end
    endtask
    task check_count(input [0:WIDTH-1] expected);
        begin
            if(count!=expected) begin
                $display("[%0t] FAILED: Error expected %0d, got %0d",$time,expected,count);
            end else begin
                $display("[%0t] PASSED: Count = %0d",$time, count);
            end
        end
    endtask

    //Main stimulus
    initial begin
        // VCD waveform dump
        $dumpfile("output/counter_wave.vcd");
        $dumpvars(0,counter_tb);
        
        //initial state
        rst = 0;
        apply_reset();
        wait_clocks(10); check_count(10);
        wait_clocks(10); check_count(20);
        wait_clocks(10); check_count(30);
        wait_clocks(10); check_count(40);
        wait_clocks(10); check_count(50);
        wait_clocks(10); check_count(60);
        wait_clocks(10); check_count(70);
        wait_clocks(20); check_count(90);
        $display("[%0t] Final count = %0d", $time, count);
        $finish;
    end
endmodule

