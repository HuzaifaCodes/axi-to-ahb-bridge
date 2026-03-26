// tb_counter.sv - testbench for counter
`timescale 1ns/1ps
module tb_counter;

logic clk;
logic rst;
logic [3:0] q;

// Instantiate DUT
counter dut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk; // 100MHz clock

// Test sequence
initial begin
    rst = 1;
    #10;
    rst = 0;

    repeat (20) begin
        #10;
        $display("Time: %0t | q = %0d", $time, q);
    end

    $finish;
end

endmodule