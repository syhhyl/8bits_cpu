module regfile(
	input clk,
	input we,
	input [2:0] waddr,
	input [7:0] wdata,
	input [2:0] raddr1,
	input [2:0] raddr2,
	output [7:0] rdata1,
	output [7:0] rdata2,
	output [7:0] debug_r0,
	output [7:0] debug_r1,
	output [7:0] debug_r2
);

	reg [7:0] regs [7:0];

	assign rdata1 = regs[raddr1];
	assign rdata2 = regs[raddr2];

	assign debug_r0 = regs[0];
    assign debug_r1 = regs[1];
    assign debug_r2 = regs[2];
	
	integer i;
	initial begin
		regs[0] = 8'h01; // R0 初始化为 0
		regs[1] = 8'h02; // R0 初始化为 0
		regs[2] = 8'h03; // R0 初始化为 0
		regs[3] = 8'h04; // R0 初始化为 0
	end

	always @(posedge clk) begin
		if (we) begin
			regs[waddr] <= wdata; // 写入寄存器
			//$display("regfile write: regs[%0d]=%h", waddr, wdata);
		end
	end

	
endmodule