module count_s(
	input clk,
	input res,
	output reg [5:0] y
);

	initial begin
		y <= 6'b0;
	end

	always @(posedge clk or negedge res)
		begin
			if (!res) y <= 6'b0;
			else if (y == 6'b110110) y <= 6'b0;	
			else y <= y + 6'b1;
		end
endmodule