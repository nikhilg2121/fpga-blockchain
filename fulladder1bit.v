module adder(input a,b,cin,output cout,sum);
assign sum=(a^b)^cin;
assign cout=(a&b)|(cin&b)|(cin&a);
endmodule
//test bench code starts
module check;
reg a;
reg b;
reg cin;
wire cout;
wire sum;
 adder UUT(.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum));
initial begin
    a=0;
    b=0;
    cin=0;
    #10;
    a=0;
    b=1;
    cin=0;
    #10;
    a=0;
    b=0;
    cin=1;
    #10;
    a=0;
    b=1;
    cin=1;
    #10;
    a=1;
    b=0;
    cin=0;
    #10;
    a=1;
    b=1;
    cin=0;
    #10;
    a=1;
    b=0;
    cin=1;
    #10;
    a=1;
    b=1;
    cin=1;
    #10;
end
endmodule
