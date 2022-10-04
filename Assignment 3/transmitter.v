`timescale 1ps/1ps
module transmitter (input [7:0] bus , output data);

reg clk;
integer i=0;
assign data=temp;
reg temp;
initial begin
    clk<=0;
    
end

always #104166 clk=~clk;

always @(clk) begin

    if (bus=== 8'bxxxxxxxx) temp<=1;

    else if (i==0) begin
        temp<=0;
        i<=i+1;
    end

    else if (i>=1 && i<=8) begin
        temp<=bus[i-1];
        i<=i+1;
    end
    else if (i==9) begin
        i<=0;
        temp<=1;
    end
end

endmodule