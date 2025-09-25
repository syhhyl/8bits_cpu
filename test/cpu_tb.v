`include "cpu.v"
module cpu_tb;
	reg clk;
	wire [7:0] r0, r1, r2;

	cpu uut(
		.clk(clk),
		.debug_r0(r0),
		.debug_r1(r1),
		.debug_r2(r2)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	always @(negedge clk) begin
		$display("Time = %0t ns | R0 = %0d | R1 = %0d | R2 = %0d", $time, r0, r1, r2);
	end

	// 运行一段时间后结束仿真
	initial begin
		#100;  // 你可以改成 #200 或更多
		$finish;
	end
endmodule
