`timescale 1ns/1ps

module cpu_tb;

reg clk;
reg reset;

/* Instantiate CPU */
cpu_top uut (
    .clk(clk),
    .reset(reset)
);

/* Clock generation */
initial begin
    clk = 0;
end

always #5 clk = ~clk;   // 10ns clock period


/* Simulation */
initial begin

    $display("Starting CPU Simulation");

    reset = 1;
    #20;

    reset = 0;

    #200;

    $display("Simulation Finished");
    $stop;

end

/* Monitor important CPU signals */
initial begin
    $monitor("time=%0t clk=%b reset=%b PC=%d",
              $time, clk, reset, uut.pc_out);
end

endmodule
