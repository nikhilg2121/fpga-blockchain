`timescale 1ns/1ns
`include "Q2.v"

module tb ;

reg a,b;
wire p,q,r;
integer i;
comparator test (a , b , p , q , r);

initial begin

    for (i = 0 ; i<4 ; i=i+1 ) begin
        {a,b}=i;
        #10;
    end
        

    
    
end
initial begin
    $monitor ("%b %b  %b %b %b",a,b,p,q,r);
end

endmodule