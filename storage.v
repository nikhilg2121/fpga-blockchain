module storage();
reg [7:0] c[7:0][0:2];
 initial begin
 c[0][0]<=0;
 c[0][1]<=0;
 c[0][2]<=19;

 c[1][0]<=1;
 c[1][1]<=0;
 c[1][2]<=16;


 c[2][0]<=1;
 c[2][1]<=2;
 c[2][2]<=91;

 c[3][0]<=4;
 c[3][1]<=0;
 c[3][2]<=10;

 c[4][0]<=4;
 c[4][1]<=2;
 c[4][2]<=58;

 c[5][0]<=5;
 c[5][1]<=6;
 c[5][2]<=6;

 c[6][0]<=6;
 c[6][1]<=6;
 c[6][2]<=53;

 c[7][0]<=7;
 c[7][1]<=8;
 c[7][2]<=26;
 end
endmodule



