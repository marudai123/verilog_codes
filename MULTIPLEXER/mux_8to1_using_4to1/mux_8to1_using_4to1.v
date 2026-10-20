`timescale 1ns / 1ps

module mux_2to1(
    
    input [1:0] a,
    input s ,
    output y
   );
 
  assign  y = s ? a[1]:a[0];
  
endmodule

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
    

module mux_8to1_using_4to1(
    
    input [7:0] a,
    input [2:0] s,
    output y

    );
    
    wire [1:0]t;
    
    mux_4to1 b0 (a[3:0],s[1:0],t[0]);
    mux_4to1 b1 (a[7:4],s[1:0],t[1]);
    mux_2to1 b2 (t[1:0],s[2],y);
   
endmodule

`timescale 1ns / 1ps

module mux_8to1_tb;

    
    reg [7:0] a;
    reg [2:0] s;
    wire y;

   
    mux_8to1_using_4to1 dut (
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
    
    

