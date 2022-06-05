`timescale 1ns/1ns
`include "hbd.v"

module tb_hbd;
hba here(.a(A),.b(B),.c(C),.z(Z));

reg A;
reg B;
wire C;
wire Z;

initial begin
 $dumpfile("tb_hbd.vcd");
 $dumpvars(0,here);
 #20
  A=0; B=0;
  #20;
  $display("%0d %0d %0d %0d",A,B,C,Z);
  #20;
  A=1; B=0;
   #20;
   $display("%0d %0d %0d %0d",A,B,C,Z);
  #20;
  A=0; B=1;
   #20;
  $display("%0d %0d %0d %0d",A,B,C,Z);
  #20;
  A=1; B=1;
  #20;
  $display("%0d %0d %0d %0d",A,B,C,Z);
  #20;
  $display("Done.");

end

endmodule