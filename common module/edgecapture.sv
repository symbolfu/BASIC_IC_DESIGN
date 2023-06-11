module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    reg [31:0] in_state;
    reg [31:0] out_state;

    
    always @(posedge clk) begin
        if (reset) begin
            out <= 32'h0000_0000;
        end
        else begin
        	out <= out | (~in & in_state);
        end
    end

    always @(posedge clk) begin
        in_state <= in;
    end

endmodule