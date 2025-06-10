`include "../defs.vh"

module rom_unit(addr_in, inst_out);

  input wire [7:0] addr_in;                     // Endereço de instrução (8 bits)
  output wire [`DATA_WIDTH-1:0] inst_out;       // Saída da instrução (32 bits)

  reg [`DATA_WIDTH-1:0] instr_mem[0:255];       // Memória de 256 instruções de 32 bits

  assign inst_out = instr_mem[addr_in];

  initial begin
    $readmemh("../instructions.txt", instr_mem, 0, 3);
  end

endmodule
