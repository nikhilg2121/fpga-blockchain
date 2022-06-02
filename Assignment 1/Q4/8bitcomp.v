`include "comparator.v"

module comp8 (
    input [7:0] A,
    input [7:0] B,
    output C);
    
    wire [7:0] temp;

    comp comp1(.a(A[0]), .b(B[0]), .c(temp[0]));
    comp comp2(.a(A[1]), .b(B[1]), .c(temp[1]));
    comp comp3(.a(A[2]), .b(B[2]), .c(temp[2]));
    comp comp4(.a(A[3]), .b(B[3]), .c(temp[3]));
    comp comp5(.a(A[4]), .b(B[4]), .c(temp[4]));
    comp comp6(.a(A[5]), .b(B[5]), .c(temp[5]));
    comp comp7(.a(A[6]), .b(B[6]), .c(temp[6]));
    comp comp8(.a(A[7]), .b(B[7]), .c(temp[7]));

    assign C = temp[0] & temp[1] & temp[2] & temp[3] & temp[4] & temp[5] & temp[6] & temp[7]; 

endmodule