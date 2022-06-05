`timescale 1ns/1ns
`include "fbd.v"

module tb_fbd;
fba here(.a(A),.b(B),.cin(CIN),.co(CO),.z(Z));

reg A;
reg B;
reg CIN;
wire CO;
wire Z;

initial begin
 $dumpfile("tb_fbd.vcd");
 $dumpvars(0,here);
 #20
  A=0;
   B=0;
 CIN=0;
  #20;
  $display("%0d %0d %0d %0d %0d",A,B,CIN,Z,CO);
  #20
  A=1; B=0;CIN=0;
  #20;
  $display("%0d %0d %0d %0d %0d",A,B,CIN,Z,CO);
  #20
  A=0; B=1;CIN=0;
  #20;
  $display("%0d %0d %0d %0d %0d",A,B,CIN,Z,CO);
  #20
  A=0; B=0;CIN=1;
  #20;
  $display("%0d %0d %0d %0d %0d",A,B,CIN,Z,CO);
  #20
  A=1; B=1;CIN=0;
  #20;
  $display("%0d %0d %0d %0d %0d",A,B,CIN,Z,CO);
  #20
  A=1; B=0;CIN=1;
  #20;
  $display("%0d %0d %0d %0d %0d",A,B,CIN,Z,CO);
  #20
  A=0; B=1;CIN=1;
  #20;
  $display("%0d %0d %0d %0d %0d",A,B,CIN,Z,CO);
  #20
  A=1; B=1;CIN=1;
  #20;
  $display("%0d %0d %0d %0d %0d",A,B,CIN,Z,CO);
  #20
  $display("Done.");

end

endmodule