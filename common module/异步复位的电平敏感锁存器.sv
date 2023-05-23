// 带异步复位的电平敏感锁存器

module latch_rst(
    input   i_reset,
    input   i_clk,
    input   i_d,
    output reg o_q
    );

    always @(i_reset or i_clk or i_d) begin
        if (i_reset) begin
            o_q = 1'b0;       // 组合逻辑使用阻塞过程赋值
        end
        else if (clk) begin
            o_q = d;
        end
    end

endmodule