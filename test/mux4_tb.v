`include "mux4.v"

module mux4_tb;
	reg [3:0] data;
	reg [1:0] sel;
	wire y;

	mux4 uut(.sel(sel), .data(data), .y(y));
	
	initial begin
		data = 4'b0111;
		$monitor("sel=%b y=%b", sel, y);
		sel = 2'b00; #5;
		sel = 2'b01; #5; 
		sel = 2'b10; #5;
		sel = 2'b11; #5;
		$finish;
	end
endmodule