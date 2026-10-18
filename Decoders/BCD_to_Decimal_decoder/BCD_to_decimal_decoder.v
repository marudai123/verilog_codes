`timescale 1ns / 1ps



module decoder(
    
    input [3:0] a,
    input en,
    output reg [9:0] dec
    );
    
    
    always@(*)
        begin
            dec = 10'b0000000000;
            
                if(en)
                    begin
                        case(a)
                        4'b0000 : dec[0] = 1'b1;
                        4'b0001 : dec[1] = 1'b1;
                        4'b0010 : dec[2] = 1'b1;
                        4'b0011 : dec[3] = 1'b1;
                        4'b0100 : dec[4] = 1'b1;
                        4'b0101 : dec[5] = 1'b1;
                        4'b0110 : dec[6] = 1'b1;
                        4'b0111 : dec[7] = 1'b1;
                        4'b1000 : dec[8] = 1'b1;
                        4'b1001 : dec[9] = 1'b1;
                        default : dec    = 10'b0000000000;
                        
                        endcase 
                    end
                    
                 else
                    dec = 10'b0000000000;
                 
        end 
     
endmodule


module decoder_tb;

    // Testbench signals
    reg [3:0] a;
    reg en;
    wire [9:0] dec;

    // DUT instantiation
    decoder dut (
        .a(a),
        .en(en),
        .dec(dec)
    );

    initial
    begin
        // Enable = 1: valid BCD inputs
        en = 1'b1;

        a = 4'b0000; #10;  // Decimal 0
        a = 4'b0001; #10;  // Decimal 1
        a = 4'b0010; #10;  // Decimal 2
        a = 4'b0011; #10;  // Decimal 3
        a = 4'b0100; #10;  // Decimal 4
        a = 4'b0101; #10;  // Decimal 5
        a = 4'b0110; #10;  // Decimal 6
        a = 4'b0111; #10;  // Decimal 7
        a = 4'b1000; #10;  // Decimal 8
        a = 4'b1001; #10;  // Decimal 9

        // Invalid BCD input
        a = 4'b1010; #10;

        // Enable = 0
        en = 1'b0;
        a = 4'b0101; #10;

        $finish;
    end

    // Display output
    initial
    begin
        $monitor("Time=%0t | EN=%b | A=%b | DEC=%b",
                 $time, en, a, dec);
    end

endmodule