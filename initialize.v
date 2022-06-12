module initialize();
 reg [7:0] a [9:0];
reg  [7:0] b [9:0];
integer i;
initial begin
for(i=0;i<10;i++) begin
  a[i]<=0;
  b[i]<=0;
end 
 
 a[0]<=19; 
 a[1]<=16; 
 a[2]<=32; 
 a[4]<=58; 
 a[6]<=53; 
 a[7]<=26; 
 b[0]<=10; 
 b[2]<=91; 
 b[4]<=75; 
 b[6]<=6;
 end

endmodule
