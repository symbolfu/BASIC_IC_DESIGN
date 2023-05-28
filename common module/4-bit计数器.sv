// 4 bit counter

module counter_4(
    input           i_clk,
    input           i_rst_n,
    input           i_en,
    output  reg [3:0]   o_cnt,
    output          o_full
);

    always @(posedge i_clk or negedge i_rst_n) begin
        if (i_rst_n)
            o_cnt <= 4'b0000;
        else if (i_en)
            o_cnt <= o_cnt + 4'b0001;
    end

    assign o_full = (o_cnt === 4'b1111);

endmodule