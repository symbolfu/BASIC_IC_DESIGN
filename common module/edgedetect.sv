module edgedetect (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);

    reg [7:0] in_state;

    always @(posedge clk) begin
        in_state <= in;
        pedge <= in & ~in_state;
    end

endmodule