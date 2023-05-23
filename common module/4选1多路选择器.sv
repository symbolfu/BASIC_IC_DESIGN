// 4-1 多路选择器

module mux_4 (
    input       i_din1,
    input       i_din2,
    input       i_din3,
    input       i_din4,
    input [1:0] i_sel,
    output reg  o_q
    );

    always @(i_din1 or i_din2 or i_din3 or i_din4 or i_sel) begin
        case (i_sel)
            2'b00: o_q = i_din1;
            2'b01: o_q = i_din2;
            2'b10: o_q = i_din3;
            2'b11: o_q = i_din4; 
            default: o_q = 1'bx;
        endcase
    end

endmodule