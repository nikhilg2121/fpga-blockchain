
module comp(input [7:0]a,input [7:0]b,output c,output d,output e);
assign c=(a>b)?1:0;
assign d=(a==b)?1:0;
assign e=(a>b)?1:0;
endmodule
//test bench starts
module test_bench;
reg [7:0]a;
reg [7:0]b;
 comp UUT(.a(a),.b(b),.c(c),.d(d),.e(e));
initial
begin
    a=4'b1111;
    b=4'b1000;
    #10
     a=4'b1100;
     b=4'b1100;
    #10
     a=4'b0011;
     b=4'b1100;
     #10;
end
endmodule

