`timescale 1ns / 1ps



module  even_parity_checker_using_decoder_3to8(
    
    input [2:0] a,
    input  en,
    output reg [7:0] y,
    output Pc
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
        
        
       //parity checker output = Pc
       or go (Pc,y[1],y[2],y[4],y[7]);
       
endmodule

`timescale 1ns / 1ps

module even_parity_checker_using_decoder_3to8_tb;

    reg [2:0] a;
    reg en;

    wire [7:0] y;
    wire Pc;

    // DUT instantiation
    even_parity_checker_using_decoder_3to8 dut (
        .a(a),
        .en(en),
        .y(y),
        .Pc(Pc)
    );

    initial
    begin
        // Enable = 1: test all 8 combinations
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
        a = 3'b111; 
        #10;

        // Enable = 0
        en = 1'b0;
        a = 3'b101; 
        #10;

        $finish;
    end

    // Display results
    initial
    begin
        $monitor("Time=%0t | EN=%b | A=%b | Y=%b | Pc=%b",
                 $time, en, a, y, Pc);
    end

endmodule

