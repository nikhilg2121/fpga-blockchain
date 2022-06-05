`timescale 1ns/1ns
`include "halfadder.v"

module tb;
    
    reg A, B;
    wire O, CARRY;

    halfadder ha(.a(A), .b(B), .o(O), .carry(CARRY));

    

    initial begin
        $dumpfile("tb_halfadder.vcd");
        $dumpvars(0, tb);
        $monitor("A = %d, B = %d, CARRY = %d, O = %d \n", A, B, CARRY, O);
        for (integer i = 0; i<2 ; i = i+1) begin
            for (integer j = 0; j<2 ; j = j+1) begin
                A <= i;
                B <= j;
                #10;
            end
        end
    end

endmodule