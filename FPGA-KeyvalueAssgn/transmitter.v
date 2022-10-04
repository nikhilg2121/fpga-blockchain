`timescale 1ps/1ps
module transmitter (input [7:0] bus , input clk , input tick_in , input rd_en , output data);

integer i=0;
assign data=temp;
reg temp;
wire tick;
reg start;
reg [4:0] counter;

assign tick = tick_in & start;

initial begin
    start<=0;
    temp<=1;
    counter<=0;
end

always @ (negedge rd_en) begin
    start<=1;
    temp<=0;
end

always @(posedge tick) begin

    if (counter < 8) begin
        counter<=counter+1;
    end

    else begin

    if (i>=0 && i<=7) begin
        temp<=bus[i];
        i<=i+1;
        counter<=0;
    end
    else if (i==8) begin
        i<=0;
        temp<=1;
        start<=0;
        counter<=0;
    end
    end
end

endmodule