`include "../defs.vh"

module adder_pc_offset_tb;

  reg [`DATA_WIDTH-1:0] pc_in, offset;
  wire [`DATA_WIDTH-1:0] pc_out;

  adder_pc_offset uut(pc_in, offset, pc_out);

  initial begin
    $dumpfile("adder_pc_offset.vcd");
    $dumpvars(0, adder_pc_offset_tb);

    pc_in = 32'd10;
    offset = 32'd12;
    #5;

    $display("PC = %d | Offset = %d | Result = %d", pc_in, offset, pc_out);
    $finish;
  end

endmodule
