`include "../defs.vh"

module ram64_tb;
  reg clk_sim, write_en, read_en;
  reg [`DATA_WIDTH-1:0] address, data_in;
  wire [`DATA_WIDTH-1:0] data_out;

  ram64 dut(address, clk_sim, data_in, write_en, read_en, data_out);

  // Clock de simulação
  initial begin
    clk_sim = 0;
    forever #5 clk_sim = ~clk_sim;
  end

  initial begin
    $dumpfile("ram64.vcd");
    $dumpvars(0, ram64_tb);

    $display("==== Testes da memória RAM ====");

    // Inicialização
    write_en = 0; read_en = 0;
    address = 0; data_in = 0;
    #10;

    // Teste 1: escrita na posição 10
    write_en = 1; read_en = 0;
    address = 10;
    data_in = 32'hDEADBEEF;
    #10;

    // Teste 2: leitura da posição 10
    write_en = 0; read_en = 1;
    address = 10;
    #10;
    $display("Leitura pos 10: %h (esperado: DEADBEEF)", data_out);

    // Teste 3: leitura da posição 20 (não escrita)
    address = 20;
    #10;
    $display("Leitura pos 20: %h (esperado: 0)", data_out);

    // Teste EXTRA: escrita e leitura na posição 30
    write_en = 1; read_en = 0;
    address = 30;
    data_in = 32'hCAFEBABE;
    #10;

    write_en = 0; read_en = 1;
    address = 30;
    #10;
    $display("Leitura pos 30: %h (esperado: CAFEBABE)", data_out);

    $finish;
  end
endmodule
