`timescale 1ns/1ns

module reciever (
    input dcom,
    input clk,
    input tick_in,
    output reg [7:0] bus,
    output reg newbyt
);

reg [7:0]  dr;
reg ander;
reg tickstart;
wire tick;
reg trigger;
reg [4:0] counter;
wire sig;
reg [4:0] bitno;
reg init;
reg read;

initial begin
    ander <= 1;
    init <= 0;
    counter <= 0;
    bitno <= 0;
    tickstart <= 0;
    read <= 1;
    trigger <= 1;
    dr<= 0;
    newbyt <= 0;
end

assign sig = dcom & ander;
assign tick = tick_in & tickstart;

always @ (negedge sig) begin
    ander <= 0;
    tickstart <= 1;
    read <= 1;
    //trigger <= ~trigger;
end

always @ (posedge tick) begin
    if(counter == 8) begin
        trigger <= ~trigger;
    end
    else begin
        counter <= counter +1;
    end
end

always @ (trigger) begin
    if(init == 0)  init <= 1;

    else begin

        // if(bitno == 0) begin
        //     bitno <= bitno +1;
        // end
        // else begin
        if(bitno != 8) begin
            dr <= ((dr)|(dcom<<(bitno)));
            bitno <= bitno +1;
        end

        counter <= 0;
        if(bitno == 8) begin
            bitno <= 0;
            read <= 0;
            ander <= 1;
        end
    end
end
always @ (clk) begin
    if(read == 0) begin
        bus <= dr;
        newbyt <= ~newbyt;
        read <= 1;
        dr<= 0;
        tickstart<=0;
    end
end
endmodule