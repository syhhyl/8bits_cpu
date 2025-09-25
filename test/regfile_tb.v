`include "regfile.v"
module regfile_tb;
  reg clk, we;
  reg [2:0] waddr, raddr1, raddr2;
  reg [7:0] wdata;
  wire [7:0] rdata1, rdata2;

  regfile uut(
    .clk(clk), .we(we), .waddr(waddr), .wdata(wdata),
    .raddr1(raddr1), .raddr2(raddr2),
    .rdata1(rdata1), .rdata2(rdata2)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $display("Time | Write | waddr wdata | raddr1 raddr2 | rdata1 rdata2");
    we = 1; waddr = 3'd1; wdata = 8'hAA; raddr1 = 3'd1; raddr2 = 3'd2; #10;
    we = 1; waddr = 3'd2; wdata = 8'h55; #10;
    we = 0; raddr1 = 3'd1; raddr2 = 3'd2; #10;
    $finish;
  end

  always @(posedge clk) begin
    $display("%4t |   %b   |   %0d    %h  |   %0d     %0d   |   %h     %h",
             $time, we, waddr, wdata, raddr1, raddr2, rdata1, rdata2);
  end
endmodule