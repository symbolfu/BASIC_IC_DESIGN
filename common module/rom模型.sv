// simple ROM model

module rom_case(
    input [2:0]         i_sel,       // rom addr signal, rom deep is 8
    output reg [3:0]    o_dat
);

    always @(i_sel) begin
        case (i_sel)
            3'000: o_dat = 4'b1001; 
            3'001: o_dat = 4'b1011;
            3'010: o_dat = 4'b0010;
            3'011: o_dat = 4'b0011;
            3'100: o_dat = 4'b1110;
            default: o_dat = 4'b0000;
        endcase
    end

endmodule