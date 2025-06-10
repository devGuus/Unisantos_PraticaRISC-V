`include "../defs.vh"

module tb_datapath;

  reg clk_sim, rst_sim;

  datapath dut (clk_sim, rst_sim);

  initial begin
    clk_sim = 0;
    forever #5 clk_sim = ~clk_sim;
  end

  // Instruções simuladas:
  // 1. add x1, x2, x3
  // 2. sw x1, 0(x2)
  // 3. lw x5, 0(x2)
  // 4. beq x3, x4, 12

  initial begin
    $dumpfile("saida_datapath.vcd");
    $dumpvars(0, tb_datapath);

    rst_sim = 1;
    #10;
    rst_sim = 0;

    #100;

    $finish;
  end

endmodule
