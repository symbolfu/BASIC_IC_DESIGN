// 电平触发的ram模型，即锁存器组

module ram_latch(
    input           i_we,
    input   [6:0]   i_addr,
    input   [15:0]  i_dat,
    output  [15:0]  o_dat
);

    reg [15:0]  mem[0:127];

    always @(i_we or i_dat)
        if (i_we) begin
            mem[i_addr] <= i_dat;
        end

    assign o_dat = mem[i_addr];


endmodule