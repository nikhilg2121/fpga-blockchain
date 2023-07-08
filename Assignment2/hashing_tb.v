`include "Hashing.v"
`timescale 1ns/1ns

module tb;

reg [31:0] val;
hashing test (val);

initial begin
    $dumpfile("check.vcd");
    $dumpvars(0,test.hashing);

    #20     val=50;          
    #20    val=61;          
    #20    val=44;     
    #20    val=14;        
    #20   val=82;  
        

end

initial begin
    #30
        $display("\n%d added",val);
        for (integer i=0 ; i<20 ;i++) begin
            $display("%d : %d %d   %d : %d %d", i , test.table1_filled[i] , test.table1[i]
            , i , test.table2_filled[i] , test.table2[i]);
        end 

    #20
        $display("\n%d added",val);
        for (integer i=0 ; i<20 ;i++) begin
            $display("%d : %d %d   %d : %d %d", i , test.table1_filled[i] , test.table1[i]
            , i , test.table2_filled[i] , test.table2[i]);
        end 

    #20
        $display("\n%d added",val);
        for (integer i=0 ; i<20 ;i++) begin
            $display("%d : %d %d   %d : %d %d", i , test.table1_filled[i] , test.table1[i]
            , i , test.table2_filled[i] , test.table2[i]);
        end 

    #20
        $display("\n%d added",val);
        for (integer i=0 ; i<20 ;i++) begin
            $display("%d : %d %d   %d : %d %d", i , test.table1_filled[i] , test.table1[i]
            , i , test.table2_filled[i] , test.table2[i]);
        end 

    #20
        $display("\n%d added",val);
        for (integer i=0 ; i<20 ;i++) begin
            $display("%d : %d %d   %d : %d %d", i , test.table1_filled[i] , test.table1[i]
            , i , test.table2_filled[i] , test.table2[i]);
        end   
    $finish;
end
endmodule



// module index_tb;

// reg [31:0] num;
// wire [4:0] i1,i2;

// index_calc test (num , i1 , i2);

// initial begin
//     $dumpfile("check.vcd");
//     $dumpvars(0,index_tb);
//     num=87;
//     $display("%d: i1=%d i2=%d",num,i1,i2);
// end

// initial begin
    
// end
// endmodule