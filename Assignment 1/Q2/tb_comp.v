`include "comparator.v"
`timescale 1ns/1ns

module tb;

    reg A;
    reg B;
    wire C;

    comp comp1(.a(A), .b(B), .c(C));

    initial begin
        $dumpfile("tb_comp.vcd");
        $dumpvars(0,tb);
        $monitor("a = %d, b = %d, c = %d", A, B, C);

        for (integer i = 0; i< 2 ; i= i+1) begin
            for(integer j = 0; j< 2; j = j+1) begin
                A <= j;
                B <= i;
                #10;
            end
        end
    end

endmodule