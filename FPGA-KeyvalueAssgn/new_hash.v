`timescale 1ns/1ns
`include "hashfunc.v"
module hash_f_tb;
reg [31:0] key;
reg clk;
wire [31:0] hash1;
wire [31:0] hash2;
hashfunc uut(.key(key),.clk(clk), .hash1(hash1), .hash2(hash2));
initial begin
    clk=1;
    #5
    clk=0;
    #5
   clk=1;
    #5
    clk=0;
    #5
    clk=1;
end
//always @(posedge clk) 

initial begin
    /*
    #10;
    key=16;
    
    #10;
    key=44;
    
    #10;
    key=82;
    
    #10;
    key=296;
    
    #10;
    key=249;
    
    #10;
    key=10;
    
    #10;
    key=93;
    
    #10;
    key=777;
    
    #10;
    key=23;
    
    #10;
    key=175;
    
    #10;
    key=100;
    
    #10;
    key=22;
    
    #10;
    key=41;
    
    #10;
    key=104;
    #10;
    key=892;
    */
    #10;
    key = 279;

   // #10;
   // key = 524;

    #10;
    key = 19;

    #10;
    key = 8;

    #10;
    key = 28;

    
end 
endmodule
