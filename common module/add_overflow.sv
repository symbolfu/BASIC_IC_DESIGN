/*
    Assume that you have two 8-bit 2's complement numbers, a[7:0] and b[7:0]. 
    These numbers are added to produce s[7:0]. Also compute whether a (signed) overflow has occurred.
*/

/*
    本题讨论的是有符号数相加的溢出问题中，需要实现一个 2 进制 8bit 有符号数加法器，加法器将输入的两个 8bit数补码相加，产生相加之和以及进位;
    有符号数溢出有两种情况：一是正正相加，产生正溢出;另一种情况是负负相减，产生负溢出:
        负数相减（补码相加）产生正数，判断溢出: a[7] && b[7] && ~s[7]
        正数相加产生一个负数，判断溢出: ~a[7] && ~b[7] && s[7]
*/

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
 
    assign s = a + b;
	assign overflow = ( a[7] && b[7] && ~s[7] ) || (~a[7] && ~b[7] && s[7]);
        				
endmodule