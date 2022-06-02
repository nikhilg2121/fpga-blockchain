module fulladder(input a,   //first bit
                 input b,   //second bit
                 input cin, //input carry
                 output cout, //output carry
                 output o); //output sum
    assign o = (a ^ b) ^ cin;
    assign cout = (a & b) | (a | b) & cin;

endmodule
