// 8 bit serial to parallel converter

module serial_to_paral(
    input               i_clk,
    input               i_rst_n,
    input               i_sync,   // 表示接受到最后一位
    input               i_sdata,
    output reg          o_load,   // 数据到达，有效时表示可以采集数据
    output reg [7:0]    o_pdata
);

    // 完成数据shift
    always @(posedge i_clk negedge i_rst_n) begin
        if (! i_rst_n)
            o_pdata <= 8'h00;
        else
            o_pdata <= {i_sdata,o_pdata[7:1]};
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (! i_rst_n)
            o_load <= 1'b0;
        else if (i_sync)
            o_load <= 1'b1;
        else
            o_load <= 1'b0;
    end

endmodule