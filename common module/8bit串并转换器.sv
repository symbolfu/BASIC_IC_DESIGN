// 8 bit 串并转换器
// 8bit parallel to serial converter


module paral_to_serial (
    input               i_clk,
    input               i_rst_n,
    input   [7:0]       i_pdata,
    input               i_en,
    output              o_sync,     // 表示传输到最后一位
    output              o_sdata
);

    reg [2:0]   ps_cnt;

    // counter（8）
    always @(posedge i_clk or negedge i_rst_n) begin
        if(! i_rst_n)
            ps_cnt <= 3'b000;
        else if (ps_cnt === 3'b111)
            ps_cnt <= 3'b000;
        else
            ps_cnt <= ps_cnt + 3'b001;
    end

    assign o_sdata = (ps_cnt == 3'b000) ? i_pdata[0] :
                     (ps_cnt == 3'b001) ? i_pdata[1] :
                     (ps_cnt == 3'b010) ? i_pdata[2] :
                     (ps_cnt == 3'b011) ? i_pdata[3] :
                     (ps_cnt == 3'b100) ? i_pdata[4] :
                     (ps_cnt == 3'b101) ? i_pdata[5] :
                     (ps_cnt == 3'b110) ? i_pdata[6] :
                     (ps_cnt == 3'b111) ? i_pdata[7] : 1'b0;

    assign o_sync = (ps_cnt == 3'b111) ? 1'b1 : 1'b0;

endmodule
