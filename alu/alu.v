module unidade_alu (
    input  [3:0] operacao,
    input  [7:0] entradaA, entradaB,
    output reg [7:0] resultado,
    output reg carry_out, zero_flag
);

always @(*) begin
    carry_out = 0;
    case (operacao)
        4'b0000: resultado = entradaA + entradaB;          // Soma
        4'b0001: resultado = entradaA - entradaB;          // Subtração
        4'b0010: resultado = entradaA & entradaB;          // AND
        4'b0011: resultado = entradaA | entradaB;          // OR
        4'b0100: resultado = ~entradaA;                    // NOT
        4'b0101: resultado = entradaA ^ entradaB;          // XOR
        4'b0110: resultado = entradaA << 1;                // Shift esquerdo
        4'b0111: resultado = entradaA >> 1;                // Shift direito
        4'b1000: begin                                     // Multiplicação
            {carry_out, resultado} = entradaA * entradaB;
        end
        default: resultado = 8'b00000000;
    endcase

    // Verificação de zero
    zero_flag = (resultado == 0);
end

endmodule
