`timescale 1ns/1ns
module hashfunc(input [31:0]key,input clk, output reg [31:0] hash1, output reg [31:0] hash2);

reg [31:0] key_in;

always @(key) begin
key_in=key;
hash1=((((key_in*91)%100)*11)-(((key_in*91)%100)*11)%100)/100;
hash2=((((key_in*45)%100)*22)-(((key_in*45)%100)*22)%100)/100;

$display("hash1: %d  hash2: %d ",hash1, hash2 );
end
endmodule

