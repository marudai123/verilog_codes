`timescale 1ns / 1ps



module decoder(
    
    input [2:0] a,
    input en,
    output reg [7:0] y
    );
    
    always@(*)
        begin
            y = 8'b00000000;
                if(en)
                    begin
                        case(a)
                        
                        3'b000 : y =  8'b00000001;
                        3'b001 : y =  8'b00000010;
                        3'b010 : y =  8'b00000100;
                        3'b011 : y =  8'b00001000;
                        3'b100 : y =  8'b00010000;
                        3'b101 : y =  8'b00100000;
                        3'b110 : y =  8'b01000000;
                        3'b111 : y =  8'b10000000;
                       default : y =  8'b00000000; 
                        
                        endcase
                    end
                
                else
                
                    y = 8'b00000000; 
                     
        end
                                                
    
endmodule


`timescale 1ns / 1ps

module decoder_tb;

    // Testbench signals
    reg [2:0] a;
    reg en;
    wire [7:0] y;

    // DUT instantiation
    decoder dut (
        .a(a),
        .en(en),
        .y(y)
    );

    // Test cases
    initial
    begin
        // Enable = 1
        en = 1'b1;

        a = 3'b000;
        #10;
        a = 3'b001;
        #10;
        a = 3'b010;
        #10;
        a = 3'b011;
        #10;
        a = 3'b100;
        #10;
        a = 3'b101;
        #10;
        a = 3'b110;
        #10;
        a = 3'b111; #10;

        // Enable = 0
        en = 1'b0;

        a = 3'b000;
        #10;
        a = 3'b011;
        #10;
        a = 3'b111;
        #10;

        $finish;
    end

    // Display output
    initial
    begin
        $monitor("Time=%0t | EN=%b | A=%b | Y=%b",
                 $time, en, a, y);
    end

endmodule
