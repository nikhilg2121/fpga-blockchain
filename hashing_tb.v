`include "Hashing.v"
`timescale 1ns/1ns

module tb;

reg [31:0] val;
hashing test (val);

initial begin
    val=70;
    // test.table1_filled[in]=1;

    #10
    for (integer i=0 ; i<20 ;i++) begin
        $display("%d : %d %d   %d : %d %d", i , test.table1_filled[i] , test.table1[i]
        , i , test.table2_filled[i] , test.table2[i]);
    end;
end

endmodule



// module index_tb;

// reg [31:0] num;
// wire [4:0] i1,i2;

// index_calc test (num , i1 , i2);

// initial begin
//     num=87;
// end

// initial begin
//     $monitor("%d: i1=%d i2=%d",num,i1,i2);
// end
// endmodule