`include "receiver.v"
`include "refer.v"
`include "issue.v"
`include "transfer.v"
`include "create.v"
`include "create_bram.v"

module extractor (
    input dcom,
    input clk,
    input tick_in,
    input reset
);

    parameter RAM_WIDTH = 32;
    parameter RAM_ADDR_BITS = 9;

    wire [7:0] bus;
    wire newbyt;
    integer i;
    integer init;
    integer flag;
    reg [8:0] ref_a;
    reg [8:0] isu_a;
    reg [8:0] crt_a;
    reg [8:0] tfr_a;
    wire [7:0] bus_create;
    wire [7:0] bus_issue;
    wire [7:0] bus_refer;
    wire [7:0] bus_transfer;
    wire newbyt_crt;
    wire newbyt_ref;
    wire newbyt_isu;
    wire newbyt_tfr;
    wire [31:0]value_addr;

    reg [1:0] signal;
    reg [31:0] key;
    reg [31:0] value;
    wire [31:0] updated_value;
    reg [31:0] transact_value;
    reg transact_kind;

    wire [1:0] signal_isu;
    wire [31:0] key_isu;
    wire [31:0] value_isu;
    wire [31:0] transact_value_isu;
    wire transact_kind_isu;

    wire [1:0] signal_ref;
    wire [31:0] key_ref;
    wire [31:0] value_ref;
    wire [31:0] transact_value_ref;
    wire transact_kind_ref;

    wire [1:0] signal_crt;
    wire [31:0] key_crt;
    wire [31:0] value_crt;
    wire [31:0] transact_value_crt;
    wire transact_kind_crt;

    wire [1:0] signal_tfr;
    wire [31:0] key_tfr;
    wire [31:0] value_tfr;
    wire [31:0] transact_value_tfr;
    wire transact_kind_tfr;

    assign bus_create[0] = bus[0] & crt_a[0];
    assign bus_create[1] = bus[1] & crt_a[1];
    assign bus_create[2] = bus[2] & crt_a[2];
    assign bus_create[3] = bus[3] & crt_a[3];
    assign bus_create[4] = bus[4] & crt_a[4];
    assign bus_create[5] = bus[5] & crt_a[5];
    assign bus_create[6] = bus[6] & crt_a[6];
    assign bus_create[7] = bus[7] & crt_a[7];
    assign newbyt_crt = newbyt & crt_a[8];
    assign bus_issue[0] = bus[0] & isu_a[0];
    assign bus_issue[1] = bus[1] & isu_a[1];
    assign bus_issue[2] = bus[2] & isu_a[2];
    assign bus_issue[3] = bus[3] & isu_a[3];
    assign bus_issue[4] = bus[4] & isu_a[4];
    assign bus_issue[5] = bus[5] & isu_a[5];
    assign bus_issue[6] = bus[6] & isu_a[6];
    assign bus_issue[7] = bus[7] & isu_a[7];
    assign newbyt_isu = newbyt & isu_a[8];
    assign bus_refer[0] = bus[0] & ref_a[0];
    assign bus_refer[1] = bus[1] & ref_a[1];
    assign bus_refer[2] = bus[2] & ref_a[2];
    assign bus_refer[3] = bus[3] & ref_a[3];
    assign bus_refer[4] = bus[4] & ref_a[4];
    assign bus_refer[5] = bus[5] & ref_a[5];
    assign bus_refer[6] = bus[6] & ref_a[6];
    assign bus_refer[7] = bus[7] & ref_a[7];
    assign newbyt_ref = newbyt & ref_a[8];
    assign bus_transfer[0] = bus[0] & tfr_a[0];
    assign bus_transfer[1] = bus[1] & tfr_a[1];
    assign bus_transfer[2] = bus[2] & tfr_a[2];
    assign bus_transfer[3] = bus[3] & tfr_a[3];
    assign bus_transfer[4] = bus[4] & tfr_a[4];
    assign bus_transfer[5] = bus[5] & tfr_a[5];
    assign bus_transfer[6] = bus[6] & tfr_a[6];
    assign bus_transfer[7] = bus[7] & tfr_a[7];
    assign newbyt_tfr = newbyt & tfr_a[8];

    reciever rec(dcom, clk, tick_in, bus, newbyt);

    refer ref(bus_refer, newbyt_ref, signal_ref, key_ref);
    create crt(bus_create, newbyt_crt, signal_crt, key_crt, value_crt, tick_in);
    issue isu(bus_issue, newbyt_isu, signal_isu, key_isu, transact_kind_isu, transact_value_isu, tick_in);
    transfer tfr(bus_transfer, newbyt_tfr, signal_tfr, key_tfr, transact_kind_tfr, transact_value_tfr, tick_in);

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
    
    initial begin
        init <= 0;
        i <= 0;
        ref_a <= 0;
        isu_a <= 0;
        crt_a <= 0;
        tfr_a <= 0;
        flag <=0;
    end

    always@(bus) begin
        if(bus == 4 && flag == 0) begin
            //create
            crt_a <= 511;
            flag <= 1;
        end
        if(bus == 1 && flag == 0) begin
            //issue
            isu_a <= 511;
            flag <= 1;
        end
        if(bus == 2 && flag == 0) begin
            //transfer
            tfr_a <= 511;
            flag <= 1;
        end
        if(bus == 3 && flag == 0) begin
            //refer
            ref_a <= 511;
            flag <= 1;
        end
    end

    always@(negedge reset) begin
        init <= 0;
        i <= 0;
        ref_a <= 0;
        isu_a <= 0;
        crt_a <= 0;
        tfr_a <= 0;
        flag <=0;
        signal <= 2'bzz;
        key <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
        transact_value <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
        transact_kind <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
        value <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
    end

    always@(signal_ref or key_ref) begin
        signal = signal_ref;
        key = key_ref;
    end

    always@(signal_crt or key_crt or value_crt) begin
        signal = signal_crt;
        key = key_crt;
        value = value_crt;
    end

    always@(signal_isu or key_isu or transact_value_isu or transact_kind_isu) begin
        signal = signal_isu;
        key = key_isu;
        transact_value = transact_value_isu;
        transact_kind = transact_kind_isu;
    end

    always@(signal_tfr or key_tfr or transact_value_tfr or transact_kind_tfr) begin
        signal = signal_tfr;
        key = key_tfr;
        transact_value = transact_value_tfr;
        transact_kind = transact_kind_tfr;
    end

endmodule