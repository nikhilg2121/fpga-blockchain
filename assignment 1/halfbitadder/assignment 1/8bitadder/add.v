//`include "fbd.v"
//`include "hbd.v"

module fba(a,b,cin,co,z);
input a;
input b;
input cin;
output z;
output co;
assign z= (a^b)^cin;
assign co= ( a & b) | (( a ^ b) & cin);

endmodule

module hba(a,b,c,z);
input a;
input b;
output z;
output c;
assign z= a^b;
assign c= a&b;

endmodule

module ebit(input  wire [7:0] a,
input  wire [7:0] b,
output wire [7:0] c);

wire [6:0] carry;

hba s1(a[0],b[0],carry[0],c[0]);
fba s2(a[1],b[1],carry[0],carry[1],c[1]);
fba s3(a[2],b[2],carry[1],carry[2],c[2]);
fba s4(a[3],b[3],carry[2],carry[3],c[3]);
fba s5(a[4],b[4],carry[3],carry[4],c[4]);
fba s6(a[5],b[5],carry[4],carry[5],c[5]);
fba s7(a[6],b[6],carry[5],carry[6],c[6]);
assign c[7]=carry[6];






endmodule