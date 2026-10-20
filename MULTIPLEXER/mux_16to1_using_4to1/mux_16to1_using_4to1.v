`timescale 1ns / 1ps



module mux_4to1 (
    
    input [3:0] a,
    input [1:0] s,
    output reg y
    );
    
    always@(*)
        begin
            case(s)
                
                2'b00: y = a[0];
                2'b01: y = a[1];
                2'b10: y = a[2];
                2'b11: y = a[3];
                
             endcase
         end
                 
    
    endmodule
    

module mux_16to1_using_4to1(
    
    input [15:0] a,
    input [3:0] s,
    output y

    );
    
    wire [3:0]t;
    
    mux_4to1 b0 (a[3:0],s[1:0],t[0]);
    mux_4to1 b1 (a[7:4],s[1:0],t[1]);
    mux_4to1 b2 (a[11:8],s[1:0],t[2]);
    mux_4to1 b3 (a[15:12],s[1:0],t[3]);
    mux_4to1 b4 (t[3:0],s[3:2],y);
    
endmodule



module mux_16to1_using_4to1_tb;

    reg [15:0] a;
    reg [3:0] s;
    wire y;

  
    mux_16to1_using_4to1 dut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial
    begin
        
        a = 16'b1010010111000011;

        s = 4'b0000; 
        #10;
        s = 4'b0001; 
        #10;
        s = 4'b0010; 
        #10;
        s = 4'b0011; 
        #10;
        s = 4'b0100; 
        #10;
        s = 4'b0101; 
        #10;
        s = 4'b0110; 
        #10;
        s = 4'b0111; 
        #10;
        s = 4'b1000; 
        #10;
        s = 4'b1001; 
        #10;
        s = 4'b1010; 
        #10;
        s = 4'b1011; 
        #10;
        s = 4'b1100; 
        #10;
        s = 4'b1101; 
        #10;
        s = 4'b1110; 
        #10;
        s = 4'b1111; 
        #10;

        
        a = 16'b0101101000111100;

        s = 4'b0000; 
        #10;
        s = 4'b0101; 
        #10;
        s = 4'b1010; 
        #10;
        s = 4'b1111; 
        #10;

        $finish; 
    end

    
    initial
    begin
        $monitor("Time=%0t | A=%b | S=%b | Y=%b",
                 $time, a, s, y);
    end

endmodule
    

