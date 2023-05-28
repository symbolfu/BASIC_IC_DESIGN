// a simpile register

module dff(
    input       i_clk,
    input       i_din,
    output  reg o_dout

);

    always @(posedge i_clk) begin
        o_dout <= i_din;
    end

endmodule