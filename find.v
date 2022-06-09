include "storage.v"
include "initialize.v"
module main (
    input [7:0] a1 [9:0],
input [7:0] b1 [9:0],input [7:0] a2[7:0][0:2], input value
);
    initialize oot(.a(a1), .b(b1));
    storage uut(.a(a2));
    integer i;
    input i1;
    input i2;
    
    initial begin
    for ( i=0 ;i<8 ;i++ ) begin
        
            if (a2[i][2]==value) begin
            
                i1<=a2[i][0];

                i2<=a2[i][1];

                i=8;

            end

        end

    integer count=0;;
    

     
    while ((a1[i1]!=0 && count%2==0) || (b1[i2]!=0 && count%2!=0)) begin
        
        if (count>=20) begin
            break;
        end



    if (count%2==0) begin
        reg temp=value;
        value=a1[i1];
        a1[i1]=temp;
        count++;

    end

    if (count%2!=0) begin
        reg temp=value;
        value=b1[i2];
        b1[i2]=temp;
        count++;

    end

    for ( i=0 ;i<8 ;i++ ) begin
        
        if (a2[i][2]==value) begin
            
            i1<=a2[i][0];
            i2<=a2[i][1];

            i=8;

        end

    end
    

    end
    end



    
endmodule