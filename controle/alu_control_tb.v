module tb_alu_control;

  reg [1:0] sinal_ALUOp;
  reg [6:0] sinal_func7;
  reg [2:0] sinal_func3;
  wire [3:0] saida_opcode;

  // Instância do módulo de controle da ALU
  alu_control unidade_controle (
    .func7(sinal_func7),
    .func3(sinal_func3),
    .ALUOp(sinal_ALUOp),
    .alu_opcode(saida_opcode)
  );

  initial begin
    $dumpfile("dump_alu_ctrl.vcd");
    $dumpvars(0, tb_alu_control);

    $display("ALUOp | func7     | func3 | opcode");
    $monitor("%b    | %b | %b   | %b", sinal_ALUOp, sinal_func7, sinal_func3, saida_opcode);

    // Operações de Load/Store
    sinal_ALUOp = 2'b00; #10;

    // Operações de Branch
    sinal_ALUOp = 2'b01; #10;

    // Operações baseadas em R-type
    sinal_ALUOp = 2'b10;

    // Testes com diferentes combinações
    sinal_func7 = 7'b0000000; sinal_func3 = 3'b000; #10; // ADD
    sinal_func7 = 7'b0100000; sinal_func3 = 3'b000; #10; // SUB
    sinal_func7 = 7'b0000000; sinal_func3 = 3'b111; #10; // AND
    sinal_func7 = 7'b0000000; sinal_func3 = 3'b110; #10; // OR

    $finish;
  end

endmodule
