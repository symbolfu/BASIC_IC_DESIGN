// simple latch

module latch (
    input           i_en,
    input           i_din,
    output reg      o_dout
);

    always @(i_din or i_en)
        if (i_en)
            o_dout <= i_din;


endmodule