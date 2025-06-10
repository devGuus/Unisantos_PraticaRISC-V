`include "../defs.vh"

module mux_pc_next_tb;

  reg [`DATA_WIDTH-1:0] pc_plus4, pc_branch;
  reg branch_en, cond_zero;
  wire [`DATA_WIDTH-1:0] next_pc;

  mux_pc_next mux(pc_plus4, pc_branch, branch_en, cond_zero, next_pc);

  initial begin
    $dumpfile("mux_pc_next.vcd");
    $dumpvars(0, mux_pc_next_tb);

    pc_plus4 = 32'd100; pc_branch = 32'd9999;
    branch_en = 1; cond_zero = 1;
    #5;
    $display("Branch = %b | zero = %b | next_pc = %d", branch_en, cond_zero, next_pc);

    branch_en = 0; cond_zero = 0;
    #5;
    $display("Branch = %b | zero = %b | next_pc = %d", branch_en, cond_zero, next_pc);

    // 🔁 Teste adicional
    branch_en = 1; cond_zero = 0;
    #5;
    $display("Branch = 1, zero = 0 => deve ir para pc_plus4 = %d", next_pc);

    $finish;
  end

endmodule
