`include "and2.v"
module and2_tb;
	reg a, b;
	wire y;

	and2 uut(.a(a), .b(b), .y(y));

	initial begin
		$display("a b | y");
		$monitor("%b %b | %b", a, b, y);
		a = 0; b = 0; #10 //$display("%b %b | %b", a, b, y);
		a = 0; b = 1; #10 //$display("%b %b | %b", a, b, y);
		a = 1; b = 0; #10 //$display("%b %b | %b", a, b, y);
		a = 1; b = 1; #10 //$display("%b %b | %b", a, b, y);
		$finish;
	end
endmodule