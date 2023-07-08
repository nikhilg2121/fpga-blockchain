`timescale 1ns/1ns


module index_calc (input [31:0] num , output [4:0] i1 , output [4:0] i2);

assign i1= ((num%20)*(num%20)*(num%20))%20;
assign i2= ((2**num)+num)%20;
endmodule

module hashing (input [31:0] val);

reg [31:0] table1 [19:0];
reg table1_filled [19:0];
reg [31:0] table2 [19:0];
reg table2_filled [19:0];

reg [31:0] num;
reg [31:0] temp;
wire [4:0] i1,i2;

reg status , completed , clk;

index_calc index (num , i1 ,i2);


initial begin
     clk<=0;  
    
    for (integer i=0 ; i<20 ; i=i+1) begin
    table1_filled [i] <= 0 ;
    table2_filled [i] <= 0 ;
    table1 [i] <= 0 ;
    table2 [i] <= 0 ;
    end;

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

always #20 clk=~clk;
always @(val) begin
    force num=val;
    status<=0;
    completed<=0;
end

always @(status or negedge completed) begin
    
    // $display("always block entered");


    if (status == 0 ) begin
        // $display("if block entered");
        
        
        if (table1_filled[i1]==1) begin
            // $display("if block entered");
            release num;
            table1[i1]<=num;
            num<=table1[i1];
            status <= ~ status;            
        end

        else begin
            //temp=table1[i1];
            // $display("%b",i1);
            // $display("this block");
            table1[i1]<=num;
            table1_filled[i1]<=1'b1;
            completed <= 1;
        end
    end

    else if (status == 1) begin
        if (table2_filled[i2]==1) begin
            release num;
            table2[i2]<=num;
            num<=table2[i2];
            status=~status;            
        end
        else begin
            table2[i2]<=num;
            table2_filled[i2]<=1;
            completed <= 1; 
        end
    end
end   
endmodule;

