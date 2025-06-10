`include "../defs.vh"

module adder_pc_offset(pc_in, offset, pc_out);

  input wire [`DATA_WIDTH-1:0] pc_in, offset;
  output wire [`DATA_WIDTH-1:0] pc_out;

  assign pc_out = pc_in + offset;

endmodule
