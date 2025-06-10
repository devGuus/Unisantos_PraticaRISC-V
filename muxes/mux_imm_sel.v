`include "../defs.vh"

module mux_imm_sel(data_reg, data_imm, use_imm, mux_out);

  input wire [`DATA_WIDTH-1:0] data_reg, data_imm;
  input wire use_imm;
  output wire [`DATA_WIDTH-1:0] mux_out;

  assign mux_out = use_imm ? data_imm : data_reg;

endmodule
