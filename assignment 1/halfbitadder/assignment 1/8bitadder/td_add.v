`timescale 1ns/1ns
`include "add.v"

module tb_add;
ebit here(.a(A),.b(B),.c(C));

reg [7:0]A;
reg [7:0]B;
wire [7:0] C;

initial begin
 $dumpfile("tb_add.vcd");
 $dumpvars(0,here);

 #20
 A= 8'b01010100;
 B= 8'b01010100;
 #20
 $display("c= %0b",C);
 #20
 A= 8'b01010110;
 B= 8'b01010100;
 #20
 $display("c= %0b",C);
 #20
 A= 8'b01010100;
 B= 8'b01010111;
 #20
 $display("c= %0b",C);
 #20
 A= 8'b01110100;
 B= 8'b01011100;
 #20
 $display("c= %0b",C);
 #20
 A= 8'b01010100;
 B= 8'b01000100;
 #20
 $display("c= %0b",C);
 #20
 A= 8'b01010100;
 B= 8'b01111111;
 #20
 $display("c= %0b",C);
 $display("done",C);

end

endmodule