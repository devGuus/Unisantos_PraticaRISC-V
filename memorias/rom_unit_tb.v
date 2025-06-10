`include "../defs.vh"

module rom_unit_tb;

  reg [7:0] addr_in;
  wire [`DATA_WIDTH-1:0] inst_out;

  rom_unit rom_inst(addr_in, inst_out);

  integer i;

  initial begin
    $dumpfile("rom_unit.vcd");
    $dumpvars(0, rom_unit_tb);

    $display("==== Teste da ROM de instruções ====");

    for (i = 0; i < 4; i = i + 1) begin
      addr_in = i;
      #5;
      $display("ADDR = %d | INST = %h", addr_in, inst_out);
    end

    // 🔁 Teste adicional: acesso à posição 2 novamente
    addr_in = 2;
    #5;
    $display("Releitura do endereço 2: %h", inst_out);

    #5;
    $finish;
  end

endmodule
