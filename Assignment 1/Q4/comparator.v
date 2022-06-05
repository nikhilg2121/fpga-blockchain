module comp(input a,
            input b,
            output c);
    assign c = ~(a ^ b);
endmodule