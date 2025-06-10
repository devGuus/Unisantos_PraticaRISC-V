`include "../defs.vh"

module ram64(address, clk, data_in, write_en, read_en, data_out);
  input wire clk, write_en, read_en;
  input wire [`DATA_WIDTH-1:0] address, data_in;
  output reg [`DATA_WIDTH-1:0] data_out;

  // Bloco de memória com 65 posições
  reg [31:0] mem_block[0:64];

  // Leitura assíncrona
  always @(*) begin
    if (read_en)
      data_out = mem_block[address];
    else
      data_out = 32'b0;
  end

  // Escrita síncrona
  always @(posedge clk) begin
    if (write_en)
      mem_block[address] <= data_in;
  end

  // Inicialização de dados e exibição
  initial begin
    mem_block[5]  = 32'd0;
    mem_block[9]  = 32'd33;

    #100;
    $display("mem_block[5]  = %d", mem_block[5]);
    $display("mem_block[9]  = %d", mem_block[9]);
    $finish;
  end

endmodule
