// 时钟上升沿触发的ram模型，且共享数据端口

module ram_tri(
    input           i_clk,
    input           i_we,
    input   [6:0]   i_addr,
    inout   [15:0]  io_data
);

    reg [15:0]  mem[0:127];

    always @(posedge i_clk)
        if (i_we) begin
            mem[i_addr] <= io_data;
        end

    assign o_dat = (~i_we) ? mem[i_addr] : 8'hzz;


endmodule