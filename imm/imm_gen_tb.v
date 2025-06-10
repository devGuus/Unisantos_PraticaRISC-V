`include "../defs.vh"

module tb_imm_gen;

  reg [`DATA_WIDTH-1:0] instrucao;
  wire [`DATA_WIDTH-1:0] imediato;

  imm_gen uut(instrucao, imediato);

  initial begin

    $dumpfile("saida_imm_gen.vcd");
    $dumpvars(0, tb_imm_gen);
    
    // Caso 1: lw (formato I)
    instrucao = 32'b111111111111_00000_010_00001_0000011; 
    #10
    $display("LW -> instrucao = %b | imediato = %b", instrucao, imediato);

    // Caso 2: sw (formato S)
    instrucao = 0;
    instrucao[31:25] = 7'b0000001;
    instrucao[11:7]  = 5'b00101;
    instrucao[6:0]   = 7'b0100011;
    #10
    $display("SW -> instrucao = %b | imediato = %b", instrucao, imediato);

    // Caso 3: beq (formato B)
    instrucao = 0;
    instrucao[31]    = 1'b0;
    instrucao[7]     = 1'b0;
    instrucao[30:25] = 6'b000000;
    instrucao[11:8]  = 4'b0010;
    instrucao[6:0]   = 7'b1100011;
    #10
    $display("BEQ -> instrucao = %b | imediato = %b", instrucao, imediato);

    $finish;
  end

endmodule
