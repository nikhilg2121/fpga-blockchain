`include "one_bit_full_adder.v"

module RCA_8(C_out,S,A,B,C_in);
    input [7:0] A;
    input [7:0] B;
    input C_in;
    output C_out;
    output [7:0] S;
    wire w[6:0]; // 6 wires for transferring C_out to C_in of next adder
    adder f1(w[0],S[0],A[0],B[0],C_in);
    adder f2(w[1],S[1],A[1],B[1],w[0]);
    adder f3(w[2],S[2],A[2],B[2],w[1]);
    adder f4(w[3],S[3],A[3],B[3],w[2]);
    adder f5(w[4],S[4],A[4],B[4],w[3]);
    adder f6(w[5],S[5],A[5],B[5],w[4]);
    adder f7(w[6],S[6],A[6],B[6],w[5]);
    adder f8(C_out,S[7],A[7],B[7],w[6]);
endmodule