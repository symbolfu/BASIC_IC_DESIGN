// 4-2编码器

module binary_encoder_4_2 (
    input   [3:0]       i_dec,
    input   [1:0]       o_dec
);

    assign o_dec =  (i_dec == 4'b0001) ? 2'b00 :
                    (i_dec == 4'b0010) ? 2'b01 :
                    (i_dec == 4'b0100) ? 2'b10 :
                    (i_dec == 4'10000) ? 2'b11 : 2'bxx;
    
endmodule