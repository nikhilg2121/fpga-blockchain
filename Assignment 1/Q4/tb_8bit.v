`include "8bitcomp.v"
`timescale 1ns/1ns

module tb;

    reg [7:0] first;
    reg [7:0] second;
    wire o;

    comp8 c0(.A(first), .B(second), .C(o));

    initial begin
        $dumpfile("tb_8bit.vcd");
        $dumpvars(0, tb);
        $monitor("first = %d, second = %d, output = %d", first, second, o);

        first <= 8'b1011_0110;
        second <= 8'b1011_0110;
        #10;

        first <= 8'b1111_1110;
        second <= 8'b1111_1110;
        #10;

        first <= 8'b1010_1001;
        second <= 8'b1111_1110;
        #10;

        first <= $random%256;
        second <= $random%256;
        #10;
    end

endmodule