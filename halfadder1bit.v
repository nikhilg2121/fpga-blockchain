module adder(input a,b,output cout,sum);
assign sum=(a^b);
assign carry2=(a&b);
endmodule
//test bench code starts
module test_bench;
reg a;
reg b;
wire cout;
wire sum;
adder UUT(.a(a),.b(b),.cout(cout),.sum(sum));
initial begin
a=0;
b=0;
#10;
a=1;
b=0;
#10;
a=0;
b=1;
#10;
a=1;
b=1;
#10;
end
endmodule

