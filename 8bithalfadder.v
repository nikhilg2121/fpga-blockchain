module halfadder(input a[7:0],input b[7:0],output d[7:0],output c[7:0]);
//reg c[7:0];
assign d[7]=a[7]^b[7];
assign c[7]=a[7]&b[7];
assign d[6]=a[6] ^ b[6];
assign c[6]=a[6]&b[6];
assign d[5]=a[5] ^ b[5];
assign c[5]=a[5]&b[5];
assign d[4]=a[4] ^ b[4];
assign c[4]=a[4]& b[4];
assign d[3]=a[3] ^ b[3];
assign c[3]=a[3]&b[3];
assign d[2]=a[2] ^ b[2];
assign c[2]=a[2]&b[2];
assign d[1]=a[1] ^ b[1];
assign c[1]=a[1]&b[1];
assign d[0]=a[0] ^ b[0];
assign c[0]=a[0]&b[0];
endmodule
//test bench starts
reg[7:0]a;
reg[7:0]b;
wire [7:0] d;
