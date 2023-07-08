`include "transmitter.v"
`include "receiver.v"
`timescale 1ps/1ps

module tb;

reg [7:0] bus_value;
wire [7:0] data_out;
wire signal; 
time freq = 1041660;

transmitter test (bus_value , signal);
reciever rec (signal , data_out);
initial begin

    $dumpfile("check.vcd");
    $dumpvars(0,tb);

    #freq bus_value=12;
    #freq bus_value=45;
    #freq bus_value=09;
    #freq bus_value=67;
    #freq bus_value=101;
    #freq #freq $finish;




end
endmodule