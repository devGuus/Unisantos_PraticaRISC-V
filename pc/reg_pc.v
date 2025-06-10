`include "../defs.vh"

module reg_pc(next_addr, clk, reset, current_addr);

  input wire clk, reset;
  input wire [`DATA_WIDTH-1:0] next_addr;
  output reg [`DATA_WIDTH-1:0] current_addr;

  always @(posedge clk or posedge reset) begin
    if (reset)
      current_addr <= 0;
    else
      current_addr <= next_addr;
  end

endmodule
