`timescale 1ns/1ns
`include "Q3.v"

module tb;

reg [7:0] a,b;
wire [7:0] s;
wire c;

eight_bit_adder uut ( .a(a) , .b(b), .s(s) , .c(c) );

initial begin
    a=8'b00001010;
    b=8'b00001101;
end

initial begin
    $monitor ("%d %b",s,c);
end
endmodule