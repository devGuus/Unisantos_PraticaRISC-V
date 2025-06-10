`include "../defs.vh"

module adder_pc_plus4_tb;

  reg [`DATA_WIDTH-1:0] pc_in;
  wire [`DATA_WIDTH-1:0] pc_out;

  adder_pc_plus4 uut(pc_in, pc_out);

  initial begin
    $dumpfile("adder_pc_plus4.vcd");
    $dumpvars(0, adder_pc_plus4_tb);

    pc_in = 32'd100;
    #5;

    $display("PC = %d | PC + 4 = %d", pc_in, pc_out);
    $finish;
  end

endmodule
