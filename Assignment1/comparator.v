module comparator(A,B,E,G,L);
input A,B;
output E,G,L;
assign E=(A==B);
assign G=(A>B);
assign L=(A<B);
endmodule
