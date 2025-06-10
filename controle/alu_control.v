module controle_ula (
  input  wire [1:0] op_ALU,
  input  wire [6:0] campo_func7,
  input  wire [2:0] campo_func3,
  output reg  [3:0] codigo_ula
);

always @(*) begin
  case (op_ALU)
    2'b00: codigo_ula = 4'b0010; // lw, sw
    2'b01: codigo_ula = 4'b0110; // beq
    2'b10: begin
      case ({campo_func7, campo_func3})
        10'b0000000_000: codigo_ula = 4'b0010; // ADD
        10'b0100000_000: codigo_ula = 4'b0110; // SUB
        10'b0000000_111: codigo_ula = 4'b0000; // AND
        10'b0000000_110: codigo_ula = 4'b0001; // OR
        default: codigo_ula = 4'bxxxx;
      endcase
    end
    default: codigo_ula = 4'bxxxx;
  endcase
end

endmodule
