`timescale 1ns/1ns
`include "create_bram.v"
module create_bram_tb;

parameter RAM_WIDTH = 32;
parameter RAM_ADDR_BITS = 9;

reg							clk;
reg							ram_enable;
reg							write_enable;
reg							[31:0]key;
reg                         [31:0]value;
reg 						[1:0]signal ;
reg							[31:0]transact_value;
reg							transact_kind;
wire						[31:0]updated_value;
wire						[31:0]value_addr;

reg[31:0] i;

create_bram
#(
	.RAM_WIDTH 		(RAM_WIDTH 		),
	.RAM_ADDR_BITS 	(RAM_ADDR_BITS 	),
	//.KEY_FILE 		("keyvalue.txt"),
	.HASH_1_FILE	("hashtable1_key.txt"),
	.HASH_2_FILE	("hashtable2_key.txt"),
	.HASH_1_VALADD_FILE	("hashtable1_valadd.txt"),
	.HASH_2_VALADD_FILE	("hashtable2_valadd.txt"),
	.VALUE_FILE		("value_valueadd.txt"),
	//.KEY_INIT_START_ADDR(0				),
	//.KEY_INIT_END_ADDR	(14			    ),
	.HASH_1_INIT_START_ADDR (0	),
	.HASH_1_INIT_END_ADDR(11),
	.HASH_2_INIT_START_ADDR(0),
	.HASH_2_INIT_END_ADDR(22),
	.HASH_1_VALADD_INIT_START_ADDR (0	),
	.HASH_1_VALADD_INIT_END_ADDR(11),
	.HASH_2_VALADD_INIT_START_ADDR(0),
	.HASH_2_VALADD_INIT_END_ADDR(22),
	.VALUE_INIT_START_ADDR(0),
	.VALUE_INIT_END_ADDR(18)
)
create_bram_inst
(
	.clock			(clk			),
	.ram_enable		(ram_enable		),
	.write_enable	(write_enable	),
	.key			(key			),
	.signal			(signal			),
	.transact_value	(transact_value	),
	.transact_kind	(transact_kind	),
	.value_addr		(value_addr		),
	.updated_value	(updated_value	),
	.value          (value          )
);
	
initial
begin
	$dumpfile("create_bram_2.vcd");
	$dumpvars(0, create_bram_tb);
	clk = 1;
    i <= 0;
	
	#16000;
	$finish;
	 
end

always begin
	clk <= ~clk;
	#1;
end

initial
begin
	
	
	ram_enable		<= 1;
	write_enable	<= 0;

	#100;
    
	signal<=0;
	key<=249;
	transact_value<=0;
	transact_kind<=0;
	#100;
    #100;
	$display("%d", updated_value);
    $display("tested search");
    #100;
    
    signal<=0;
	key<=892;
	#100;
    #100;
	$display("%d", updated_value);
    $display("tested search");

    key<= 249;
    signal <= 2;
    transact_kind<= 1;
    transact_value<= 100;
    #100;
    #100;
	$display("%d - updated value", updated_value);
	$display("tested transact");
    
    key<= 249;
    signal <= 2;
    transact_kind<= 0;
    transact_value<= 100;
    #100;
    #100;
	$display("%d - updated value", updated_value);
	$display("tested transact");
    
    #100;
    key<= 524;
    signal<= 1;
    value<= 3423;
    #200;
	
end

endmodule
						