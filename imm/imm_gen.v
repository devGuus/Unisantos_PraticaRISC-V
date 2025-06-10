`include "../defs.vh"

module gerador_imm(instr, saida_imm);
  input wire [`DATA_WIDTH-1:0] instr;
  output reg [`DATA_WIDTH-1:0] saida_imm;
  
  wire [6:0] codigo_op;
  assign codigo_op = instr[6:0];
  
  always @(*) begin
    case (codigo_op) 
      7'b0000011: // lw (I-type)
        saida_imm = {{20{instr[31]}}, instr[31:20]};
      7'b0100011: // sw (S-type)
        saida_imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};
      7'b1100011: // beq (B-type)
        saida_imm = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
      default:
        saida_imm = 32'b0;
    endcase
  end
endmodule
