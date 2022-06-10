`timescale 1ns/1ns
`include "Q4.v"

module tb;

reg [7:0] a,b;
wire p,q,r;

eight_bit_comp test(a,b,p,q,r);

initial begin
    a=10;
    b=13;
end

initial begin
    $monitor ("%b %b %b",p,q,r);
end
endmodule