module alu(
	input [2:0] op,
	input [7:0] a, b,
	output reg [7:0] y
);
	always @(*) begin
		case(op)
		3'b000: y = a + b;    // ADD
        3'b001: y = a - b;    // SUB
        3'b010: y = a & b;    // AND
        3'b011: y = a | b;    // OR
        3'b100: y = a;        // MOV A
        3'b101: y = b;        // PASS B
        default: y = 8'h00;
		endcase
	end
endmodule