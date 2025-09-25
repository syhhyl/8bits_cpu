`include "dff.v"
module dff_tb;
	reg clk, d;
	wire q;

	dff uut(.clk(clk), .d(d), .q(q));

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$monitor("%t clk=%b %b | %b", $time, clk, d, q);
		$display("Time d | q");
		d = 0; #12 //$display("%t %b | %b", $time, d, q);
		d = 1; #10 //$display("%t %b | %b", $time, d, q);
		d = 0; #10 //$display("%t %b | %b", $time, d, q);
		$finish;
	end
endmodule