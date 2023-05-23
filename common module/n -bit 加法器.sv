// n位加法器
// 使用连续赋值方式

module adder_n (
    input [n_with-1:0]  a,
    input [n_with-1:0]  b,
    input        cin,
    output [n_with-1:0] sum,
    output       cout
    );

    parameter n_with = 4;
    
    assign {count, sum} = a + b + cin;

endmodule

// 行为级描述

module adder_n (
    input [n_with-1:0]  a,
    input [n_with-1:0]  b,
    input        cin,
    output [n_with-1:0] sum,
    output       cout
    );

    parameter n_with = 4;
    
    always @(cin or a or b) begin
        {count, sum} = a + b + cin;
    end

endmodule