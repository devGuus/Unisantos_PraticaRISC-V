`include "../defs.vh"

module reg_pc_tb;

  reg [`DATA_WIDTH-1:0] next_addr;
  reg clk, reset;
  wire [`DATA_WIDTH-1:0] current_addr;

  reg_pc uut(next_addr, clk, reset, current_addr);

  initial begin
    $dumpfile("reg_pc.vcd");
    $dumpvars(0, reg_pc_tb);

    $display("\n--- Teste reg_pc ---");
    $monitor("clk = %b | reset = %b | next_addr = %h | current_addr = %h", clk, reset, next_addr, current_addr);

    // Inicia com reset desativado
    reset = 0; next_addr = 32'hDEADBEEF;
    #5;

    // Ativa reset (zera o PC)
    reset = 1;
    #5;

    // Desativa reset e muda o endereço
    reset = 0; next_addr = 32'h12345678;
    #10;

    // Teste adicional
    next_addr = 32'hCAFEBABE;
    #10;

    $finish;
  end

  // Geração de clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

endmodule
