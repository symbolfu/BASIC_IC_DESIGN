// 时钟上升沿触发的ram模型，即寄存器

module ram_mem(
    input           i_clk,
    input           i_we,
    input   [6:0]   i_addr,
    input   [15:0]  i_dat,
    output  [15:0]  o_dat
);

    reg [15:0]  mem[0:127];

    always @(posedge i_clk)
        if (i_we) begin
            mem[i_addr] <= i_dat;
        end

    assign o_dat = mem[i_addr];


endmodule