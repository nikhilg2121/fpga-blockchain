module eight_bit_adder (input [7:0] a , input [7:0] b , output [7:0] s , output c);
wire t[7:0];
fulladder s0 (a[0] , b[0] ,  1'b0   , s[0] , t[0] );
fulladder s1 (a[1] , b[1] , t[0] , s[1] , t[1] );
fulladder s2 (a[2] , b[2] , t[1] , s[2] , t[2] );
fulladder s3 (a[3] , b[3] , t[2] , s[3] , t[3] );
fulladder s4 (a[4] , b[4] , t[3] , s[4] , t[4] );
fulladder s5 (a[5] , b[5] , t[4] , s[5] , t[5] );
fulladder s6 (a[6] , b[6] , t[5] , s[6] , t[6] );
fulladder s7 (a[7] , b[7] , t[6] , s[7] , t[7] );
assign c=t[7];

endmodule

module fulladder (input a , input b , input cin , output s , output cout);
wire t;
assign t = (a^b);
assign s = t^cin;
assign cout = (a&b) | (t&cin);
endmodule