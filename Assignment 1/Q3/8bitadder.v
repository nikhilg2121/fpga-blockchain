`include "fulladder.v"
`include "halfadder.v"

module bit8 (
    input wire [7:0] A, //first input
    input wire [7:0] B, //second input
    output wire [7:0] O
);
    wire [7:0] C;
    halfadder ha(.a(A[0]), .b(B[0]), .o(O[0]), .carry(C[0]));
    fulladder fa1(.a(A[1]), .b(B[1]), .o(O[1]), .cout(C[1]), .cin(C[0]));
    fulladder fa2(.a(A[2]), .b(B[2]), .o(O[2]), .cout(C[2]), .cin(C[1]));
    fulladder fa3(.a(A[3]), .b(B[3]), .o(O[3]), .cout(C[3]), .cin(C[2]));
    fulladder fa4(.a(A[4]), .b(B[4]), .o(O[4]), .cout(C[4]), .cin(C[3]));
    fulladder fa5(.a(A[5]), .b(B[5]), .o(O[5]), .cout(C[5]), .cin(C[4]));
    fulladder fa6(.a(A[6]), .b(B[6]), .o(O[6]), .cout(C[6]), .cin(C[5]));
    fulladder fa7(.a(A[7]), .b(B[7]), .o(O[7]), .cout(C[7]), .cin(C[6]));

endmodule