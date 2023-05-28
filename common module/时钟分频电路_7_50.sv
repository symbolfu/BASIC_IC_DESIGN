// 占空比为50%， 7分频

module odd_freq_div_50_duty(
    input                   i_clk,
    input                   i_rst_n,
    output                  o_clk
);

    reg [2:0] cnt;
    reg       clk_pos;
    reg       clk_neg;

    // conter
    always @(posedge i_clk or negedge i_rst_n) begin
        if (! i_rst_n)
            cnt <= 3'd0;
        else if (cnt == 3'd6)
            cnt <= 3'd0;
        else
            cnt <= cnt + 3'd1;
    end

    always @(posedge clk or negedge i_rst_n) begin
        if (! i_rst_n)
            clk_pos <= 1'b0;
        else if (cnt == 3'd0)
            clk_pos <= ~ clk_pos;
    end

    always @(posedge clk or negedge i_rst_n) begin
         if (! i_rst_n)
            clk_neg <= 1'b0;
        else if (cnt == 3'd4)
            clk_neg <= ~ clk_neg;       
    end

    assign o_clk = clk_neg ^ clk_pos;







endmodule