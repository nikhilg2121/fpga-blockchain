module halfadder(input a,   //first bit
                 input b,   //second bit
                 output carry,  
                 output o); //output sum
    assign o = a ^ b;
    assign carry = a & b;

endmodule
