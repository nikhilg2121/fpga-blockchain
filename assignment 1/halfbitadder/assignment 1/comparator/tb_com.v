`timescale 1ns/1ns
`include "com.v"


module tb_com;

com here(.a(A),.b(B),.c(C));
reg A;
reg B;
wire C;

initial begin
    $dumpfile("tb_com.vcd");
 $dumpvars(0,here);
 A=0;
   B=0;
  #20;
  $display("%0d",C);
  A=1;
   B=0;
  #20;
  $display("%0d",C);
  A=0;
   B=1;
  #20;
  $display("%0d",C);
  A=1;
   B=1;
  #20;
  $display("%0d",C);
end
    
endmodule
