module initialize(input [7:0] a1 [9:0];
input [7:0] b1 [9:0];
);
integer i;
for(i=0;i<10;i++) begin
  a[i]<=0;
  b[i]<=0;
end
assign a[0]=19;
assign a[1]=16;
assign a[5]=100;
assign a[7]=2;
assign a[9]=26;
assign b[0]=10;
assign b[2]=91;
assign b[4]=75;
assign b[6]=6;


endmodule