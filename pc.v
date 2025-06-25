module pc(
	input clk,
	input pc_write_en,
	output reg [7:0] pc_out
);

	initial begin
		pc_out = 8'b0; // 初始化PC为0
	end

	always @(posedge clk) begin
		if (pc_write_en)
			pc_out <= pc_out + 8'd1; // 简单的PC递增逻辑
	end

endmodule