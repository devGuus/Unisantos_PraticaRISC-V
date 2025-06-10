module tb_unidade_controle;

  reg [6:0] opcode;
  wire srcALU, destinoMem, escritaReg, leituraMem, escritaMem, sinalBranch;
  wire [1:0] codALU;

  control_unit unidade (
    .op(opcode),
    .ALUSrc(srcALU),
    .MemtoReg(destinoMem),
    .RegWrite(escritaReg),
    .MemRead(leituraMem),
    .MemWrite(escritaMem),
    .Branch(sinalBranch),
    .ALUOp(codALU)
  );

  initial begin
    $dumpfile("saida_unidade_controle.vcd");
    $dumpvars(0, tb_unidade_controle);

    $display("Opcode\t\tALUSrc MemtoReg RegWrite MemRead MemWrite Branch ALUOp");
    $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
             opcode, srcALU, destinoMem, escritaReg, leituraMem, escritaMem, sinalBranch, codALU);

    opcode = 7'b0000000; #5;

    opcode = 7'b0110011; #5; // Formato R

    opcode = 7'b0000011; #5; // lw

    opcode = 7'b0100011; #5; // sw

    opcode = 7'b1100011; #5; // beq

    $finish;
  end

endmodule
