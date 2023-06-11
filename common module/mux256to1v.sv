module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    // error: 上界不能为变量
    // assign out = in[sel * 4 + 3 : sel * 4];

    // 方法1:等价于 in[sel * 4 + 3 : sel * 4]
    // 格式：data[begin +: width] 等价于： data[(begin + width -1): begin]
    assign out = in[sel*4 +: 4];

    // 方法2：
    assign out = {in[sel * 4 + 3], in[sel * 4 + 2], in[sel * 4 + 1], in[sel * 4]};

    // 方法3：data[end   -: width] 等价于：data[end :(end-width+1)]
    assign out = in[sel*4 + 3 -: 4];


endmodule