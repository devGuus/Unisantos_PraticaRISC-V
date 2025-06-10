`include "../defs.vh"

module caminho_dados(input wire clk, reset);

  wire [`DATA_WIDTH-1:0] pc_atual, pc_prox;
  wire [`DATA_WIDTH-1:0] instrucao;
  wire sinal_ALUSrc, sinal_MemtoReg, sinal_RegWrite, sinal_MemRead, sinal_MemWrite, sinal_Branch;
  wire [1:0] codigo_ALUOp;

  wire [4:0] origem1 = instrucao[19:15];
  wire [4:0] origem2 = instrucao[24:20];
  wire [4:0] destino = instrucao[11:7];

  wire [`DATA_WIDTH-1:0] dado1, dado2;
  wire [`DATA_WIDTH-1:0] imediato;
  wire [`DATA_WIDTH-1:0] saida_mux_alu;
  wire [`DATA_WIDTH-1:0] resultado_alu;
  wire zero_flag;
  wire [3:0] operacao_alu;
  wire [`DATA_WIDTH-1:0] dado_memoria;
  wire [`DATA_WIDTH-1:0] dado_escrita;
  wire [`DATA_WIDTH-1:0] soma_pc4, endereco_branch;
  wire [`DATA_WIDTH-1:0] prox_saida_pc;

  pc pc_u(pc_prox, clk, reset, pc_atual);
  instruction_memory imem_u(pc_atual[9:2], instrucao);
  unidade_controle uc_u(instrucao[6:0], sinal_ALUSrc, sinal_MemtoReg, sinal_RegWrite, sinal_MemRead, sinal_MemWrite, sinal_Branch, codigo_ALUOp);
  register_file regs_u(clk, origem1, origem2, destino, sinal_RegWrite, dado_escrita, dado1, dado2);
  imm_gen ig_u(instrucao, imediato);
  mux_alu_src muxalu_u(dado2, imediato, sinal_ALUSrc, saida_mux_alu);
  controle_ula ctrlula_u(instrucao[31:25], instrucao[14:12], codigo_ALUOp, operacao_alu);
  alu alu_u(dado1, saida_mux_alu, operacao_alu, resultado_alu, zero_flag);
  data_memory dmem_u(resultado_alu, clk, dado2, sinal_MemWrite, sinal_MemRead, dado_memoria);
  mux_memtoreg muxmr_u(resultado_alu, dado_memoria, sinal_MemtoReg, dado_escrita);
  pc_soma4 somador_pc4(pc_atual, soma_pc4);
  pc_soma_alvo somador_branch(pc_atual, imediato, endereco_branch);
  mux_pc muxpc_u(soma_pc4, endereco_branch, sinal_Branch, zero_flag, prox_saida_pc);

  assign pc_prox = prox_saida_pc;

endmodule
