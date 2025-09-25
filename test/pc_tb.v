`include "pc.v"
module pc_tb;
  reg clk, rst, pc_write_en;
  reg [7:0] next_pc;
  wire [7:0] pc_out;

  pc uut(
    .clk(clk),
    .rst(rst),
    .next_pc(next_pc),
    .pc_write_en(pc_write_en),
    .pc_out(pc_out)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $display("Time  rst en  next_pc | pc_out");
    rst = 1; pc_write_en = 0; next_pc = 8'h00; #10;
    rst = 0; pc_write_en = 1; next_pc = 8'h10; #10;
    next_pc = 8'h20; #10;
    pc_write_en = 0; next_pc = 8'h30; #10;
    pc_write_en = 1; next_pc = 8'h40; #10;
    $finish;
  end

  always @(posedge clk) begin
    $display("%4t   %b   %b     %h   |   %h", $time, rst, pc_write_en, next_pc, pc_out);
  end
endmodule