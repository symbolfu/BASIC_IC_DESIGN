module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    always @(posedge clk) begin
        if (reset)
            ena <= 3'b0;
        else begin 
            if (q[3:0]==4'd8)
                ena[1] <= 1'b1;
            else
                ena[1] <= 1'b0;
            if (q[3:0]==4'd8 && q[7:4]==4'd9)
                ena[2] <= 1'b1;
            else
                ena[2] <= 1'b0;
            if (q[3:0]==4'd8 && q[7:4]==4'd9 &&q[11:8]==4'd9)
                ena[3] <= 1'b1;
            else
                ena[3] <= 1'b0;
        end
    end
    decade_cnt cnt0(clk,reset,1'b1,q[3:0]);
    decade_cnt cnt1(clk,reset,ena[1],q[7:4]);
    decade_cnt cnt2(clk,reset,ena[2],q[11:8]);
    decade_cnt cnt3(clk,reset,ena[3],q[15:12]);

endmodule

module decade_cnt (
    input clk,
    input reset,
    input enable,
    output [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0;
        else if (enable) begin
            if (q==4'd9)
                q <= 4'b0;
            else
                q <= q+1'b1;
        end
        else
            q <= q;
    end 
endmodule