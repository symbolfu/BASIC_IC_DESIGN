// 四位加法器
// 使用连续赋值方式

module adder_4 (
    input [3:0]  a,
    input [3:0]  b,
    input        cin,
    output [3:0] sum,
    output       cout
    );
    
    assign {count, sum} = a + b + cin;

endmodule

