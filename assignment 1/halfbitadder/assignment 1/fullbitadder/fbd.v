module fba(a,b,cin,co,z);
input a;
input b;
input cin;
output z;
output co;
assign z= (a^b)^cin;
assign co= ( a & b) | (( a ^ b) & cin);

endmodule