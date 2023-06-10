/*
    A "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 3-bit input vector
*/

module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    always @(in) begin
        case (in)
            3'b000: out = 2'b00;
            3'b001: out = 2'b01;
            3'b010: out = 2'b01;
            3'b011: out = 2'b10;
            3'b100: out = 2'b01;
            3'b101: out = 2'b10;
            3'b110: out = 2'b10;
            3'b111: out = 2'b11;
            default: out = 2'bxx;
        endcase        
    end
    
endmodule


module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i;
    always@(*)begin
        out = 0;
        for(i=0;i<255;i=i+1)begin
            if(in[i])begin
                out = out + 1;
            end
            else begin
                out = out;
            end
        end
    end
 
endmodule


module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i;
    always@(*)begin
        out = 1'b0;  // out = 8'b00000000;也可以 就是一定要对out使用之前赋初值
        for(i=0;i< 255;i=i+1)begin
            out = out + in[i];  
        end  
    end
 
endmodule

/*
    generate用法:
        generate可以用来构成循环语句，但是必须要定义genvar作为循环变量;
        结尾必须接上endgenerate

    genvar i;
    generate
        for(i=0;i<n;i=i+1)
            begin: label
                ...
                ...
            end
    endgenerate
*/