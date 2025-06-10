`include "../defs.vh"

module regbank_tb;

  reg clk_in, enable_wr;
  reg [4:0] srcA, srcB, dest;
  reg [`DATA_WIDTH-1:0] data_in;
  wire [`DATA_WIDTH-1:0] data_outA, data_outB;

  regbank uut(clk_in, srcA, srcB, dest, enable_wr, data_in, data_outA, data_outB);

  // Geração de clock
  initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in;
  end

  initial begin
    $dumpfile("regbank.vcd");
    $dumpvars(0, regbank_tb);

    enable_wr = 0;
    srcA = 0; srcB = 0; dest = 0; data_in = 0;

    $display("Inicial: A = %h | B = %h", data_outA, data_outB);

    // Escreve 0xAAAAAAAA no registrador 6
    dest = 5'd6; data_in = 32'hAAAAAAAA; enable_wr = 1;
    #10;

    // Escreve 0x55555555 no registrador 3
    dest = 5'd3; data_in = 32'h55555555; enable_wr = 1;
    #10;

    // Lê os registradores 6 e 3
    srcA = 5'd6; srcB = 5'd3;
    #10;

    $display("Leitura: A = %h | B = %h", data_outA, data_outB);

    // 🔁 Teste adicional: sobrescreve registrador 6 e lê de novo
    dest = 5'd6; data_in = 32'h12345678;
    #10;
    srcA = 5'd6;
    #10;
    $display("Releitura A (registrador 6) após nova escrita: %h", data_outA);

    $finish;
  end

endmodule
