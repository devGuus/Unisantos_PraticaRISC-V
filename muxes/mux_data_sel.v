`include "../defs.vh"

module mux_data_sel(res_alu, mem_val, use_mem, result_out);

  input wire [`DATA_WIDTH-1:0] res_alu, mem_val;
  input wire use_mem;
  output wire [`DATA_WIDTH-1:0] result_out;

  assign result_out = use_mem ? mem_val : res_alu;

endmodule
