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
    
    
    
`timescale 1ns / 1ps

module mux_4to1_tb;

   
    reg [3:0] a;
    reg [1:0] s;
    wire y;

    
    mux_4to1 dut (
        .a(a),
        .s(s),
        .y(y)
    );

   
    initial
    begin
        
        a = 4'b0001;
        s = 2'b00; 
        #10;
        
        a = 4'b0010; 
        s = 2'b01; 
        #10;
        
        a = 4'b0100; 
        s = 2'b10; 
        #10;
        
        a = 4'b1000; 
        s = 2'b11; 
        #10;

        
        a = 4'b1110; 
        s = 2'b00; 
        #10;
        
        a = 4'b1101; 
        s = 2'b01; 
        #10;
        
        a = 4'b1011; 
        s = 2'b10; 
        #10;
        
        a = 4'b0111; 
        s = 2'b11; 
        #10;

        $finish;
    end

    
    initial
    begin
        $monitor("Time=%0t | A=%b | S=%b | Y=%b",
                 $time, a, s, y);
    end

endmodule