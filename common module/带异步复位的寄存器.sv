// a simple register with asynchronous reset;

module dff_asyn_reset (
    input           i_clk,
    input           i_din,
    input           i_rst_n,
    output reg      i_dout
);

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n)
            o_dout <= 1'b0;
        else
            o_dout <= i_din;
    end
    
endmodule