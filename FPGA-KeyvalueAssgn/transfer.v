module transfer (
    input [7:0] byte,
    input newbyt,
    output reg [1:0] signal,
    output reg [31:0] key,
    output reg transact_kind,
    output reg [31:0] transact_value,
    input tick_in
);

    reg init1 = 0;
    reg [7:0] packet [11:0];
    reg [3:0] i;
    reg trigger;
    reg init2 = 0;
    reg init3 = 0;
    reg init_trig = 0;
    integer doneflag;
    integer doneflag2;
    wire ticktock;

    assign ticktock = tick_in & trigger;
    
    initial begin
        init1 = 0;
        i = 0;
        init2 = 0;
        init3 = 0;
        doneflag = 0;
        doneflag2 = 0;
        trigger = 0;
    end

    always@(newbyt) begin
        if(init1 == 0) begin
            init1 = 1;
        end else begin
            if(init2 == 0) begin
                init2 = 1;
            end
            else begin
            //    if(init3 == 0) begin
            //        init3 = 1;
            //    end
            //$display("refer");
                //else begin
                    if(i < 12) begin
                        //$display("byte %d", byte);
                        //$display("i %d", i);
                        packet[i] = byte;
                        //$display("%d", packet[i]);
                        i = i+1;
                        //$display("%d, new i", i);
                        //$display("I reach here");
                        //$display("%d", packet[i]);
                    end
                    if(i == 12) begin
                        //$display("do i reach here?");
                        trigger = 1;
                        i=i+1;
                    end
                //end
            end
        end
    end

    always@(ticktock) begin
        //$display("hi");
        if(init_trig == 0) begin
            init_trig =1;
        end
        else begin
        if(doneflag == 0) begin
            //$display("hello");
        signal= 2;
        transact_kind = 0;
        key[31:24] = packet[0];
        key[23:16] = packet[1];
        key[15:8] = packet[2];
        key[7:0] = packet[3];
        transact_value[31:24] = packet[8];
        transact_value[23:16] = packet[9];
        transact_value[15:8] = packet[10];
        transact_value[7:0] = packet[11];
        $display("Debited from key %d an amount of %d", key, transact_value);
        $display("Remaining balance:");
        //$display("%d", key);
        //$display("amount %d to", transact_value);
        doneflag = 1;
        end
        else begin
        if(doneflag2 == 0) begin
        signal = 2;
        transact_kind = 1;
        key[31:24] = packet[4];
        key[23:16] = packet[5];
        key[15:8] = packet[6];
        key[7:0] = packet[7];
        transact_value[31:24] = packet[8];
        transact_value[23:16] = packet[9];
        transact_value[15:8] = packet[10];
        transact_value[7:0] = packet[11];
        $display("Credited to key %d", key);
        $display("New balance:");
        doneflag2 = 1;
        end
        end
        end
    end

endmodule