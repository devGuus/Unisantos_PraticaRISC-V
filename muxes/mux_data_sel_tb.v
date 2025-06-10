`include "../defs.vh"

module mux_data_sel_tb;

  reg [`DATA_WIDTH-1:0] res_alu, mem_val;
  reg use_mem;
  wire [`DATA_WIDTH-1:0] result_out;

  mux_data_sel uut(res_alu, mem_val, use_mem, result_out);

  initial begin
    $dumpfile("mux_data_sel.vcd");
    $dumpvars(0, mux_data_sel_tb);

    res_alu = 32'd33; mem_val = 32'd8888; use_mem = 1;
    #5;
    $display("res_alu = %d | mem_val = %d | use_mem = %b | result_out = %d", res_alu, mem_val, use_mem, result_out);

    use_mem = 0;
    #5;
    $display("res_alu = %d | mem_val = %d | use_mem = %b | result_out = %d", res_alu, mem_val, use_mem, result_out);

    // 🔁 Teste adicional
    res_alu = 32'd1234; mem_val = 32'd5678; use_mem = 1;
    #5;
    $display("Novo teste com mem_val = 5678 => result_out = %d", result_out);

    $finish;
  end

endmodule
