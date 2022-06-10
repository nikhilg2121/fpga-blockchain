module comparator (input a, input b, output a_greater , output b_greater , output equal);
wire t;
assign t=a^b;
assign a_greater= a&t;
assign b_greater= b&t;
assign equal = !t;
endmodule