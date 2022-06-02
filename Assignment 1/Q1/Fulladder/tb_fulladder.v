`timescale 1ns/1ns
`include "fulladder.v"

module tb;
    
    reg A, B, CIN;
    wire O, COUT;

    fulladder fa(.a(A), .b(B),.cin(CIN), .o(O), .cout(COUT));

    initial begin
        $dumpfile("tb_fulladder.vcd");
        $dumpvars(0, tb);
        $monitor("A = %d, B = %d, CIN = %d, COUT = %d, O = %d \n", A, B, CIN, COUT, O);
        for (integer k = 0; k<2 ; k = k+1) begin
            for (integer i = 0; i<2 ; i = i+1) begin
                for (integer j = 0; j<2 ; j = j+1) begin
                    A <= i;
                    B <= j;
                    CIN <= k;
                    #10;
                end
            end
        end
    end

endmodule