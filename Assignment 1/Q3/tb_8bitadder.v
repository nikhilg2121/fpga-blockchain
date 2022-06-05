`include "8bitadder.v"
`timescale 1ns/1ns

module tb;

reg [7:0] first;
reg [7:0] second;
wire [7:0] out;

bit8 adder1(.A(first), .B(second), .O(out));


initial begin
    $dumpfile("tb_8bitadder.vcd");
    $dumpvars(0,tb);
    $monitor("A = %d, B = %d, A+B = %d, carry = %d", first, second, out, adder1.C[7]);

    for (integer i= 0; i<10 ; i = i+1 ) begin
        first = $random %256;
        second = $random %256;
        #10;
    end
end

endmodule