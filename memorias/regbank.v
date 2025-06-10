`include "../defs.vh"

module regbank(clk_in, srcA, srcB, dest, enable_wr, data_in, data_outA, data_outB);

  input wire clk_in, enable_wr;
  input wire [4:0] srcA, srcB, dest;
  input wire [`DATA_WIDTH-1:0] data_in;
  output wire [`DATA_WIDTH-1:0] data_outA, data_outB;

  reg [`DATA_WIDTH-1:0] bank[0:31];

  assign data_outA = (srcA != 0) ? bank[srcA] : 32'd0;
  assign data_outB = (srcB != 0) ? bank[srcB] : 32'd0;

  always @(posedge clk_in) begin
    if (enable_wr)
      bank[dest] <= data_in;
  end

  initial begin
    bank[0] = 32'd0;
    bank[2] = 32'd5;
    bank[3] = 32'd10;
    bank[1] = 32'd0;
    bank[5] = 32'd0;
    bank[4] = 32'd10;

    #100;
    $display("x1 = %d", bank[1]);
    $display("x2 = %d", bank[2]);
    $display("x3 = %d", bank[3]);
    $display("x5 = %d", bank[5]);
    $finish;
  end

endmodule
