// 占空比为4/7， 输出周期为输入时钟的7倍

module odd_freq_div_no50_duty(
    input           i_clk,
    input           i_rst_n,
    output reg      o_clk
);

    reg [1:0] cnt;

    // conter 逻辑
    always @(posedge i_clk or negedge i_rst_n) begin
        if (! i_rst_n)
            cnt <= 2'b00;
        else if (o_clk && cnt == 2'b11)    
            cnt <= 2'b00;
        else if (!o_clk && cnt == 2'b10)
            cnt <= 2'b00;
        else
            cnt <= cnt + 2'b01;
    end

    // clk翻转逻辑
    always @(posedge i_clk or negedge i_rst_n) begin
        if (! i_rst_n)
            o_clk <= 1'b0;
        else if (o_clk && (cnt == 2'b11))
            o_clk <= 1'b0;
        else if (!o_clk && (cnt == 2'b10))
            o_clk <= 1'b1;
    end


endmodule