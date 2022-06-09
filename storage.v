module storage(  input [7:0] a2[8:0][0:2];
);

assign a[0][0]=0;
assign  a[0][1]=0;
assign a[0][2]=19;

assign a[1][0]=1;
assign a[1][1]=0;
assign a[1][2]=16;

assign a[2][0]=1;
assign a[2][1]=2;
assign a[2][2]=91;

assign a[3][0]=4;
assign a[3][1]=0;
assign a[3][2]=10;

assign a[4][0]=4;
assign a[4][1]=2;
assign a[4][2]=58;

assign a[5][0]=5;
assign a[5][1]=6;
assign a[5][2]=6;

assign a[6][0]=6;
assign a[6][1]=6;
assign a[6][2]=53;

assign a[7][0]=7;
assign a[7][1]=8;
assign a[7][2]=26;

endmodule;

