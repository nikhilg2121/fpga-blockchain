module ecom (
    input wire[7:0] a, input wire[7:0] b,output wire c
);

assign c=(~(a[0]^b[0]))&((~(a[1]^b[1]))&((~(a[2]^b[2]))&((~(a[3]^b[3]))&((~(a[4]^b[5]))&((~(a[5]^b[5]))&((~(a[6]^b[6]))&(~(a[7]^b[7]))))))));
    
endmodule