`timescale 1ps/1ps

module reciever (
    input dcom,
    output reg [7:0] bus
);

reg [7:0]  dr;
reg flag;
reg ander;
reg trigger;
wire sig;
reg init;

//reg init;
//wire try;



initial begin
    flag<=0;
    ander <= 1;
    init <= 0;
    
    trigger <= 1;
end

assign sig = dcom & ander;
//assign try = ~(clk ^ ander);
//assign bus = dr;

always @ (negedge sig) begin
    // if (flag==0) flag=1;
    // else begin
        ander <= 0;
    trigger <= ~trigger;
    // end
end

/*
always @ (negedge try) begin
    dr[]
end
*/

always @ (trigger) begin
    if(init == 0)  init <= 1;

    else begin

        #52083;

    //end
    for (integer i = 0; i<9; i+=1) begin
        if(i == 0) begin 
            #104166;
        end
        else begin
            dr[i-1] = dcom;
            #104166;
        end
    end
    bus <= dr;
    ander <= 1;
end
end
endmodule