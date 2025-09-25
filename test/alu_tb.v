`include "alu.v"
module alu_tb;
	reg [2:0] op;
	reg [7:0] a, b;
	wire [7:0] y;

	alu uut(.op(op), .a(a), .b(b), .y(y));

	initial begin
		$display("op | a | b | y");
		a = 8'h05; b = 8'h03;

		op = 3'b000; #1 $display("ADD  | %h | %h | %h", a, b, y); // 08
		op = 3'b001; #1 $display("SUB  | %h | %h | %h", a, b, y); // 02
		op = 3'b010; #1 $display("AND  | %h | %h | %h", a, b, y); // 01
		op = 3'b011; #1 $display(" OR  | %h | %h | %h", a, b, y); // 07
		op = 3'b100; #1 $display("MOV A| %h | %h | %h", a, b, y); // 05
		op = 3'b101; #1 $display("MOV B| %h | %h | %h", a, b, y); // 03
		
		$finish;
	end
endmodule