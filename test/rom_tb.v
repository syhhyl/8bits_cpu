`include "rom.v"
module rom_tb;
	reg [7:0] addr;
	wire [15:0] data;

	rom uut(.addr(addr), .data(data));

	initial begin
		$display("addr | Data");
		addr = 8'h00; #1 $display("%h   | %b", addr, data);
		addr = 8'h01; #1 $display("%h   | %b", addr, data);
		addr = 8'h02; #1 $display("%h   | %b", addr, data);
		addr = 8'h03; #1 $display("%h   | %b", addr, data);
		addr = 8'h04; #1 $display("%h   | %b", addr, data); // default
		$finish;
	end

endmodule
	
