`timescale 1ns/1ns
`include "ecom.v"

module tb_ecom;
ecom here(.a(A),.b(B),.c(C));

reg [7:0]A;
reg [7:0]B;
wire C;

initial begin
 $dumpfile("tb_ecom.vcd");
 $dumpvars(0,here);

 #20
 A= 1;
 B= 1;
 #20
 $display("%0b",C);
 #20
 A= 8'b01010110;
 B= 8'b01010100;
 #20
 $display("%0b",C);
 #20
 A= 8'b01010100;
 B= 8'b01010111;
 #20
 $display("%0b",C);
 #20
 A= 8'b01110100;
 B= 8'b01011100;
 #20
 $display("%0b",C);
 #20
 A= 8'b01010100;
 B= 8'b01000100;
 #20
 $display("%0b",C);
 #20
 A= 8'b01010100;
 B= 8'b01111111;
 #20
 $display("%0b",C);
 #20
 $display("done");

end

endmodule