`timescale 1ns/1ns
include "find.v"
module hashing_tb();
wire [7:0] a1[7:0][0:2];
wire [7:0] a [9:0];
wire [7:0] b [9:0];
wire value;
main uut(.a1(a),.b1(b),.a2(a1),.value(value));
initial begin
    value<=19;
    #20;
    value<=58;
    #20;
    value<=10;

end
endmodule
