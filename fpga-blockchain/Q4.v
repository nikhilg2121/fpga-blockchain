module eight_bit_comp (input [7:0] a , input [7:0] b , output equal , output a_greater , output b_greater);
wire [7:0] e , a_g , b_g; 
wire [6:0] flag;
wire t;
one_bit_comp op7 (a[7] , b[7] ,    1'b0 , e[7] , a_g[7] , b_g[7] , flag[6] );
one_bit_comp op6 (a[6] , b[6] , flag[6] , e[6] , a_g[6] , b_g[6] , flag[5] );
one_bit_comp op5 (a[5] , b[5] , flag[5] , e[5] , a_g[5] , b_g[5] , flag[4] );
one_bit_comp op4 (a[4] , b[4] , flag[4] , e[4] , a_g[4] , b_g[4] , flag[3] );
one_bit_comp op3 (a[3] , b[3] , flag[3] , e[3] , a_g[3] , b_g[3] , flag[2] );
one_bit_comp op2 (a[2] , b[2] , flag[2] , e[2] , a_g[2] , b_g[2] , flag[1] );
one_bit_comp op1 (a[1] , b[1] , flag[1] , e[1] , a_g[1] , b_g[1] , flag[0] );
last_bit_comp op0 (a[0] , b[0] , flag[0] , e[0] , a_g[0] , b_g[0]  );

ORer or1 (.a(e) , .result(t));
assign equal=~t;
ORer or2 (a_g , a_greater);
ORer or3 (b_g , b_greater);

endmodule

module one_bit_comp (input a , input b , input c, output equal , output a_greater , output b_greater ,
                     output cout );

wire t;
assign t=(a^b);
assign equal=t;
assign a_greater=(~c)&(a&t) ;
assign b_greater=(~c)&(b&t) ;
assign cout=c|t;

endmodule

module last_bit_comp (input a , input b , input c, output equal , output a_greater , output b_greater );

wire t;
assign t=(a^b);
assign equal=t;
assign a_greater=(~c)&(a&t) ;
assign b_greater=(~c)&(b&t) ;

endmodule

module ORer (input [7:0] a , output result);
assign result = a[0]|a[1]|a[2]|a[3]|a[4]|a[5]|a[6]|a[7];
endmodule