/*
Design a 1-12 counter with the following inputs and outputs:

Reset Synchronous active-high reset that forces the counter to 1
Enable Set high for the counter to run
Clk Positive edge-triggered clock input
Q[3:0] The output of the counter
c_enable, c_load, c_d[3:0] Control signals going to the provided 4-bit counter, so correct operation can be verified.
You have the following components available:

the 4-bit binary counter (count4) below, which has Enable and synchronous parallel-load inputs (load has higher priority than enable).
 The count4 module is provided to you. Instantiate it in your circuit.
logic gates
module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);
The c_enable, c_load, and c_d outputs are the signals that go to the internal counter's enable, load, and d inputs, respectively. 
Their purpose is to allow these signals to be checked for correctness.
这个题目：提供了你一个counter，需要通过外围电路去控制counter，让其转变为符合要求的counter
*/

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
    always@(*) begin
        if(reset == 1'b1)
            begin
                c_load <= 1'b1;
                c_d	<= 4'd1;
            end
        else
            begin
                c_load <= 1'b0;
                c_d <= 4'd0;
                if((enable == 1'b1) && (Q == 4'd12))
                    begin
                        c_load <= 1'b1;
                        c_d <= 4'd1;
                    end
            end
    end
    assign	c_enable = enable;
    	
    count4	count4_inst(
        .clk	(clk)	,
        .enable	(enable),
        .load	(c_load),
        .d		(c_d)	,
        .Q		(Q)
    );

endmodule

