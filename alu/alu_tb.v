module teste_unidade_alu;

reg  [7:0] valA, valB;
reg  [3:0] codigo_op;
wire [7:0] saida_res;
wire carry_saida, flag_zero;

unidade_alu alu_inst (
    .entradaA(valA),
    .entradaB(valB),
    .operacao(codigo_op),
    .resultado(saida_res),
    .carry_out(carry_saida),
    .zero_flag(flag_zero)
);

initial begin
    $display("A\tB\tOP\tResultado\tCarry\tZero");
    
    valA = 8'd15; valB = 8'd10; codigo_op = 4'b0000; #10; // Soma
    $display("%d\t%d\t%04b\t%d\t\t%b\t%b", valA, valB, codigo_op, saida_res, carry_saida, flag_zero);

    valA = 8'd25; valB = 8'd30; codigo_op = 4'b0001; #10; // Subtração
    $display("%d\t%d\t%04b\t%d\t\t%b\t%b", valA, valB, codigo_op, saida_res, carry_saida, flag_zero);

    valA = 8'b10101010; valB = 8'b11001100; codigo_op = 4'b0010; #10; // AND
    $display("%b\t%b\t%04b\t%b\t%b\t%b", valA, valB, codigo_op, saida_res, carry_saida, flag_zero);

    valA = 8'd100; valB = 8'd3; codigo_op = 4'b1000; #10; // Multiplicação
    $display("%d\t%d\t%04b\t%d\t\t%b\t%b", valA, valB, codigo_op, saida_res, carry_saida, flag_zero);

    $finish;
end

endmodule
