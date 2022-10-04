module refer (
    input [7:0] byte,
    input newbyt,
    output reg [1:0] signal,
    output reg [31:0] key
);

    reg init1 = 0;
    reg [7:0] packet [11:0];
    reg [3:0] i;
    reg trigger;
    reg init2 = 0;
    reg init3 = 0;
    
    initial begin
        init1 = 0;
        i = 0;
        init2 = 0;
        init3 = 0;
    end

    always@(newbyt) begin
        if(init1 == 0) begin
            init1 = 1;
        end else begin
            if(init2 == 0) begin
                init2 = 1;
            end
            else begin
                //if(init3 == 0) begin
                //    init3 = 1;
                //end
            //$display("refer");
                //else begin
                    if(i < 4) begin
                        //$display("byte %d", byte);
                        //$display("i %d", i);
                        packet[i] = byte;
                        //$display("%d", packet[i]);
                        i = i+1;
                        //$display("%d, new i", i);
                        //$display("I reach here");
                        //$display("%d", packet[i]);
                    end
                    if(i == 4) begin
                        //$display("do i reach here?");
                        trigger = 1;
                        i = i+1;
                    end
                //end
            end
        end
    end

    always@(trigger) begin
        signal= 0;
        key[31:24] = packet[0];
        key[23:16] = packet[1];
        key[15:8] = packet[2];
        key[7:0] = packet[3];
        $display("Referring %d", key);
        //$display("%d", key);
    end

endmodule