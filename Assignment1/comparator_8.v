`include "comparator.v"
module comparator_8(A,B,e,g,l);
input [7:0] A;
input [7:0] B;
wire [7:0] E;
wire [7:0] G;
wire [7:0] L;
output e,g,l;
comparator c0(A[7],B[7],E[7],G[7],L[7]);
comparator c1(A[6],B[6],E[6],G[6],L[6]);
comparator c2(A[5],B[5],E[5],G[5],L[5]);
comparator c3(A[4],B[4],E[4],G[4],L[4]);
comparator c4(A[3],B[3],E[3],G[3],L[3]);
comparator c5(A[2],B[2],E[2],G[2],L[2]);
comparator c6(A[1],B[1],E[1],G[1],L[1]);
comparator c7(A[0],B[0],E[0],G[0],L[0]);
assign e=E[7]&E[6]&E[5]&E[4]&E[3]&E[2]&E[1]&E[0];
assign g=G[7]|(E[7]&(G[6]|(E[6]&(G[5]|(E[5]&(G[4]|(E[4]&(G[3]|(E[3]&(G[2]|(E[2]&(G[1]|(E[1]&G[0])))))))))))));
assign l=!(e|g);
endmodule
