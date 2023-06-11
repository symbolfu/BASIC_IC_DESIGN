
module edgedetect2 (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

    reg [7:0] in_state;

    always @(posedge clk) begin
        in_state <= in;
        anyedge <= in_state ^ in;
    end

endmodule
