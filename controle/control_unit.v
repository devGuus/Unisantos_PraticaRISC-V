module unidade_controle (
  input  wire [6:0] opcode,
  output wire usa_ALUSrc,
  output wire enviaMemParaReg,
  output wire escreveReg,
  output wire leMem,
  output wire escreveMem,
  output wire sinalBranch,
  output wire [1:0] codigoALU,
  output reg  [7:0] sinais_controle
);

always @(*) begin
  case (opcode)
    7'b0110011: sinais_controle = 8'b0_0_1_0_0_0_10; // R-type
    7'b0000011: sinais_controle = 8'b1_1_1_1_0_0_00; // lw
    7'b0100011: sinais_controle = 8'b1_x_0_0_1_0_00; // sw
    7'b1100011: sinais_controle = 8'b0_x_0_0_0_1_01; // beq
    7'b0000000: sinais_controle = 8'b0_0_0_0_0_0_00; // reset
    default:    sinais_controle = 8'bx_x_x_x_x_x_xx;
  endcase
end

assign {
  usa_ALUSrc,
  enviaMemParaReg,
  escreveReg,
  leMem,
  escreveMem,
  sinalBranch,
  codigoALU
} = sinais_controle;

endmodule
