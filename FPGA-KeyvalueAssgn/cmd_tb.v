`include "transmitter.v"
`include "cmdextract.v"
`timescale 1ns/1ns

module tb;

reg [7:0] bus_value;
wire [7:0] data_out;
wire signal; 
time clk_time = 1;
time tick_time = 200;
time freq = 32000;
reg ticker;
reg clock;
reg read_enable;
reg reset;

transmitter test (bus_value , clock , ticker , read_enable , signal);
// receiver_2 rec (signal , ticker , clock , data_out );
extractor rec (signal , clock , ticker, reset);

initial begin
    clock<=0;
    ticker<=0;
    read_enable<=1;
    reset <= 0;
end


initial begin

    $dumpfile("check.vcd");
    $dumpvars(0,tb);

    $monitor("%d", rec.updated_value);
    //for refer
    
    ///*
    #freq;
    #freq;
    #100;

    #freq read_enable=0; bus_value=3;
    #freq  read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq  read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=1;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=23;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;
    //*/
    #freq;
    #freq;
    #freq;
    #100;
    ///*
    #16000;
    reset = ~reset;
    #16000;
    reset = ~reset;
    //*/

    //for transfer
    ///*
    #7356;
    #freq read_enable=0; bus_value=2;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=1;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=23;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=19;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=100;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;
    //*/


    ///*
    #48658;
    #16000;
    reset = ~reset;
    #16000;
    reset = ~reset;
    //*/

    //for create
    ///*
    #5475678;

    #freq read_enable=0; bus_value=4;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=2;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=12;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=100;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;
    //*/

    #16000;
    reset = ~reset;
    #16000;
    reset = ~reset;

    //for issue
    ///*
    #freq read_enable=0; bus_value=1;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=1;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=23;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=100;
    #freq read_enable=1;

    #freq read_enable=0; bus_value=0;
    #freq read_enable=1;
    //*/

    #freq #freq #freq #30000;
    //$display("%d", rec.updated_value);
    $finish;




end

always #tick_time ticker <= ~ticker;
always #clk_time clock <= ~clock;
endmodule