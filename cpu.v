`include "rom.v"
`include "regfile.v"
`include "alu.v"
`include "pc.v"

module cpu(
	input clk,
	output [7:0] debug_r0,
    output [7:0] debug_r1,
    output [7:0] debug_r2
);

	wire [7:0] pc_val;
	wire [15:0] instr;
	wire [3:0] opcode;
	wire [2:0] rd, rs1, rs2;
	wire [7:0] rdata1, rdata2, alu_out;
	
	pc pc0(
		.clk(clk),
		.pc_write_en(1'b1),  // 假设总是写入PC
		.pc_out(pc_val)
	);
    
	rom rom0(.addr(pc_val), .data(instr));


	always @(posedge clk) begin
		$display("instr=%h (%b) at PC=%0d", instr, instr, pc_val);
	end

	// 解析指令
	assign opcode = instr[15:12];
	assign rd = instr[11:9];
	assign rs1 = instr[8:6]; 
	assign rs2 = instr[5:3];
	

	
	regfile rf(
		.clk(clk),
		.we(1'b1),  // 使用新的写使能信号
		.waddr(rd),
		.wdata(alu_out),
		.raddr1(rs1),
		.raddr2(rs2),
		.rdata1(rdata1),
		.rdata2(rdata2),
		.debug_r0(debug_r0),
        .debug_r1(debug_r1),
        .debug_r2(debug_r2)
	);


    // Fix the ALU connection
    alu alu0(
        .op(opcode[2:0]),
        .a(rdata1),
		.b(rdata2),
        .y(alu_out)
    );
endmodule