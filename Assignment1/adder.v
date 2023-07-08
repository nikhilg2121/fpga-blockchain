module one_bit_full_adder(C_out,S,A,B,C_in);


    input A,B,C_in;
    output C_out,S;

    assign S=(A^B)^C_in;
    assign C_out=(A&B)|(B&C_in)|(C_in&A);

endmodule