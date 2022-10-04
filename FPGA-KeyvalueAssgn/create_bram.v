`timescale 1ns/1ns
//`include "hashfunc.v"
module create_bram
	#(
		parameter RAM_WIDTH 		= 32,
		parameter RAM_ADDR_BITS 	= 9,
      parameter HASH_1_FILE      = "hashtable1_key.txt",
      parameter HASH_2_FILE      = "hashtable2_key.txt",
      parameter HASH_1_VALADD_FILE = "hashtable1_valadd.txt",
      parameter HASH_2_VALADD_FILE = "hashtable2_valadd.txt",
      parameter VALUE_FILE = "value_valueadd.txt",
      parameter HASH_1_INIT_START_ADDR 	= 0,
		parameter HASH_1_INIT_END_ADDR		= 11,
      parameter HASH_2_INIT_START_ADDR 	= 0,
		parameter HASH_2_INIT_END_ADDR		= 22,
      parameter HASH_1_VALADD_INIT_START_ADDR 	= 0,
		parameter HASH_1_VALADD_INIT_END_ADDR		= 11,
      parameter HASH_2_VALADD_INIT_START_ADDR 	= 0,
		parameter HASH_2_VALADD_INIT_END_ADDR		= 22,
      parameter VALUE_INIT_START_ADDR = 0,
      parameter VALUE_INIT_END_ADDR = 18
      
	)
	(
	input							clock,
	input							ram_enable,
	input							write_enable,
   input                   [31:0] key,
   input                   [31:0] value,
   input                   [1:0]signal,
   input                   [31:0] transact_value,
   input                   transact_kind,
   output              reg [31:0] value_addr,
   output              reg [31:0] updated_value
	);
   

   reg [31:0] key_in;
   reg [31:0] key_temp;
   //wire [31:0] hash1;
   //wire [31:0] hash2;
   reg [31:0] hash1;
   reg [31:0] hash2;
   integer i;
   reg term_flag;
   reg [31:0] val_add_temp1;
   reg [31:0] val_add_temp2;

   //hashfunc aat(.key(key_in), .hash1(hash1), .hash2(hash2));

   (* RAM_STYLE="BLOCK" *)
   reg [RAM_WIDTH-1:0] ram_name_HASH_1 [(2**RAM_ADDR_BITS)-1:0];
   (* RAM_STYLE="BLOCK" *)
   reg [RAM_WIDTH-1:0] ram_name_HASH_2 [(2**RAM_ADDR_BITS)-1:0];
   (* RAM_STYLE="BLOCK" *)
   reg [RAM_WIDTH-1:0] ram_name_HASH_1_VALADD [(2**RAM_ADDR_BITS)-1:0];
   (* RAM_STYLE="BLOCK" *)
   reg [RAM_WIDTH-1:0] ram_name_HASH_2_VALADD [(2**RAM_ADDR_BITS)-1:0];
   (* RAM_STYLE="BLOCK" *)
   reg [RAM_WIDTH-1:0] ram_name_VALUE [(2**RAM_ADDR_BITS)-1:0];



   //  The forllowing code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial begin
      $readmemh(HASH_1_FILE, ram_name_HASH_1, HASH_1_INIT_START_ADDR, HASH_1_INIT_END_ADDR);
      $readmemh(HASH_2_FILE, ram_name_HASH_2, HASH_2_INIT_START_ADDR, HASH_2_INIT_END_ADDR);
      $readmemh(HASH_1_VALADD_FILE, ram_name_HASH_1_VALADD, HASH_1_VALADD_INIT_START_ADDR, HASH_1_VALADD_INIT_END_ADDR);
      $readmemh(HASH_2_VALADD_FILE, ram_name_HASH_2_VALADD, HASH_2_VALADD_INIT_START_ADDR, HASH_2_VALADD_INIT_END_ADDR);
      $readmemh(VALUE_FILE, ram_name_VALUE, VALUE_INIT_START_ADDR, VALUE_INIT_END_ADDR);
   end
    
   always @(key or signal or transact_kind or transact_value) begin
      key_in = key;
      hash1=((((key_in*91)%100)*11)-(((key_in*91)%100)*11)%100)/100;
      hash2=((((key_in*45)%100)*22)-(((key_in*45)%100)*22)%100)/100;
      //#10;
      
      /*
      $display("showing RAM status");
      $display("hash table1");
      for(i = 0; i<11; i= i+1) begin
          $display("%d    %d", ram_name_HASH_1[i], ram_name_HASH_1_VALADD[i]);
      end
      $display("hash table2");
      for(i = 0; i<22; i= i+1) begin
          $display("%d    %d", ram_name_HASH_2[i], ram_name_HASH_2_VALADD[i]);
      end
      $display("valadd    val");
      for(i= 0; i<25; i = i+1) begin
          $display("%d    %d", i, ram_name_VALUE[i]);
      end
      */

      if (signal==0) begin
         //search
         //$display("reached signal if");
         if(ram_name_HASH_1[hash1] == key) begin
            //$display("reached the wrong place");
            value_addr = ram_name_HASH_1_VALADD[hash1];
            updated_value = ram_name_VALUE[value_addr];
         end
         else begin
            //$display("%d", hash2);
            //$display("%d", ram_name_HASH_2[hash2]);
            if(ram_name_HASH_2[hash2] == key) begin
               //$display("reached the correct place");
               value_addr = ram_name_HASH_2_VALADD[hash2];
               updated_value = ram_name_VALUE[value_addr];
            end
            else begin
               //$display("reached a place wayy wrong");
            end
         end
      end else begin
         //$display("here i am");
        if (signal==1) begin
         //$display("detected insert command");
         //$display("%d", ram_name_VALUE[0]);
         for(i = 1; ram_name_VALUE[i] != 0; i= i+1) begin
            //$display("entered index search loop");
         end

         ram_name_VALUE[i] = value;
         //$display("%d ramnamevalue16, %d = i", ram_name_VALUE[i], i );
         val_add_temp1 = i;

         //insert
         term_flag = 0;
            for( i = 0; i<11 && term_flag == 0; i = i+1) begin
               //$display("entered loop");
               if(ram_name_HASH_1[hash1] == 0) begin
                  //$display("reached hash1 check");
                  ram_name_HASH_1[hash1] = key_in;
                  ram_name_HASH_1_VALADD[hash1] = val_add_temp1;
                  term_flag = 1;
                  //$display("%d", ram_name_HASH_1[hash1]);
                  //$display("%d", val_add_temp1);
                  updated_value =  ram_name_VALUE[ram_name_HASH_1_VALADD[hash1]];


                  /*
                  $display("showing RAM status");
                  $display("hash table1");
                  for(i = 0; i<11; i= i+1) begin
                      $display("%d    %d", ram_name_HASH_1[i], ram_name_HASH_1_VALADD[i]);
                  end
                  $display("hash table2");
                  for(i = 0; i<22; i= i+1) begin
                      $display("%d    %d", ram_name_HASH_2[i], ram_name_HASH_2_VALADD[i]);
                  end
                  $display("valadd    val");
                  for(i= 0; i<25; i = i+1) begin
                      $display("%d    %d", i, ram_name_VALUE[i]);
                  end
                  */


               end
               else begin
                  //$display("went here");
                  key_temp = ram_name_HASH_1[hash1];
                  val_add_temp2 = ram_name_HASH_1_VALADD[hash1];
                  ram_name_HASH_1[hash1] = key_in;
                  ram_name_HASH_1_VALADD[hash1] = val_add_temp1;
                  //$display("%d", hash2);
                  //$display("%d", key_in);

                  key_in = key_temp;
                  //#10;
                  hash1=((((key_in*91)%100)*11)-(((key_in*91)%100)*11)%100)/100;
                  hash2=((((key_in*45)%100)*22)-(((key_in*45)%100)*22)%100)/100;
                  //$display("%d", hash2);
                  //$display("%d", key_in);
                  val_add_temp1 = val_add_temp2;
                  if(ram_name_HASH_2[hash2] == 0) begin
                     //$display("and here");
                     ram_name_HASH_2[hash2] = key_in;
                     ram_name_HASH_2_VALADD[hash2] = val_add_temp1;
                     term_flag = 1;
                     updated_value =  ram_name_VALUE[ram_name_HASH_2_VALADD[hash2]];


                     /*
                     $display("showing RAM status");
                     $display("hash table1");
                     for(i = 0; i<11; i= i+1) begin
                         $display("%d    %d", ram_name_HASH_1[i], ram_name_HASH_1_VALADD[i]);
                     end
                     $display("hash table2");
                     for(i = 0; i<22; i= i+1) begin
                         $display("%d    %d", ram_name_HASH_2[i], ram_name_HASH_2_VALADD[i]);
                     end
                     $display("valadd    val");
                     for(i= 0; i<25; i = i+1) begin
                         $display("%d    %d", i, ram_name_VALUE[i]);
                     end
                     */


                  end
                  else begin
                     key_temp = ram_name_HASH_2[hash2];
                     val_add_temp2 = ram_name_HASH_2_VALADD[hash2];
                     ram_name_HASH_2[hash2] = key_in;
                     ram_name_HASH_2_VALADD[hash2] = val_add_temp1;
                     key_in = key_temp;
                     //#10;
                     hash1=((((key_in*91)%100)*11)-(((key_in*91)%100)*11)%100)/100;
                     hash2=((((key_in*45)%100)*22)-(((key_in*45)%100)*22)%100)/100;
                     val_add_temp1 = val_add_temp2;
                  end
               end
            end
            $display("showing RAM status");
            $display("hash table1");
            for(i = 0; i<11; i= i+1) begin
                $display("%d    %d", ram_name_HASH_1[i], ram_name_HASH_1_VALADD[i]);
            end
            $display("hash table2");
            for(i = 0; i<22; i= i+1) begin
                $display("%d    %d", ram_name_HASH_2[i], ram_name_HASH_2_VALADD[i]);
            end
            $display("valadd    val");
            for(i= 0; i<25; i = i+1) begin
                $display("%d    %d", i, ram_name_VALUE[i]);
            end

         end else begin
          //transact
          //$display("reached transact");
            if(transact_kind == 1) begin
               //$display("reached the correct transact kind");
               if(ram_name_HASH_1[hash1] == key) begin
                  value_addr = ram_name_HASH_1_VALADD[hash1];
                  updated_value = ram_name_VALUE[value_addr] + transact_value;
                  ram_name_VALUE[value_addr] = updated_value;                  
               end
               else begin
                  if(ram_name_HASH_2[hash2] == key) begin
                     value_addr = ram_name_HASH_2_VALADD[hash2];
                     //$display("reached the right place");
                     updated_value = ram_name_VALUE[value_addr] + transact_value;
                     ram_name_VALUE[value_addr] = updated_value;
                  end
                  else begin
                     //$display("transact-wrong place");
                  end
               end
            end

            if(transact_kind == 0) begin
               //$display("reached the correct transact kind");
               if(ram_name_HASH_1[hash1] == key) begin
                  value_addr = ram_name_HASH_1_VALADD[hash1];
                  updated_value = ram_name_VALUE[value_addr] - transact_value;
                  ram_name_VALUE[value_addr] = updated_value;                  
               end
               else begin
                  if(ram_name_HASH_2[hash2] == key) begin
                     value_addr = ram_name_HASH_2_VALADD[hash2];
                     //$display("reached the right place");
                     updated_value = ram_name_VALUE[value_addr] - transact_value;
                     ram_name_VALUE[value_addr] = updated_value;
                  end
               end
            end
         end     
      end




   

   end
      
      

endmodule
						