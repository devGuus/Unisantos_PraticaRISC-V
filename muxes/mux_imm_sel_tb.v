`include "../defs.vh"

module mux_imm_sel_tb;

  reg [`DATA_WIDTH-1:0] data_reg, data_imm;
  reg use_imm;
  wire [`DATA_WIDTH-1:0] mux_out;

  mux_imm_sel dut(data_reg, data_imm, use_imm, mux_out);

  initial begin
    $dumpfile("mux_imm_sel.vcd");
    $dumpvars(0, mux_imm_sel_tb);

    data_reg = 32'd1; data_imm = 32'd999; use_imm = 1;
    #5;
    $display("data_reg = %d | data_imm = %d | use_imm = %b | mux_out = %d", data_reg, data_imm, use_imm, mux_out);

    use_imm = 0;
    #5;
    $display("data_reg = %d | data_imm = %d | use_imm = %b | mux_out = %d", data_reg, data_imm, use_imm, mux_out);

    // 🔁 Teste adicional
    data_reg = 32'd42; data_imm = 32'd1000; use_imm = 1;
    #5;
    $display("Novo teste com data_imm = 1000 => mux_out = %d", mux_out);

    $finish;
  end

endmodule
