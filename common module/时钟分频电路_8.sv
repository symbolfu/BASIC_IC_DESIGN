// 电路实现8分频，占空比50%

module 8_freq_div(
    input           i_clk,
    input           i_rst_n,
    output  reg     o_clk
);

    reg [1:0] cnt;
    
    // counter （4）
    always @(posedge i_clk or negedge i_rst_n) begin
        if (! i_rst_n)
            cnt <= 2'b00;
        else
            cnt <= cnt + 2'b01;
    end

    // clk 翻转逻辑
    always @(posedge i_clk or negedge i_rst_n) begin
        if (! i_rst_n)
            o_clk <= 1'b0;
        else if (cnt == 2'b11)
            o_clk <= ~o_clk;
    end

endmodule