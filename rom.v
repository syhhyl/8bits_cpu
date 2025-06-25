module rom(
    input [7:0] addr,
    output reg [15:0] data
);
    reg [15:0] mem [0:255];
    integer i;

    initial begin
        // 清空全部内存
        for (i = 0; i < 256; i = i + 1)
            mem[i] = 16'h1111;

        // 初始化寄存器写入的指令（ADD R0, R1, R2）
        // 手动假设 R1=3, R2=5 的值已在寄存器中预先写好
        mem[0] = 16'b0000_000_001_010_000;  // ADD R0, R1, R2
        mem[1] = 16'b0001_010_011_001_000;  // ADD R2, R3, R1
    end

    always @(*) begin
        data = mem[addr];
    end
endmodule