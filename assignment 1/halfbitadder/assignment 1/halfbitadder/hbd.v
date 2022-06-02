module hba(a,b,c,z);
input a;
input b;
output z;
output c;
assign z= a^b;
assign c= a&b;

endmodule