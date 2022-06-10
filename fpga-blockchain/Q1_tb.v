`include "Q1.v"
`timescale 1ns/1ps

module tb ;

reg a,b;
wire c,s;

halfadder test1 (a , b , c , s);

initial begin
    {a,b}=0;
    #10
    $display ("time=%d : a=%b b=%b s=%b c=%b \n",$time,a,b,s,c);
    

    #10
    {a,b}=1;
    #10 $display ("time=%d : a=%b b=%b s=%b c=%b \n",$time,a,b,s,c);

    #10
    {a,b}=2;
    #10 $display ("time=%d : a=%b b=%b s=%b c=%b \n",$time,a,b,s,c);

    #10
    {a,b}=3;
    #10 $display ("time=%d : a=%b b=%b s=%b c=%b \n",$time,a,b,s,c);
    
end
    
endmodule

