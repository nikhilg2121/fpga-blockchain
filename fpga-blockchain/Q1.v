module halfadder (input a , input b , output c , output s);
assign s=a^b;
assign c=a&b;
endmodule

module fulladder (input a , input b , input cin , output cout , output s);

assign {cout,s}=a+b+c;


endmodule