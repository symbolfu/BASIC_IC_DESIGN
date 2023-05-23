// 带异步复位的D触发器

module dff_reg(
    input       i_reset_n,
    input       i_clk,
    input       i_d,
    input reg   o_q
    );

    always @(negedge i_reset_n or posedge i_clk) begin
        if (!i_reset_n)
            o_q <= 1'b0;   // 时序逻辑使用非阻塞的过程赋值
        else 
            o_q <= i_d;
    end


endmodule