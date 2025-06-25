`include "count_s.v"
module count_s_tb;
	reg clk;
	reg res;
	wire [5:0] out;

	count_s c0(.clk(clk), .res(res), .y(out));

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		res = 1;
		#50;
		res = 0;
	end

	always @(posedge clk or negedge res) begin
		$display("clk=%d res=%d y=%d\n", clk, res, out);
	end 
	
	initial begin
		#100 $finish;
	end

endmodule
