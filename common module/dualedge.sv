module top_module (
    input clk,
    input d,
    output q
);

    // 这种算法会出现毛刺问题
    reg q_1;
    reg q_2;

    always @(posedge clk) begin
        q_1 <= d;
    end

    always @(negedge clk) begin
        q_2 <= d;
    end

    assign q = clk ? q_1 : q_2;

endmodule

// 方法2： 解决毛刺问题
// 利用异或消除特性
//  方法1 存在毛刺时因为assign中使用了clk，导致逻辑中存在时序问题；
//      思考：如何去掉assign中的clk
//              上升沿产生的信号可以和下降沿产生的信号做某种逻辑运算，使其产生正常的d；
//              因为两个always语句不可能同时触发，除了reset；
//              即可用利用异或操作相消: 假设在上升沿时， p = d ^ n, 此时的n是上一次下降沿产生的，会保存到下一次下降沿到来， 所有  p ^ n 等价于 p ^ n ^ n => p
module TwoEdge(
    input clk,
    input rst_n,
    input d,
    input out
 
);
 
reg p, n;
 
always@(posedge clk or negedge rst_n) begin
    if(~rst_n) 
        p <= 0;    
    else 
        p <= d ^ n;
end
 
always@(negedge clk or negedge rst_n) begin
    if(~rst_n) 
        n <= 0;
    else 
        n <= d ^ p;
end
 
assign out = p ^ n;          
 
endmodule