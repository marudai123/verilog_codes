`timescale 1ns / 1ps


module mux_8to1 (
    
    input [7:0] a,
    input [2:0] s,
    output reg  y
    );
    
    always@(*)
        begin
            case(s)
                
                3'b000 : y = a[0];
                3'b001 : y = a[1];
                3'b010 : y = a[2];
                3'b011 : y = a[3];
                3'b100 : y = a[4];
                3'b101 : y = a[5];
                3'b110 : y = a[6];
                3'b111 : y = a[7];
                
             endcase
         end
                 
    
    endmodule
    
    
`timescale 1ns / 1ps

module mux_8to1_tb;

    
    reg [7:0] a;
    reg [2:0] s;
    wire y;

   
    mux_8to1 dut (
        .a(a),
        .s(s),
        .y(y)
    );

    
    initial
    begin
        a = 8'b10100110;

        s = 3'b000;
        #10;
        s = 3'b001; 
        #10;
        s = 3'b010; 
        #10;
        s = 3'b011; 
        #10;
        s = 3'b100; 
        #10;
        s = 3'b101; 
        #10;
        s = 3'b110; 
        #10;
        s = 3'b111; 
        #10;

        a = 8'b01011001;

        s = 3'b000; 
        #10;
        s = 3'b001; 
        #10;
        s = 3'b010; 
        #10;
        s = 3'b011; 
        #10;
        s = 3'b100; 
        #10;
        s = 3'b101; 
        #10;
        s = 3'b110; 
        #10;
        s = 3'b111; 
        #10;

        $finish;
    end

    
    initial
    begin
        $monitor("Time=%0t | A=%b | S=%b | Y=%b",
                 $time, a, s, y);
    end

endmodule
    
    
