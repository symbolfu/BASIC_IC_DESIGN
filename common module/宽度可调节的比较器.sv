// 宽度可配置的比较器

module comparator #(
    parameter width = 4
) (
    input [width-1:0]       a,
    input [width-1:0]       b,
    output                  agb,
    output                  aeb,
    output                  alb
);
assign agb = (a > b);
assign aeb = (a == b);
assign alb = (a < b);
    
endmodule