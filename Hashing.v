`timescale 1ns/1ns


module index_calc (input [31:0] num , output [4:0] i1 , output [4:0] i2);

assign i1= (num*num*num)%20;
assign i2= ((2**num)+num)%20;
endmodule

module hashing (val );

input wire [31:0] val;

reg clk;

reg [31:0] table1 [19:0];
reg table1_filled [19:0];
reg [31:0] table2 [19:0];
reg table2_filled [19:0];

reg [31:0] num,temp;
wire [4:0] i1,i2;

reg status , completed , flag;

index_calc index (num , i1 ,i2);

initial begin

    status<=0;
    completed<=0;
    clk<=0;
    for (integer i=0 ; i<20 ; i=i+1) begin
    table1_filled [i] = 0 ;
    table2_filled [i] = 0 ;
    table1 [i] = 0 ;
    table2 [i] = 0 ;
end;

#1;
table1 [4] <= 14 ;  table1_filled [4] <=1;
table1 [9] <= 89;  table1_filled [9] <=1;
table1 [12] <=48 ;  table1_filled [12]<=1;
table1 [16] <=76;  table1_filled [16] <=1;
table1 [17] <=13;  table1_filled [17] <=1;

table2 [2] <= 82 ;  table2_filled [2]<=1;
table2 [10] <= 70 ;  table2_filled [10]<=1;
table2 [19] <=11 ;  table2_filled [19]<=1;
table2 [11] <=91 ;  table2_filled [11] <=1;
table2 [5] <=13;  table2_filled [5] <=1;

    // for (i=0 ; i<20 ;i++) begin
    //     $display("%d : %b %b", i , table1_filled[i] , table1[i]);

    // end;    
end

always #2 clk=~clk;

always @(status) begin
    #20
    $display("always block entered");
    if (completed == 1) begin
         $finish;
    end
    else if (status == 0 ) begin
        $display("if block entered");
        flag = table1_filled[i1];
        $display("%d",i1);
        if (flag==0) begin
            $display("if block entered");
            table1[i1]=num;
            table1_filled[i1]=1'b1;
            completed = 1;
        end
        else begin
            temp=table1[i1];
            table1[i1]=num;
            num=temp;
            status=~status;
        end
    end

    else if (status == 1) begin
        if (table2_filled[i2]==0) begin
            table2[i2]=num;
            table2_filled[i1]=1;
            completed = 1;
        end
        else begin
            temp=table2[i2];
            table2[i2]=num;
            num=temp;
            status=~status;
        end
    end
end   
endmodule;

