// 2-4 译码器

module binary_decoder_2_4 (
    input               i_en,
    input      [1:0]    i_dec,
    output reg [3:0]    o_dec 
);

    always @(i_en or i_dec) begin
        if (i_en) begin
            case (i_dec)
                2'b00: o_dec = 4'b0001; 
                2'b01: o_dec = 4'b0010; 
                2'b10: o_dec = 4'b0100; 
                2'b11: o_dec = 4'b1000; 
                default: o_dec = 4'bxxxx;
            endcase
        end
        else
            o_dec = 4'b0000;
    end

endmodule