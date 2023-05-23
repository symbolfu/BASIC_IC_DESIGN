// 1-4 分发器

module mux_4 (
    output  reg     o_din1,
    output  reg     o_din2,
    output  reg     o_din3,
    output  reg     o_din4,
    input [1:0] i_sel,
    intput        i_q
    );

    always @(i_q or i_sel) begin
        case (i_sel)
            2'b00: i_din1 = i_q;
            2'b01: i_din2 = i_q;
            2'b10: i_din3 = i_q;
            2'b11: i_din4 = i_q;
            default: i_din1 = i_q;
        endcase
    end

endmodule