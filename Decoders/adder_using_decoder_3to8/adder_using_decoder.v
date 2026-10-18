`timescale 1ns / 1ps



module  adder_using_decoder_3to8(
    
    input [2:0] a,
    input en,
    output reg [7:0] y,
    output sum,
    output carry
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
        
        
      //sum 
       or g0 (sum,y[1],y[2],y[4],y[7]);
      //carry
      or g1 (carry,y[3],y[5],y[6],y[7]);  
endmodule



`timescale 1ns / 1ps

module adder_using_decoder_3to8_tb;

    reg [2:0] a;
    reg en;

    wire [7:0] y;
    wire sum;
    wire carry;

    // DUT instantiation
    adder_using_decoder_3to8 dut (
        .a(a),
        .en(en),
        .y(y),
        .sum(sum),
        .carry(carry)
    );

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
        a = 3'b111; 
        #10;

        // Enable = 0
        en = 1'b0;
        a = 3'b011;
        #10;
        a = 3'b111; 
        #10;

        $finish;
    end

    // Display results
    initial
    begin
        $monitor("Time=%0t | EN=%b | A=%b | Y=%b | SUM=%b | CARRY=%b",
                 $time, en, a, y, sum, carry);
    end

endmodule

