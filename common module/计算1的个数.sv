module counter_1(
    input [7:0] data_in,
    output [3:0] out
);

    reg [3:0] width;
    reg [3:0] cnt;

    always @(data_in) begin
        cnt = 'd0;
        for (width = 0;width < 8 ;width = width + 1 ) begin
            if (data_in[width])
                cnt = cnt + 1;
            else
                cnt = cnt;
        end
    end

    assign out = cnt;


endmodule

// 方法3：
module counter_1(
    input [7:0] data_in,
    output [3:0] out
);

    assign out = data_in[0] + data_in[1] + data_in[2] + data_in[3] + data_in[4] + data_in[5] + data_in[6] + data_in[7];

endmodule



// 方法2：
/*
    用了一个分治的思想，用按位操作替代加法操作，这样用的资源会比直接将输入data的8bit数据逐一相加用的资源更少;
        实现原理就是用多次的按位与操作实现加法:
            第一次按位与，实现了将data的0,1bit相加存储在data1的[0:1]bit位，data的2,3bit相加存储在data1的[2:3]bit位，data的4,5bit相加存储在data1的[4:5]bit位，data的6,7bit相加存储在data1的[6:7]bit位;
            第二次按位与，实现了data1[0:1]bit + data1[2:3]bit；存储在data2的[3:0]bit位，将data1[4:5]bit + data1[6:7]bit；存储在data2的[7:4]bit位;
            第三次按位与，实现了data2的[3:0]+data2[7:4];
*/

module find_num_1(
    input [7:0]data,
    output [7:0]number
);
 
    parameter m1 = 8'b01010101;
    parameter m2 = 8'b00110011;
    parameter m3 = 8'b00001111;

    wire [7:0]data1;
    wire [7:0]data2;
    
    assign data1 = (data & m1) + ({data[0],data[7:1]} & m1);
    assign data2 = (data1 & m2) + ({data1[1:0],data1[7:2]} & m2);
    assign number = (data2 & m3) + ({data2[3:0],data2[7:4]} & m3);

endmodule